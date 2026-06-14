# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=dlss-updater
_app_id="io.github.recol.$pkgname"
pkgver=4.1.9
pkgrel=1
pkgdesc="DLSS, XeSS, DirectStorage, FSR, and Streamline DLL updater for games"
arch=('any')
url="https://github.com/Recol/DLSS-Updater"
license=('AGPL-3.0-only')
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
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=('appstream')

# Use commit of what tag should be
# until upstream fixes CI pipeline
_commit=cc639d31c684e9529a2a05a152e78dd393b23167

optdepends=('python-rapidfuzz: Fast fuzzy string matching for game search')
source=("git+https://github.com/Recol/DLSS-Updater.git#commit=${_commit}"
        "$pkgname.sh")
sha256sums=('697ea2d6c3e3e8be49f722a072a47bc4f153fec0f9b189d05f4a72b56369fa44'
            'd98bd361773dee09cc82fa02a185a9fdf21779676ed72b69d550323e9abe14f0')

prepare() {
  cd DLSS-Updater
  git clean -dfx

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value=flet_view \
    "flatpak/${_app_id}.desktop"
}

build() {
  cd DLSS-Updater
  python -m build --wheel --no-isolation
}

check() {
  cd DLSS-Updater
  appstreamcli validate --no-net "${_app_id}.appdata.xml"
  desktop-file-validate "flatpak/${_app_id}.desktop"
}

package() {
  cd DLSS-Updater
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm755 main.py -t "${pkgdir}${site_packages}/dlss_updater/"

  install -Dm644 appimagex_png.png "$pkgdir/usr/share/pixmaps/${_app_id}.png"
  install -Dm644 "${_app_id}.appdata.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "flatpak/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
