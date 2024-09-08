# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=3.13.1
pkgrel=1
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
sha256sums=('baa2018825087fa3d896d924f5da90a5f29462d9de272236e6c619ec93066ae5')

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
