# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor: lotation <xlapsiu@gmail.com>

pkgname=bottles
_pkgname=Bottles
pkgver=66.7
pkgrel=1
epoch=2
pkgdesc='Easily manage wine and proton prefix'
arch=(any)
url="https://github.com/bottlesdevs/Bottles"
license=(GPL-3.0-only)
depends=(
  cabextract
  fvs2
  gamemode
  gtk4
  gtksourceview5
  hicolor-icon-theme
  icoextract
  libadwaita
  libportal-gtk4
  patool
  python
  python-cairo
  python-certifi
  python-chardet
  python-charset-normalizer
  python-gobject
  python-idna
  python-markdown
  python-pathvalidate
  python-pefile
  python-pycurl
  python-requests
  python-urllib3
  python-yaml
  python-yara
  vkbasalt-cli
)
makedepends=(
  appstream-glib
  blueprint-compiler
  desktop-file-utils
  gettext
  glib2-devel
  meson
)
optdepends=(
  '7zip: extract 7z archives'
  'gamescope: gamescope session integration'
  'imagemagick: icon/image conversion'
  'lib32-alsa-lib: 32-bit ALSA for downloaded runners'
  'lib32-fontconfig: 32-bit font rendering for downloaded runners'
  'lib32-glibc: 32-bit support for downloaded runners'
  'lib32-gnutls: 32-bit TLS for downloaded runners'
  'lib32-libglvnd: 32-bit OpenGL/X11 for downloaded runners'
  'lib32-libpulse: 32-bit PulseAudio for downloaded runners'
  'lib32-vulkan-driver: 32-bit Vulkan driver (DXVK) for downloaded runners'
  'lib32-vulkan-icd-loader: 32-bit Vulkan loader (DXVK) for downloaded runners'
  'mangohud: performance overlay'
  'python-pysocks: SOCKS proxy support'
  'umu-launcher: manage UMU Launcher prefixes'
  'vmtouch: preload bottle files into memory'
  'vulkan-tools: vkcube test / Vulkan info'
  'wine: use system installed wine as runner for bottles'
  'xorg-xdpyinfo: display info detection'
  'xterm: fallback terminal for "Run executable in terminal"'
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/bottlesdevs/Bottles/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
  "607994bbc29d7e8f3b0d3cd852b7a97a0f1e2c90e4dcacefc2e8ce632709e8db"
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  grep -q "fs.is_file('/' + '.flatpak-info')" bottles/frontend/meson.build
  sed -i "s|fs.is_file('/' + '.flatpak-info')|fs.is_file(meson.current_source_dir() / 'meson.build')|" \
    bottles/frontend/meson.build

  grep -q '^import os$' bottles/frontend/bottles.py bottles/frontend/cli/cli.py
  sed -i '/^import os$/a os.environ.setdefault("CPAK_CONTAINER_ID", "1")' \
    bottles/frontend/bottles.py bottles/frontend/cli/cli.py

  grep -q 'return "FLATPAK_ID" in os.environ or is_cpak()' bottles/backend/globals.py
  sed -i 's|return "FLATPAK_ID" in os.environ or is_cpak()|return False|' \
    bottles/backend/globals.py
}

build() {
  arch-meson "${_pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

# vim: set ft=sh ts=2 sw=2 et:
