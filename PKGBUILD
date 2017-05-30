# Maintainer: Lone_Wolf <lonewolf att xs4all dot nl>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-xdriinfo-git
_gitname=xdriinfo
pkgver=xdriinfo.1.0.5.r3.g9f0b01c
pkgrel=2
pkgdesc="Query configuration information of DRI drivers with glvnd support"
arch=('i686' 'x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libx11' 'libgl')
makedepends=('xorg-util-macros' 'glproto')
provides=('xorg-xdriinfo')
replaces=('xorg-xdriinfo')
conflicts=('xorg-xdriinfo')
groups=('xorg-apps' 'xorg')
source=('git://anongit.freedesktop.org/git/xorg/app/xdriinfo'
        'xdriinfo-1.0.4-glvnd.patch'
        )

sha512sums=('SKIP')

prepare() {
    cd "$_gitname"
    # patch created by hans de goede for Fedora Core mesa=-demos package
    # extracted from source rpm on this page : https://koji.fedoraproject.org/koji/buildinfo?buildID=868167
    patch -Np1 -i ../xdriinfo-1.0.4-glvnd.patch
}

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
