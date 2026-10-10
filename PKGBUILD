# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=dlss-updater
_app_id="io.github.recol.$pkgname"
pkgver=5.1.1
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
  'python-msgpack'
  'python-msgspec'
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
  'python-nvidia-ml-py: NVML GPU detection'
  'python-rapidfuzz: Fast fuzzy string matching for game search'
)

# Use commit of what tag should be
# until upstream fixes CI pipeline
_commit=18a3f5534d504743cac2111f90fd29db67084d79

source=("git+https://github.com/Recol/DLSS-Updater.git#commit=${_commit}"
        "$pkgname.sh")
sha256sums=('6d195f2338e3a1773c4f938371b72e021f317d28a79ae29496c44b684765be2e'
            'aa0987dad55ebd75d146dac0790e5028a3fb2ba2b065eebbe13ca07cad00c49a')

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
