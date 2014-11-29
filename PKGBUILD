# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=acidrip
pkgver=0.14
pkgrel=10
pkgdesc="A Gtk2::Perl application for ripping and encoding DVD's"
arch=('any')
url="http://sourceforge.net/projects/acidrip/"
license=('GPL')
depends=('mplayer' 'lsdvd' 'lame' 'libdvdcss' 'gtk2-perl' 'perl' 'mencoder')
makedepends=('patch')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz
        'acidrip.desktop' 'acidrip.png'
        'crop-fixes.patch' 'xvidencopts.patch')
md5sums=('c1c27bbf658e5c30f43e067a8ae283de'
         'f6896612df224a325d66c5f8fa8553e7'
         '7498602e2a3838cf35b94af85d9954d3'
         '1a8470702e2e0eda8ecbc473141aa08f'
         '8cdf13f4bf0fd7b8c3c6adfd22480706')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  patch -Np1 -i "${srcdir}"/crop-fixes.patch
  patch -Np1 -i "${srcdir}"/xvidencopts.patch

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor INSTALLVENDORSCRIPT=/usr/bin
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"

  install -Dm644 "${srcdir}"/acidrip.png \
      "${pkgdir}"/usr/share/pixmaps/acidrip.png
  install -Dm644 "${srcdir}"/acidrip.desktop \
      "${pkgdir}"/usr/share/applications/acidrip.desktop
}
