# Maintainer: sitiyou <sitiyou7@gmail.com>

pkgname=python-kara-templater
_pkgname=kara-templater
pkgver=1.0.0
pkgrel=2
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
source=("https://files.pythonhosted.org/packages/source/k/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz"
        "check-core.sh")
sha256sums=('ea82fb346696f5d0234a1acceafe2df8a2e89f21eb50627439396b1607a368a8'
            '6f6a2aa096bded2bcd732985219c9d4a86668da2700bfbcffe04be0bbfcbc8b3')

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
