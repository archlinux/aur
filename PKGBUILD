# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Ysblokje <ysblokje at gmail dot com>

pkgbase=gamemode-git
pkgname=(
  'gamemode-git'
  'lib32-gamemode-git'
)
pkgver=1.8.1.0.g5180d89
pkgrel=1
pkgdesc='A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS.'
arch=('x86_64')
url='https://github.com/FeralInteractive/gamemode.git'
license=('BSD')
makedepends=(
  'meson'
  'ninja'
  'git'
  'libinih'
)
source=('git+https://github.com/FeralInteractive/gamemode.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd gamemode
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  arch-meson gamemode build \
    --prefix /usr \
    --libexecdir /usr/lib/gamemode \
    -Dwith-systemd-user-unit-dir=/usr/lib/systemd/user \
    -Dwith-privileged-group=gamemode

  meson compile -C build

  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  arch-meson gamemode build32 \
    --prefix /usr \
    --libdir lib32 \
    -Dwith-sd-bus-provider=no-daemon \
    -Dwith-examples=false \
    -Dwith-util=false \

  meson compile -C build32
}

package_gamemode-git() {
  pkgdesc+=' (GIT version)'
  depends=(
    'gcc-libs' # libgcc_s.so
    'glibc' # libc.so
    'systemd-libs' 'libsystemd.so'
    'dbus' 'libdbus-1.so'
    'libinih' 'libinih.so'
    'bash'
  )
  provides=(
    'gamemode'
    'libgamemode.so'
    'libgamemodeauto.so'
    )
  conflicts=('gamemode')

  DESTDIR="${pkgdir}" meson install -C build

  install -d -o root -g 102 -m 750 "${pkgdir}/usr/share/polkit-1/rules.d"

  install gamemode/LICENSE.txt -Dm644 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_lib32-gamemode-git() {
  pkgdesc+=' (32-bits)(GIT version)'
  depends=(
    'gamemode-git'
    'lib32-gcc-libs' # libgcc_s.so
    'lib32-glibc' # libc.so
    'lib32-dbus' 'libdbus-1.so'
  )
  provides=(
    'lib32-gamemode'
    'libgamemode.so'
    'libgamemodeauto.so'
  )
  conflicts=('lib32-gamemode')

  DESTDIR="${pkgdir}" meson install -C build32

  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/lib"
  rm -rf "${pkgdir}/usr/share"

  install -Dm644 gamemode/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}LICENSE.txt"
}
