# Maintainer:

_pkgname="gpu-screen-recorder-notification"
pkgname="$_pkgname-git"
pkgver=1.2.1.r0.gae5de77
pkgrel=1
pkgdesc="Notification in the style of ShadowPlay"
url="https://git.dec05eba.com/gpu-screen-recorder-notification"
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'libglvnd'
  'libx11'
  'libxext'
  'libxrandr'
  'libxrender'
  'pango'
  'wayland'
)
makedepends=(
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

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
