# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>

pkgname=clamtk
pkgver=5.23
pkgrel=3
pkgdesc='Easy to use, light-weight, on-demand virus scanner for Linux systems'
url='https://dave-theunsub.github.io/clamtk/'
arch=('any')
license=('GPL')
depends=('clamav' 'perl' 'gtk2-perl' 'perl-locale-gettext' 'perl-libwww' 'perl-http-message'
         'perl-lwp-protocol-https' 'perl-text-csv' 'perl-json' 'python' 'zenity' 'desktop-file-utils'
         'gnome-icon-theme' 'cron')
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

  install -Dm 755 clamtk -t "${pkgdir}/usr/bin"
  for f in lib/* ; do
	  install -Dm 644 ${f} "${pkgdir}/usr/lib/perl5/vendor_perl/ClamTk/`basename ${f}`"
  done

  for f in po/*.mo ; do
	  install -Dm 644 "${f}" "${pkgdir}/usr/share/locale/`basename ${f} .mo`/LC_MESSAGES/clamtk.mo"
  done

  install -Dm 644 clamtk.1.gz -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 CHANGES DISCLAIMER README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -d "${pkgdir}/usr/share/help"
  cp -dr --no-preserve=ownership help/* "${pkgdir}/usr/share/help"

  install -Dm 644 images/clamtk.{xpm,png} -t "${pkgdir}/usr/share/pixmaps"
  install -Dm 644 clamtk.desktop -t "${pkgdir}/usr/share/applications"
}

# vim: ts=2 sw=2 et:
