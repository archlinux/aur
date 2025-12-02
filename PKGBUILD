# Maintainer: dragoneki <dragoneki at proton dot me>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>

pkgbase=luanti-git
pkgname=('luanti-git' 'luanti-server-git' 'luanti-common-git')
pkgver=5.14.0.r113.gd4c3529af
pkgrel=1
arch=('x86_64')
url='https://www.luanti.org/'
license=('LGPL-2.1-or-later')
makedepends=('sqlite' 'freetype2' 'leveldb' 'postgresql' 'libspatialindex' 'openal' 'libvorbis' 'curl'
             'hicolor-icon-theme' 'cmake' 'ninja' 'hiredis' 'luajit' 'sdl2')
makedepends+=('libjpeg-turbo' 'libgl' 'libxi' 'git')
source=('luanti::git+https://github.com/luanti-org/luanti.git'
        'luanti.service'
        'sysusers.d'
        'tmpfiles.d')
sha256sums=('SKIP'
            'f2614e89c620daccd641b8b047302e73509b78b510631757cf7fa0a332b8f7e7'
            '294283b0686c4d73d816168544ab2f813a7a0ca63fc49da59563a329dd329eed'
            'c9a0c78a49461f56381e5615045d036cd594b741c910129eccf43e475c40cca1')

pkgver() {
  cd luanti
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  rm -rf build-{client,server} && install -d build-{client,server}
}

build() {
  local _cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=Release
    -DENABLE_GETTEXT=1
    -DBUILD_UNITTESTS=0
    -DENABLE_UPDATE_CHECKER=0
  )

  cmake -G Ninja -S luanti -B build-client \
    "${_cmake_options[@]}" \
    -DBUILD_CLIENT=1 \
    -DBUILD_SERVER=0 \
    -DENABLE_LEVELDB=0 \
    -DENABLE_POSTGRESQL=1 \
    -DENABLE_SPATIAL=1 \
    -DENABLE_REDIS=0
  ninja -C build-client

  cmake -G Ninja -S luanti -B build-server \
    "${_cmake_options[@]}" \
    -DBUILD_CLIENT=0 \
    -DBUILD_SERVER=1 \
    -DENABLE_LEVELDB=1 \
    -DENABLE_POSTGRESQL=1 \
    -DENABLE_SPATIAL=1 \
    -DENABLE_REDIS=1
  ninja -C build-server
}

package_luanti-git() {
  pkgdesc='Multiplayer infinite-world block sandbox game (git version)'
  depends=('luanti-common-git' 'curl' 'libvorbis' 'sqlite'
           'openal' 'hicolor-icon-theme' 'desktop-file-utils' 'xdg-utils'
           'freetype2' 'luajit' 'postgresql-libs' 'libspatialindex' 'jsoncpp'
           'libgl' 'libjpeg-turbo' 'libxi') # irrlichtmt
  optdepends=('luanti-server-git: for hosting dedicated servers')
  provides=('luanti' 'minetest')
  conflicts=('luanti' 'minetest' 'minetest-git')
  replaces=('minetest' 'minetest-git')

  DESTDIR="${pkgdir}" ninja -C build-client install

  # remove share (handled by common)
  rm -rf "${pkgdir}"/usr/share/{luanti,doc}
  rm "${pkgdir}"/usr/share/man/man6/luantiserver.6
}

package_luanti-server-git() {
  pkgdesc='Server of infinite-world block sandbox game (git version)'
  depends=('luanti-common-git' 'leveldb' 'curl' 'sqlite' 'hiredis' 'luajit'
           'postgresql-libs' 'libspatialindex' 'jsoncpp')
  provides=('luanti-server' 'minetest-server')
  conflicts=('luanti-server' 'minetest-server' 'minetest-server-git')
  replaces=('minetest-server' 'minetest-server-git')

  DESTDIR="${pkgdir}" ninja -C build-server install

  # systemd integration
  install -d "${pkgdir}"/etc/luanti
  install -Dm644 luanti.service "${pkgdir}"/usr/lib/systemd/system/luanti@.service
  install -Dm644 tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/luanti-server.conf
  install -Dm644 sysusers.d "${pkgdir}"/usr/lib/sysusers.d/luanti-server.conf

  # cleanup
  rm -rf "${pkgdir}"/usr/share/{luanti,metainfo,appdata,applications,icons,doc}
  mv "${pkgdir}"/usr/share/man/man6/luanti.6 "${pkgdir}"/usr/share/man/man6/luantiserver.6
}

package_luanti-common-git() {
  pkgdesc='Common data files for luanti and luanti-server (git version)'
  license=('custom')
  provides=('luanti-common' 'minetest-common')
  conflicts=('luanti-common' 'minetest-common' 'minetest-common-git')
  replaces=('minetest-common' 'minetest-common-git')

  install -d "${pkgdir}"/usr/share/luanti
  cd luanti

  cp -a builtin client fonts textures "${pkgdir}"/usr/share/luanti/
  cp -a "${srcdir}"/build-client/locale "${pkgdir}"/usr/share/luanti/

  for file in doc/{fst_api,lua_api,menu_lua_api,protocol,world_format}.*; do
    install -Dm644 $file "${pkgdir}"/usr/share/luanti/doc/$(basename $file)
  done

  # devtest
  cp -a games "${pkgdir}"/usr/share/luanti/

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
