# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=dlss-updater
_app_id="io.github.recol.$pkgname"
pkgver=4.0.1
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
  'python-flet'
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
  'desktop-file-utils'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'appstream'
#  'python-pytest'
)
optdepends=('python-rapidfuzz: Fast fuzzy string matching for game search')
source=("DLSS-Updater-$pkgver.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('1aa67cd9b0269cccf0b8e14df66a2c5dd97d351cd3740aca3beb2a9ddb25533c'
            'd98bd361773dee09cc82fa02a185a9fdf21779676ed72b69d550323e9abe14f0')

prepare() {
  cd "DLSS-Updater-$pkgver"

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value=flet_view \
    "flatpak/${_app_id}.desktop"
}

build() {
  cd "DLSS-Updater-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "DLSS-Updater-$pkgver"

  # Fails if ~/.local/share/dlss-updater/games.db is not present
#  pytest

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
