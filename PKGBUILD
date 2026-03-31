# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-quality-metrics
pkgver=3.11.3
pkgrel=1
pkgdesc='Calculate quality metrics with FFmpeg (SSIM, PSNR, VMAF, VIF)'
arch=(any)
url=https://github.com/slhck/ffmpeg-quality-metrics
license=(MIT)
depends=(ffmpeg python-colorlog python-mutagen python-click python-dash python-tqdm python-plotly python-ffmpeg-progress-yield)
checkdepends=(git python-pytest uv)
makedepends=(git python-installer python-uv-build uv)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('7a08bcce782c86799978220a73f9a0462f2f57558e81798a08c64593c8a97c8ea7b0efcfbfa3288b3adcbd8120825aad602f740967a3af841f8818a1b7b9036f')

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
