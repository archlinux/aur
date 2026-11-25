# Maintainer: sitiyou <sitiyou7@gmail.com>

pkgname=python-kara-templater
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "check-core.sh")
sha256sums=('fb93c4dc217fb390649d773188f21917183af2c095ae4c18cb540f21ede76cb6'
            'c774ecc49cccd39a9772d27e697a21eba4ae71742021cc435301cb9ae5ed2177')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$(mktemp -d "$srcdir/check.XXXXXXXX")"
  timeout --signal=KILL 30s bash "$srcdir/check-core.sh" "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
