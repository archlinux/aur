# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=dlss-updater
_app_id="io.github.recol.$pkgname"
pkgver=3.5.4
pkgrel=1
pkgdesc="DLSS, XeSS, DirectStorage, FSR, and Streamline DLL updater for games"
arch=('any')
url="https://github.com/Recol/DLSS-Updater"
license=('AGPL-3.0-or-later')
depends=(
  'python-aiofiles'
  'python-aiohttp'
  'python-aiosqlite'
  'python-appdirs'
  'python-flet=0.28.3'
  'python-msgspec'
  'python-nvidia-ml-py'
  'python-packaging'
  'python-pefile'
  'python-pillow'
  'python-psutil'
  'python-requests'
  'python-uvloop'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-codspeed'
)
optdepends=('python-rapidfuzz: fuzzy matching')
source=("DLSS-Updater-$pkgver.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('32f9f2d5aa9c01e096b321c9324f80e46f2669e32a1a0e1d668560672b5869e5'
            'd98bd361773dee09cc82fa02a185a9fdf21779676ed72b69d550323e9abe14f0')

prepare() {
  cd "DLSS-Updater-$pkgver"
}

build() {
  cd "DLSS-Updater-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "DLSS-Updater-$pkgver"
#  pytest
  pytest benchmarks/ --codspeed

  appstreamcli validate --no-net "${_app_id}.appdata.xml"
  desktop-file-validate "flatpak/${_app_id}.desktop"
}

package() {
  cd "DLSS-Updater-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm755 main.py -t "${pkgdir}${site_packages}/dlss_updater/"

  install -Dm644 appimagex_png.png "$pkgdir/usr/share/pixmaps/${_app_id}.png"
  install -Dm644 "${_app_id}.appdata.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "flatpak/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
