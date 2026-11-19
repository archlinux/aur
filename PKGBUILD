# Maintainer: dragoneki <dragoneki at proton dot me>

# maintainers of 'luanti' package in extra (from which I took most things in this pkgbuild):
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>

pkgbase=luanti-git
pkgname=('luanti-git' 'luanti-server-git' 'luanti-common-git')
pkgver=5.18.0.r42.g8bb14e85d2
pkgrel=1
arch=('x86_64')
url='https://www.luanti.org/'
license=('LGPL-2.1-or-later')
makedepends=('cmake' 'curl' 'freetype2' 'git' 'gmp' 'hicolor-icon-theme' 'hiredis' 'jsoncpp'
             'leveldb' 'libgl' 'libjpeg-turbo' 'libspatialindex' 'libvorbis' 'libxi' 'libzip'
             'luajit' 'ncurses' 'ninja' 'openal' 'postgresql' 'sdl2-compat' 'sqlite')
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
  git describe --long --tags --match '[0-9]*.[0-9]*.[0-9]' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  depends=('curl' 'freetype2' 'gmp' 'hicolor-icon-theme' 'jsoncpp' 'libgl' 'libjpeg-turbo'
           'libspatialindex' 'libvorbis' 'libzip' 'luajit' 'luanti-common-git' 'openal'
           'postgresql-libs' 'sdl2-compat' 'sqlite' 'xdg-utils') # irrlichtmt is bundled (irr/)
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
  depends=('curl' 'gmp' 'hiredis' 'jsoncpp' 'leveldb' 'libspatialindex' 'luajit' 'luanti-common-git'
           'ncurses' 'postgresql-libs' 'sqlite')
  provides=('luanti-server' 'minetest-server')
  conflicts=('luanti-server' 'minetest-server' 'minetest-server-git')
  replaces=('minetest-server' 'minetest-server-git')

  DESTDIR="${pkgdir}" ninja -C build-server install

  # systemd integration
  install -Dm644 "${srcdir}"/luanti/minetest.conf.example \
    "${pkgdir}"/etc/luanti/minetest.conf.example
  install -Dm644 luanti.service "${pkgdir}"/usr/lib/systemd/system/luanti@.service
  install -Dm644 tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/luanti-server.conf
  install -Dm644 sysusers.d "${pkgdir}"/usr/lib/sysusers.d/luanti-server.conf

  # cleanup
  rm -rf "${pkgdir}"/usr/share/{luanti,metainfo,appdata,applications,icons,doc}
  mv "${pkgdir}"/usr/share/man/man6/luanti.6 "${pkgdir}"/usr/share/man/man6/luantiserver.6
}

package_luanti-common-git() {
  pkgdesc='Common data files for luanti and luanti-server (git version)'
  arch=('any')
  license=('LicenseRef-Custom')
  provides=('luanti-common' 'minetest-common')
  conflicts=('luanti-common' 'minetest-common' 'minetest-common-git')
  replaces=('minetest-common' 'minetest-common-git')

  install -d "${pkgdir}"/usr/share/luanti
  cd luanti

  cp -a builtin client fonts textures "${pkgdir}"/usr/share/luanti/
  cp -a "${srcdir}"/build-client/locale "${pkgdir}"/usr/share/luanti/

  install -Dm644 -t "${pkgdir}"/usr/share/luanti/doc \
    doc/{fst_api,lua_api,menu_lua_api,protocol,world_format,client_lua_api,texture_packs}.*

  # devtest
  cp -a games "${pkgdir}"/usr/share/luanti/

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
