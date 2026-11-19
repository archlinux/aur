# Maintainer: sitiyou <sitiyou7@gmail.com>

pkgname=python-kara-templater
_pkgname=kara-templater
pkgver=1.0.0
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
checkdepends=('ttf-dejavu' 'noto-fonts-cjk' 'python-pytest' 'python-pillow' 'ty')
source=("https://files.pythonhosted.org/packages/source/k/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('ea82fb346696f5d0234a1acceafe2df8a2e89f21eb50627439396b1607a368a8')

build() {
  cd "${_pkgname//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname//-/_}-$pkgver"
  local checkdir="$srcdir/check-$pkgver"
  mkdir -p "$checkdir"
  cp -r tests examples tools docs setup.py README.md THIRD_PARTY.md pyproject.toml "$checkdir/"
  python -m venv --system-site-packages --without-pip "$checkdir/venv"
  "$checkdir/venv/bin/python" -m installer --overwrite-existing dist/*.whl
  cd "$checkdir"
  VIRTUAL_ENV="$checkdir/venv" PATH="$checkdir/venv/bin:$PATH" "$checkdir/venv/bin/python" -m pytest -q tests
  "$checkdir/venv/bin/kara-templater" examples/karaoke.ass "$checkdir/output.ass"
}

package() {
  cd "${_pkgname//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/LICENSE.libass "$pkgdir/usr/share/licenses/$pkgname/LICENSE.libass"
}
