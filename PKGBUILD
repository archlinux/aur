# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=dlss-updater
_app_id="io.github.recol.$pkgname"
pkgver=4.6.0
pkgrel=1
pkgdesc="DLSS, XeSS, DirectStorage, FSR, and Streamline DLL updater for games"
arch=('any')
url="https://github.com/Recol/DLSS-Updater"
license=('AGPL-3.0-only')
depends=(
  'python-aiofiles'
  'python-aiohttp'
  'python-aiosqlite'
  'python-anyio'
  'python-flet'
  'python-msgspec'
  'python-nvidia-ml-py'
  'python-packaging'
  'python-pefile'
  'python-pillow'
  'python-platformdirs'
  'python-psutil'
  'python-tomli-w'
  'python-uvloop'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
optdepends=(
  'python-niquests: Fallback for DLL downloads when aiohttp fails'
  'python-rapidfuzz: Fast fuzzy string matching for game search'
)

# Use commit of what tag should be
# until upstream fixes CI pipeline
_commit=2c73ef31527dc8fd8626d18c31e09feae5a12a52

source=("git+https://github.com/Recol/DLSS-Updater.git#commit=${_commit}"
        "$pkgname.sh")
sha256sums=('a838a190ded735eb20cbc9d78adfb07e65efb5654b9dd217bfc2aeb5f1d3ca2e'
            'd98bd361773dee09cc82fa02a185a9fdf21779676ed72b69d550323e9abe14f0')

prepare() {
  cd DLSS-Updater
  git clean -dfx

  # Don't attempt to update with the Flatpak release
  sed -i 's/return ".flatpak"/return ""/' dlss_updater/auto_updater.py
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
