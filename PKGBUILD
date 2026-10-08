# Maintainer: burningserenity <burningserenity@novo-ordo.com>

# RozeLynx built from source via the distro-agnostic build script
# (rozelynx-distro-build.sh): fetch -> prepare -> configure -> build ->
# install, then the staged /usr tree is copied into the package.
# Everything is pinned in rozelynx-distro-versions.conf; pkgver tracks the
# pinned FIREFOX_VERSION plus the git revision.
#
# This is a full Firefox build: ~10-19 GB of disk, several hours of compile
# time, and pinned downloads at build time (Firefox source tarball,
# Gentoo patchset, LibreWolf/Floorp reference checkouts).

pkgname=rozelynx-git
pkgver=156.0.1.r6.ge28dc3a
pkgrel=1
pkgdesc='RozeLynx Web Browser: Firefox fork with LibreWolf privacy patches and per-tab network interface binding'
arch=(x86_64 aarch64)
url='https://bytewheel.org/rozelynx'
license=('MPL-2.0' 'GPL-2.0-only' 'LGPL-2.1-only')
depends=(
  alsa-lib
  aom
  at-spi2-core
  cairo
  dav1d
  dbus
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  gtk3
  harfbuzz
  'icu>=78.1'
  libdrm
  libepoxy
  libevent
  libjpeg-turbo
  libpulse
  libvpx
  libwebp
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  mesa
  'nspr>=4.39'
  'nss>=3.125'
  pango
  pixman
  zlib
)
makedepends=(
  clang
  curl
  git
  imagemagick
  lld
  nasm
  nodejs
  pkgconf
  'python>=3.12'
  'rust>=1.90'
  zip
)
optdepends=(
  'libva: VAAPI hardware video decoding'
  'networkmanager: geolocation via nearby Wi-Fi networks (necko-wifi)'
  'vulkan-icd-loader: Vulkan rendering (hwaccel vulkantest)'
)
provides=("rozelynx=${pkgver%.r*}")
conflicts=(rozelynx)
install=rozelynx-git.install
source=("${pkgname}::git+https://github.com/Bytewheel/RozeLynx.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  local ffver
  ffver="$(sed -n 's/^FIREFOX_VERSION="\([^"]*\)".*/\1/p' rozelynx-distro-versions.conf)"
  printf '%s.r%s.g%s' "${ffver}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  # all = fetch prepare configure build install; the install stage leaves a
  # complete /usr tree (launcher, browser, extension XPI, prefs, desktop
  # file, icons, native messaging host) under <workdir>/stage/.
  # Feature flags match the Gentoo ebuild USE defaults; override with
  # --use/--no-use, e.g. ./rozelynx-distro-build.sh --no-use net-iface all
  ./rozelynx-distro-build.sh all \
    --prefix /usr --libdir lib \
    --workdir "${srcdir}/rozelynx-distro-build"
}

package() {
  cp -a "${srcdir}/rozelynx-distro-build/stage/usr" "${pkgdir}/"
}