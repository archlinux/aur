# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=tutch
pkgver=0.53
pkgrel=2
pkgdesc='A tool for checking constructive proofs'
arch=('any')
url='https://www.cse.chalmers.se/~abela/tutch/'
license=('Unlicense')
depends=('smlnj' 'sh')
provides=('tutch')
source=("http://www.cse.chalmers.se/~abela/tutch/${pkgname}-${pkgver}-for-sml-110.45.tar.gz")
sha256sums=('ea8360f9f1556e04a6597a15ade1e84714aa1aefc20a65bb3e430c11d49ad1ea')

prepare() {
  # Set the absolute path for the installed tutch library
  sed -i 's|%TUTCHDIR|/usr/lib/tutch|' "${pkgname}-${pkgver}/bin/.tutch"
}

build() {
  cd "${pkgname}-${pkgver}"
  export SMLNJ_HOME=/usr/lib/smlnj
  make ml-build="${SMLNJ_HOME}/bin/ml-build" sml="${SMLNJ_HOME}/bin/sml"
}

package() {
  cd "${pkgname}-${pkgver}"
  _HEAPSUFFIX=`/usr/lib/smlnj/bin/sml @SMLsuffix`
  install -Dm755 "bin/.heap/tutch.$_HEAPSUFFIX" "${pkgdir}/usr/lib/tutch/bin/.heap/tutch.$_HEAPSUFFIX"
  install -Dm755 "bin/tutch" "${pkgdir}/usr/bin/tutch"
  install -Dm755 -d "${pkgdir}/usr/share/doc/tutch"
  install -Dm644 "doc/info/tutch.info" "${pkgdir}/usr/share/info/tutch.info"
  cp -dr --no-preserve=ownership doc/{examples,html} "${pkgdir}/usr/share/doc/tutch/"
}
