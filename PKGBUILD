# Maintainer: kylon
pkgname=openwincontrolscli-git
pkgver=1.0.3b39fcf
_version=1.0
pkgrel=1
pkgdesc="GPD WinControls replacement (command-line)"
url="https://github.com/OpenWinControls/OpenWinControlsCLI"
arch=("x86_64")
license=("GPL3")
depends=()
makedepends=("git" "cmake")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="owc.install"
source=(
  "git+https://github.com/OpenWinControls/OpenWinControlsCLI.git"
  "70-gpd-controller.rules"
)
sha256sums=(
  "SKIP"
  "8a66dcc6eac7274eaddbb9d3096bf02e3304896423fd165f205247fb09f7a07f"
)

pkgver() {
  cd "$srcdir/OpenWinControlsCLI"
  printf "%s.%s" "${_version}" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/OpenWinControlsCLI"
  git submodule update --init --recursive
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  install -Dm755 "$srcdir/OpenWinControlsCLI/build/OpenWinControlsCLI" "$pkgdir/usr/bin/OpenWinControlsCLI"
  install -Dm644 70-gpd-controller.rules "$pkgdir/etc/udev/rules.d/70-gpd-controller.rules"
}

