# Maintainer: sitiyou <sitiyou7@gmail.com>

pkgname=python-kara-templater
_pkgname=kara-templater
pkgver=1.0.1
pkgrel=1
pkgdesc='Python karaoke effects engine for standard ASS subtitles and libplacebo shaders'
arch=('x86_64')
url='https://github.com/sitiyou/python-kara-templater'
license=('MIT' 'ISC')
depends=(
  'python>=3.12'
  'glibc'
  'libgcc'
  'libstdc++'
  'freetype2'
  'harfbuzz'
  'fribidi'
  'fontconfig'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools>=77'
  'nasm'
  'libpng'
)
checkdepends=('python-pytest' 'ttf-dejavu')
source=("https://files.pythonhosted.org/packages/03/fc/29ef9136e4d27145f453e110facbe0913cabd1e6e2aecf8463a8572b00e6/kara_templater-$pkgver.tar.gz"
        "check-core.sh")
sha256sums=('48c70f88596f25d294be6f178215668fe0bc36cc0b9d6dcfd9ee2cdd8a8eda1a'
            '6c7287c58cda09ae1dfa96b80afc9ac000338b8f09edd81b5d1a83ca719f7073')

build() {
  cd "${_pkgname//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$(mktemp -d "$srcdir/check.XXXXXXXX")"
  timeout --signal=KILL 30s bash "$srcdir/check-core.sh" "$srcdir/${_pkgname//-/_}-$pkgver"
}

package() {
  cd "${_pkgname//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/LICENSE.libass "$pkgdir/usr/share/licenses/$pkgname/LICENSE.libass"
}
