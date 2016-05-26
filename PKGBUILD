# Maintainer: Masaki Waga <masakiwaga@gmail.com>
# Contributor: Tatsunori Aoki <ginjiro.135@gmail.com>

DLAGENTS='https::/usr/bin/curl --insecure -fLC - --retry 3 --retry-delay 3 -o %o %u'

pkgname=open-usp-tukubai
pkgver=2014061402
pkgrel=3
pkgdesc="An open source version of shell commands usp Tukubai."
arch=('any')
url="https://uec.usp-lab.com/TUKUBAI/CGI/TUKUBAI.CGI"
license=('MIT' 'custom')
depends=('python2')
conflicts=('open-usp-tukubai-git')

source=(
"https://uec.usp-lab.com/TUKUBAI/DOWNLOAD/open-usp-tukubai-2014061402.tar.bz2"
"https://gist.githubusercontent.com/MasWag/76a89b3c3056753d1d31/raw/e1d8f62e81618733b1138dd23f1dde0f7e13a32b/Makefile.patch"
)

md5sums=('be4f69734afd2bdc74d07fc705380c6e'
         '14e3dee8ccf6bd0c3cc8e2c2299be33d')

build() {
  patch "$pkgname-$pkgver"/Makefile Makefile.patch
  cd "$pkgname-$pkgver"

  mv COMMANDS/tcat COMMANDS/tukubai-tcat
  for a in COMMANDS/*;do sed -i '1 s/python/python2/' $a;done
  cat Makefile | grep "^#" | sed 's/^#//' > LICENSE
}

package() {
  cd "$pkgname-$pkgver"

  make LOCALBASE="$pkgdir/usr" install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
