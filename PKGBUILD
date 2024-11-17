# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=3.13.3
pkgrel=2
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="https://toolkit.translatehouse.org/"
license=('GPL-2.0-or-later')
depends=('bash' 'python-lxml' 'python-ruamel-yaml')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
optdepends=('gaupol: for po2sub'
            'python-chardet: encoding detector'
            'python-cheroot: for TM Server'
            'python-levenshtein: faster matching'
            'python-mistletoe: Markdown support for po2md'
            'python-pyenchant: for spellcheck filter'
            'python-pyparsing: RC support for po2rc'
            'python-vobject: iCalendar files support for po2ical')
source=($pkgname-$pkgver.tar.gz::https://github.com/translate/translate/archive/$pkgver.tar.gz)
sha256sums=('3e3b91fef7f082df0fbc40c507e18b284a41f41f77dbf66dcb79862de6a55c43')

build() {
  cd translate-$pkgver
  # FS#70224 to fix reproducible build
  export PYTHONHASHSEED=0
  python -m build --wheel --no-isolation
}

package() {
  cd translate-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cp -a translate/share "$pkgdir/$site_packages/translate"
}
