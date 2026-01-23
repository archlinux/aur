# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=dlss-updater
_app_id="io.github.recol.$pkgname"
pkgver=3.6.1
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
  'python-darkdetect'
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
sha256sums=('4d0267c8f91aec2339b8fc68ecf959dc2aad8db1268a672b22558607f286bab4'
            'd98bd361773dee09cc82fa02a185a9fdf21779676ed72b69d550323e9abe14f0')

prepare() {
  cd "DLSS-Updater-$pkgver"

  # Bump version
  sed -i "s/3.6.0/$pkgver/g" dlss_updater/version.py
}

build() {
  cd "DLSS-Updater-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "DLSS-Updater-$pkgver"

  # Fails if ~/.local/share/dlss-updater/games.db is not present
#  pytest

  pytest benchmarks/ --codspeed

  appstreamcli validate --no-net "${_app_id}.appdata.xml" || :
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
