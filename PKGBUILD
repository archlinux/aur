# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Philippe DUCRETTET <ecolinux@gmx.fr>

pkgname=fvwm3-git
_pkgname=fvwm3
pkgver=1.0.0.r139.g25768a8e
pkgrel=1
pkgdesc="A powerful ICCCM2 compliant multiple virtual desktop window manager for X11"
arch=('i686' 'x86_64')
url="http://www.fvwm.org"
license=('GPL')
depends=('fribidi' 'libxpm' 'librsvg' 'libxrandr' 'libevent' 'libxcursor' 'rplay' 'mongo-c-driver')
makedepends=('git' 'libxslt' 'mongo-c-driver')
optdepends=('perl-tk: for ClickToFocus support'
            'perl-x11-protocol: for ClickToFocus support'
	           'python: for fvwm-menu-desktop')
provides=('fvwm')
conflicts=('fvwm')
options=('!emptydirs' '!makeflags')
source=("git+https://github.com/fvwmorg/fvwm3"
        "fvwm3.desktop")
sha256sums=('SKIP'
            'cc2ffc01ec615245252081e3948d4c6ff30d7e71b91d0642b2c5ab529cc39663')

pkgver(){
   cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -fiv
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --with-stroke-library \
    --enable-perllib \
    --enable-xinerama \
    --enable-bidi \
    --enable-nls --enable-iconv \
    --enable-xft
  make V=0
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/doc/${_pkgname}"
  install -D -m644 ../fvwm3.desktop "${pkgdir}/usr/share/xsessions/fvwm3.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
