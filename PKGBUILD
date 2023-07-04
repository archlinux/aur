# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='xidel'
pkgname="${_pkgname}-bin"
pkgver=0.9.8
pkgrel=2
pkgdesc='Command line tool to process HTML/XML/JSON locally or from online sources'
arch=('x86_64')
url='https://www.videlibri.de/xidel.html'
license=('GPL3')
optdepends=('openssl: for making https connections')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://jaist.dl.sourceforge.net/project/videlibri/Xidel/Xidel%20$pkgver/$_pkgname-$pkgver.linux64.tar.gz"
        "LICENSE::https://sourceforge.net/p/videlibri/code/ci/tip/tree/programs/internet/xidel/COPYING?format=raw"
        test-data.xml
        test-result.txt)
b2sums=('37305eacceaade671ec9f8a5e665274adf4807e0304ffaf1fecf4be75c7df5cd0247451cc540b86f12c8c10b84e42ff98fc1141550a961d8a368817fc8ca0763'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c'
        '39e648523811611682aef0f950e9bb9faadc60472346b450d23afdaa75032202be1d45d066387c8b57203e4f9e62bf4d300f6397943e233ffb92460ed82a4560'
        'deb94456e0458387884dca3b83a160770302c70d2f3bdf4ec8d230e0dcbcafdbfe6e0c8be92f08120a172e503c0cf44d9c64ba388c79062bb2623b3070b9b5ba')

check() {
  cd "$srcdir"
  ./xidel -e '/designspace//instances//instance/@name' test-data.xml > result.txt || \
    exit 1
  read -r actual expected <<< $(sha256sum test-result.txt result.txt | awk -v 'ORS= ' '{print $1;}')
  echo "Testing $actual == $expected…"
  [ $actual = $expected ]
}

package() {
  cd "$srcdir"
  ./install.sh "$pkgdir"
  mkdir -p "$pkgdir/usr/share/doc/xidel" "$pkgdir/usr/share/licenses/xidel"
  cp -v changelog "$pkgdir/usr/share/doc/xidel/"
  cp -v readme.txt "$pkgdir/usr/share/doc/xidel/"
  cp -v LICENSE "$pkgdir/usr/share/licenses/xidel/"
}

# vim: ts=2 sw=2 et:
