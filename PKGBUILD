# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=ppf-scripts
_upstreamname=pine-pgp-filters
pkgver=1.8
pkgrel=1
pkgdesc='Collection of PGP Filters for pine/alpine created by Douglas Barton.'
arch=('any')
url='https://dougbarton.us/PGP/ppf/'
license=('BSD')
depends=('gnupg')
source=('https://dougbarton.us/PGP/ppf/pine-pgp-filters-1.8.tar.gz')
sha256sums=('4967cc0bb6a3872e582f586c794ed952a126195cb8940035a0828dcd1f863b25')
install='ppf-scripts.install'

build() {
  cd "$srcdir/${_upstreamname}-${pkgver}"
  chmod -R u+w .
  #for file in scripts/*; do
  #    sed -i -e 's|@@PREFIX@@/bin|/usr/lib/ppf-scripts|g' \
  #        -e 's|@@GPG@@|/usr/bin/gpg|g' \
  #        $file
  #done
  sed -i "s|libexec|lib/${pkgname}|g" configure
  sed -i -e "s|libexec|lib/${pkgname}|g" \
      -e 's|s#\\@\\@PREFIX\\@\\@#@@PREFIX@@#g|s#\\@\\@PREFIX\\@\\@/bin#/usr/lib/ppf-scripts#g|' \
      -e 's|s#\\@\\@GPG\\@\\@#@@GPG@@#g|s#\\@\\@GPG\\@\\@#/usr/bin/gpg#g|' \
      -e 's|ln -sf @@PREFIX@@|ln -sf /usr|g' Makefile.in
  ./configure --prefix="$pkgdir/usr"
}

package() {
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"

  cd "$srcdir/${_upstreamname}-${pkgver}"
  make install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 BUGS "${pkgdir}/usr/share/doc/${pkgname}/BUGS"
  install -D -m644 CHANGES "${pkgdir}/usr/share/doc/${pkgname}/CHANGES"
  install -D -m644 INSTALL "${pkgdir}/usr/share/doc/${pkgname}/INSTALL"
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
