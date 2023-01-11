# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('gamemode-git' 'lib32-gamemode-git')
pkgbase='gamemode-git'
pkgver=r620.06f0193
pkgrel=1
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS."
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
depends=('libinih')
optdepends=('systemd')
makedepends=('meson' 'ninja' 'pkg-config' 'git')
conflicts=('gamemode')
source=("git+https://github.com/FeralInteractive/gamemode.git")
sha256sums=('SKIP')

pkgver() {
    cd gamemode
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  meson gamemode build \
    --prefix /usr \
    --libexecdir /usr/lib/gamemode \
    -Dwith-systemd-user-unit-dir=/usr/lib/systemd/user \
    -Dwith-privileged-group=gamemode
  ninja -C build

  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  meson gamemode build32 --prefix /usr \
  -Dwith-sd-bus-provider=no-daemon \
  -Dwith-examples=false \
  -Dwith-util=false \
  --libdir lib32
  meson compile -C build32
}

package_gamemode-git() {
  DESTDIR=${pkgdir} ninja -C build install
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" gamemode/LICENSE.txt
}

package_lib32-gamemode-git() {
  depends=('gamemode-git' 'lib32-dbus')
  DESTDIR=${pkgdir} ninja -C build32 install
  rm -rf $pkgdir/usr/{include,bin,lib,share}
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" gamemode/LICENSE.txt
}
