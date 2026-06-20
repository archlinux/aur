# Maintainer: Roice Young <dekodx@proton.me>

_pkgname="gpu-screen-recorder-ui"
pkgname="$_pkgname-kwin-git"
pkgver=1.12.5.r6.g96f37ee
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

provides=("$_pkgname" "$_pkgname-git")
conflicts=("$_pkgname" "$_pkgname-git")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$(sed 's&//git\.&//repo.&' <<< "$url")"
        add-kwin-check.patch)
sha256sums=('SKIP'
            '87b71c03b5915f013f74d909ff20068fef61c415c195080b8810448761297a63')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"

  patch -Np1 <../add-kwin-check.patch
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
