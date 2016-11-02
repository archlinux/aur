# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>

pkgname=clamtk
pkgver=5.23
pkgrel=1
pkgdesc='GUI front-end for ClamAV using Perl and Gtk libraries. It is designed to be an easy-to-use, on-demand scanner for Linux systems'
url='https://dave-theunsub.github.io/clamtk/'
arch=('any')
license=('GPL')
depends=('clamav' 'perl' 'gtk2-perl' 'perl-locale-gettext' 'perl-libwww' 'perl-http-message' 'perl-lwp-protocol-https' 'perl-text-csv' 'perl-json' 'python' 'zenity' 'desktop-file-utils' 'gnome-icon-theme')
source=(https://bitbucket.org/dave_theunsub/clamtk/downloads/clamtk-${pkgver}.tar.gz{,.asc}
        fix-gtk-icon.patch)
sha512sums=('e7728c2e117a626bd725762ed9691ecc27a610bde9e56aca20282db0c9b9c5a6817697663eaa9520dc6db8f6ecf16a01a1fc44a478711127ebda974a1655fe5b'
            'SKIP'
            'a59757d95dc531f96364bcffb57a27840d575623165c180793184cb3eaaca496b66a69d46f7e6913750922e49ba35342e066e14ffa1228cc8b7985e624bee7e1')
validpgpkeys=('5DD47B3B121EE5C354A20305F51D19546ADA59DE') # Dave Mauroni <dave.nerd@gmail.com>

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0 < "${srcdir}/fix-gtk-icon.patch"
}

package() {
  cd ${pkgname}-${pkgver}

  # executable
  install -Dm 755 clamtk "${pkgdir}/usr/bin/clamtk"

  # libs
  for n in lib/* ; do
	  install -Dm 644 $n "${pkgdir}/usr/lib/perl5/vendor_perl/ClamTk/`basename $n`"
  done

  # localization
  for n in po/*.mo ; do
	  install -Dm 644 $n "${pkgdir}/usr/share/locale/`basename $n .mo`/LC_MESSAGES/clamtk.mo"
  done

  # man pages
  install -Dm 644 clamtk.1.gz "${pkgdir}/usr/share/man/man1/clamtk.1.gz"

  # doc
  install -Dm 644 CHANGES "${pkgdir}/usr/share/doc/${pkgname}/CHANGES"
  install -Dm 644 DISCLAIMER "${pkgdir}/usr/share/doc/${pkgname}/DISCLAIMER"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"

  # help
  install -d "${pkgdir}/usr/share/help/"
  cp -dr --no-preserve=ownership help/* "${pkgdir}/usr/share/help/"

  # pixmaps
  install -Dm 644 images/clamtk.xpm "${pkgdir}/usr/share/pixmaps/clamtk.xpm"
  install -Dm 644 images/clamtk.png "${pkgdir}/usr/share/pixmaps/clamtk.png"

  # menu
  install -Dm 644  clamtk.desktop "${pkgdir}/usr/share/applications/clamtk.desktop"

  # nautilus
  # install -Dm 755  clamtk.py "${pkgdir}/usr/share/nautilus-python/extensions/clamtk.py"
}

# vim: ts=2 sw=2 et:
