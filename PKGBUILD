# Maintainer:

_pkgname="gpu-screen-recorder"
pkgname="$_pkgname-git"
pkgver=5.6.3.r0.g53e879b
pkgrel=1
pkgdesc="A shadowplay-like screen recorder"
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL-3.0-only')
depends=(
  'dbus'
  'ffmpeg'
  'libcap'
  'libdrm'
  'libglvnd'
  'libpipewire'
  'libpulse'
  'libva'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxfixes'
  'libxrandr'
  'wayland'
)
makedepends=(
  'git'
  'meson'
  'vulkan-headers'
)
optdepends=(
  'nvidia-utils: Required to record your screen on NVIDIA'
  'libxnvctrl: Required when using the -oc option to overclock the NVIDIA GPU to workaround NVIDIA p2 state bug'
  'mesa: Required to record your screen on AMD/Intel'
  'libva-mesa-driver: Required to record your screen on AMD'
  'libva-intel-driver: Required to record your screen on Intel G45 and HD Graphics family'
  'intel-media-driver: Required to record your screen on Intel Broadwell or later iGPUs or Intel Arc'
  'linux-firmware-intel: Required to record your screen on Intel Skylake or later iGPUs'
)

install="$_pkgname.install" # setcap cap_sys_admin (gsr-kms-server)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$(sed 's&//git\.&//repo.&' <<< "$url")")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
