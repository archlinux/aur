# Maintainer: Gabor HAUZER <cysp74@gmail.com>

pkgname=fvwm3-git
_pkgname=fvwm3
pkgver=1.1.3.r7.g600017546
pkgrel=1
pkgdesc="A powerful ICCCM2 compliant multiple virtual desktop window manager for X11"
arch=('i686' 'x86_64')
url="http://www.fvwm.org"
license=('GPL')
depends=('fribidi' 'libxpm' 'librsvg' 'libxrandr' 'libevent' 'libxcursor')
makedepends=('git' 'go' 'libxslt' 'asciidoctor' 'xtrans' 'meson' 'cmake' 'libxkbcommon')
optdepends=('perl-tk: for ClickToFocus support'
            'perl-x11-protocol: for ClickToFocus support'
            'python: for fvwm-menu-desktop')
provides=('fvwm')
conflicts=('fvwm')
options=('!emptydirs' '!makeflags')
source=("git+https://github.com/fvwmorg/fvwm3"
        "fvwm3.desktop"
        )
sha256sums=('SKIP'
            'cc2ffc01ec615245252081e3948d4c6ff30d7e71b91d0642b2c5ab529cc39663'
            )

pkgver(){
   cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

   meson setup build --prefix /usr --libexecdir /usr/lib --sysconfdir /etc --wipe --strip \
      -Dbidi=enabled -Dnls=enabled -Diconv=enabled -Dgolang=enabled -Dmandoc=true
   meson compile -C build
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" meson install -C build
  install -d "${pkgdir}/usr/share/doc/${_pkgname}"
  install -D -m644 ../fvwm3.desktop "${pkgdir}/usr/share/xsessions/fvwm3.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
