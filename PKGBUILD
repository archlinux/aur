# Maintainer: Erik Reider <erik.reider@protonmail.com>
pkgname=sway-audio-idle-inhibit-git
_ver=0.1.1
pkgver=0.1.1.r31.e9cb7d6
pkgrel=1
pkgdesc="Prevents swayidle from sleeping while any application is outputting or receiving audio"
_pkgfoldername=SwayAudioIdleInhibit
url="https://github.com/ErikReider/$_pkgfoldername"
arch=(
    'x86_64'
    'aarch64' # ARM v8 64-bit
    'armv7h'  # ARM v7 hardfloat
)
license=(GPL)
depends=("wayland>=1.14.91" "wayland-protocols" "libpulse")
makedepends=(gcc meson git)
optdepends=("swaync-git" "swaysettings-git")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgfoldername
  printf "$_ver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgfoldername
  git checkout main
  git pull
}

build() {
  arch-meson $_pkgfoldername build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
