# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor: shieldwed <shieldwed [at] outlook [dot] com>
# Contributor: austreanlocal <markus [dot] rottler [dot] kufstein [at] gmail [dot] com>

pkgname='konica-minolta-beu-driver'
epoch=1
pkgver='1.27'
pkgrel=2
pkgdesc='KONICA MINOLTA BEU driver'
url="https://www.konicaminolta.eu/eu-en/support/download-centre"
arch=("any")
license=('custom:Konica-Minolta-Commercial-License')
depends=(
  'cups'
  'perl'
)
conflicts=(konica-minolta-bizhub-c554e-series konica-minolta-bizhub-c368-series)
install="${pkgname}.install"
_distdir="KMbeuUXv${pkgver//./_}_multi_language"
source=(
  "KMbeuUXv${pkgver//./_}_multi_language.tar.gz::https://dl.konicaminolta.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=b3bacdb5247893337442504faeed7c49&tx_kmdownloadproxy_downloadproxy[documentId]=142542&tx_kmdownloadproxy_downloadproxy[system]=KonicaMinolta&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685"
  'LICENSE'
)
sha512sums=('8032a66d2a212610d6ebfa9da51e4281e748643b1f284a55e1fed089b32e332b7864c5fdaed7cfc6dd437912b5e38bedc0cfa9e4e424d2ae0adba17bc56d4e00'
            '0a2af3c51430b64d69583518abe75ba5d420c556cdb172fe8ca3c9c9dfb8005d300c875f9c88bc2e94024f0b67a84b91e20625bee31c40ee866ce152618943d1')

package() {
  cd "$srcdir"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ppdmodel="${pkgdir}/usr/share/cups/model"
  install -dm 755 "${ppdmodel}"
  cp -a "${_distdir}/"*.ppd "${ppdmodel}"
  chmod 644 "${ppdmodel}"/*.ppd

  filter="${pkgdir}/usr/lib/cups/filter"

  # CUPS filter for encryption
  install -D -m 755 "${_distdir}/KMbeuEmpPS.pl" "${filter}/KMbeuEmpPS.pl"
  install -D -m 755 "${_distdir}/KMbeuEnc.pm" "${filter}/KMbeuEnc.pm"
}
