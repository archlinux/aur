# Maintainer: sitiyou <sitiyou7@gmail.com>

pkgname=python-kara-templater
_pkgname=kara-templater
pkgver=1.1.0
pkgrel=1
pkgdesc='Python karaoke effects engine for standard ASS subtitles and libplacebo shaders'
arch=('x86_64')
url='https://github.com/sitiyou/python-kara-templater'
license=('MIT')
depends=(
  'python>=3.12'
  'python-aggdraw'
  'python-pillow'
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
source=("https://files.pythonhosted.org/packages/source/k/kara-templater/kara_templater-$pkgver.tar.gz"
        "check-core.sh")
sha256sums=('66e34dc827fa09c1fb53a14e5fcbe87d561d575c76c0a279521e7c24b53796e9'
            'c774ecc49cccd39a9772d27e697a21eba4ae71742021cc435301cb9ae5ed2177')

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
}
