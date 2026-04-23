# Maintainer:

_pkgname="gpu-screen-recorder-gtk"
pkgname="$_pkgname-git"
pkgver=5.7.9.r3.gd3e5d91
pkgrel=2
pkgdesc="A GTK UI for GPU Screen Recorder in the style of ShadowPlay"
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'gtk3'
  'libayatana-appindicator'
  'libx11'
)
makedepends=(
  'desktop-file-utils'
  'git'
  'gtk-update-icon-cache'
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
  depends+=('gpu-screen-recorder')
  meson install -C build --destdir "$pkgdir"
}
