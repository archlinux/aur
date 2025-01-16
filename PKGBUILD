# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=3.14.5
pkgrel=2
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="https://toolkit.translatehouse.org/"
license=('GPL-2.0-or-later')
depends=('bash' 'python-lxml' 'python-ruamel-yaml' 'python-cwcwidth')
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
sha256sums=('1fa1eee2d4b50c247483581e5b01eba7647097cba3b2b8ddbcc020b48c1a2051')

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
