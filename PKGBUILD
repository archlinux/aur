# Maintainer:

_pkgname="gpu-screen-recorder-ui"
pkgname="$_pkgname-git"
pkgver=1.11.5.r0.geb6aed9
pkgrel=1
pkgdesc="A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay"
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'dbus'
  'libdrm'
  'libglvnd'
  'libpulse'
  'libx11'
  'libxcomposite'
  'libxcursor'
  'libxext'
  'libxfixes'
  'libxi'
  'libxrandr'
  'libxrender'
  'pango'
  'wayland'
)
makedepends=(
  'desktop-file-utils'
  'git'
  'meson'
)

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

package() {
  depends+=(
    'gpu-screen-recorder'
    'gpu-screen-recorder-notification'
  )
  meson install -C build --destdir "$pkgdir"
}
