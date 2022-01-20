# Maintainer: jxir <aur@jxir.de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=betterbib
pkgdesc="Better BibTeX data"
pkgver=4.2.0
pkgrel=1
arch=(any)
url="https://github.com/nschloe/${pkgname}"
license=(GPL3)
depends=(python-appdirs python-pybtex python-pyenchant python-pylatexenc python-requests-cache python-rich python-tomli python-unidecode hunspell libvoikko nuspell hspell aspell-en)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
# _abbrvver=2021-09
# abbrev.jabref.org-$_abbrvver.tar.gz::https://github.com/JabRef/abbrv.jabref.org/archive/refs/tags/$_abbrvver.tar.gz
sha512sums=('90f7d6865d384193ce82de07f26adc15cbcb4f40e97ab7e429727d36074c0156aab95dbfb8612d5628304113627f1278b095c7584645963ee51ac1eb80ab47b8')

# prepare() {
#   cd "abbrv.jabref.org-$_abbrvver"
#   ./combine_journal_lists.py out.csv journals/*
#   python3 "$srcdir/$pkgname-$pkgver/src/betterbib/data/csv-to-json.py" out.csv journals.json
# }

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python -c "from setuptools import setup; setup();" build
}

# cd "$srcdir/abbrv.jabref.org-$_abbrvver"
# install -Dm644 journals.json "$pkgdir/usr/lib/python3.9/site-packages/betterbib/data/journals.json"
package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
