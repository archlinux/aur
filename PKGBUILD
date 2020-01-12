# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: aksr <aksr at t-com dot me>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Dan Vratil <progdan@progdansoft.com>

pkgbase=vwm
pkgname=('vwm' 'vwm-modules-vwmterm3')
pkgver=3.3.1
pkgrel=1
_commit=606cca3e638430724441b7316409dd2fb43e23fe
pkgdesc="Viper Window Manager"
arch=('i686' 'x86_64')
url="http://www.console-craze.com/hosted-software/vwm/"
license=('GPL')
depends=('protothread' 'libviper>=1.4.5' 'gpm' 'libvterm-vwm' 'libconfig')
makedepends=('cmake' 'git')
source=("git+https://github.com/TragicWarrior/${pkgbase}.git#commit=${_commit}"
        "ncurses-import.patch"
        "protothread-cmake.patch")
sha256sums=('SKIP'
            '989e68bf68ed7756467220e4642c03bf72083c9a0fa0d59aad01571c1d9c2e3a'
            'b76dc417bef0bdbba0a80a3b82c7ec8d0a1ddcf1b5ee8adaf8ba7ae8dde15e22')


prepare() {
  mkdir -p build
  patch -Np0 -i ncurses-import.patch
  patch -Np0 -i protothread-cmake.patch
}

build() {
  cd build
  cmake ../${pkgbase} \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
  #make prefix=/usr -C modules/vwmterm3
}

package_vwm() {
  cd build
  make DESTDIR="${pkgdir}" install
}

package_vwm-modules-vwmterm3() {
  depends=('vwm')
  pkgdesc="terminal shell module for vwm"

  install -Dm755 "$srcdir/${pkgname%%-*}/modules/vwmterm3/vwmterm3.so" \
    "$pkgdir/usr/lib/$pkgname/modules/vwmterm3.so"
}
