# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Philippe DUCRETTET <ecolinux@gmx.fr>

pkgname=fvwm-git
_pkgname=fvwm
pkgver=2.6.7.r51.g818c0a93
pkgrel=1
pkgdesc="A powerful ICCCM2 compliant multiple virtual desktop window manager for X11"
arch=('i686' 'x86_64')
url="http://www.fvwm.org"
license=('GPL')
depends=('fribidi' 'libstroke' 'libxpm' 'librsvg' 'libxinerama' 'libxcursor' 'rplay')
makedepends=('git' 'libxslt')
optdepends=('perl-tk: for ClickToFocus support'
            'perl-x11-protocol: for ClickToFocus support'
	    'python: for fvwm-menu-desktop')
provides=('fvwm')
conflicts=('fvwm')
options=('!emptydirs' '!makeflags')
source=("git+https://github.com/fvwmorg/fvwm"
        "fvwm.desktop")
sha256sums=('SKIP'
            '51d345f995f57c6d881d48bf535f71d75041a9bf1f0fa41dd99e1b22fd66aaf3')

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
  install -D -m644 ../fvwm.desktop "${pkgdir}/usr/share/xsessions/fvwm.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
