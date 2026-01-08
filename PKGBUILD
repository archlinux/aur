# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.36.1
pkgrel=1
pkgdesc='Normalize loudness of audio and video files using FFmpeg'
arch=(any)
url=https://github.com/slhck/ffmpeg-normalize
license=(MIT)
depends=(ffmpeg python-colorlog python-ffmpeg-progress-yield python-mutagen python-tqdm)
checkdepends=(git python-pytest uv)
makedepends=(git python-installer python-uv-build uv)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('f9e5f04ca71b6f55203762ede9638cb1f2d5bd0b94a9f66df6a073a96fe56ce0d2b9215faad3575f8d2cdb04dec97b8e07a81dc1f687ff8b98b14ed2ee8699ae')

#prepare() {
#  rm -rf $pkgname-$pkgver/dist
#}

build() {
  cd $pkgname-$pkgver
  #python -m build --no-isolation --wheel
  uv --no-cache --no-managed-python --offline build --no-build-isolation --out-dir=dist --wheel .
}

check() {
  cd $pkgname-$pkgver
  uv venv --no-managed-python --system-site-packages
  uv --no-cache --no-managed-python --offline pip install --link-mode=copy --no-deps dist/*.whl
  PATH=".venv/bin:$PATH" ./.venv/bin/python -m pytest tests
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
