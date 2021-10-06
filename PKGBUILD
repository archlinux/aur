# Maintainer: jxir <aur@jxir.de>
# Contributor: carlosal1015

pkgname=betterbib
pkgver=4.0.2
_abbrvver=2021-09
pkgrel=1
pkgdesc="Update BibTeX files with info from online resources"
arch=('any')
url="https://github.com/nschloe/betterbib"
license=('custom')
depends=('python>=3.8' 'python-appdirs' 'python-latexcodec' 'python-pybtex>=0.19.0'
         'python-pyenchant' 'python-requests' 'python-requests-cache' 'python-rich'
         'python-setuptools' 'python-unidecode' 'aspell-en' 'hspell' 'libvoikko'
         'nuspell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nschloe/betterbib/archive/refs/tags/v$pkgver.tar.gz"
        "abbrev.jabref.org-$_abbrvver.tar.gz::https://github.com/JabRef/abbrv.jabref.org/archive/refs/tags/$_abbrvver.tar.gz")
sha256sums=('c6e95fc26e90273280b269e9dbb093f1b80d2f5066d6dfc21d636a8022d6dafa'
            '77617e9d59da089d39235d1c69e390bb4d98780c42579ba5c368be3d3e3daaa3')

build() {
  cd "$srcdir/abbrv.jabref.org-$_abbrvver"
  ./combine_journal_lists.py out.csv journals/*
  python3 "$srcdir/$pkgname-$pkgver/src/betterbib/data/csv-to-json.py" out.csv journals.json

  cd "$srcdir/$pkgname-$pkgver"
  python -c "from setuptools import setup; setup();" build

}

package() {
  cd "$srcdir/abbrv.jabref.org-$_abbrvver"
  install -Dm644 journals.json "$pkgdir/usr/lib/python3.9/site-packages/betterbib/data/journals.json"

  cd "$srcdir/$pkgname-$pkgver"
  python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
