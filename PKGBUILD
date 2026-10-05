# Maintainer: sitiyou <sitiyou7@gmail.com>

pkgname=python-kara-templater
_pkgname=kara-templater
pkgver=0.1.1
pkgrel=1
pkgdesc='Python karaoke template engine with native libass text metrics'
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
checkdepends=('ttf-dejavu')
source=("https://files.pythonhosted.org/packages/source/k/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('d8183030b44576bdb099b33a52452884f5ea50e29a6ad4b86dd1f97c0efad149')

build() {
  cd "${_pkgname//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname//-/_}-$pkgver"
  local site_packages
  site_packages=$(python -c 'import sysconfig; print(sysconfig.get_path("platlib"))')
  python -m installer --destdir="$srcdir/check" --overwrite-existing dist/*.whl
  export PYTHONPATH="$srcdir/check$site_packages"
  python -P -m unittest discover -s tests -v
  python -P -m kara_templater examples/karaoke.ass "$srcdir/check-output.ass"
}

package() {
  cd "${_pkgname//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/LICENSE.libass "$pkgdir/usr/share/licenses/$pkgname/LICENSE.libass"
}
