# Maintainer: kylon
pkgname=openwincontrols-git
pkgver=1.0
_version=1.0
pkgrel=2
pkgdesc="GPD WinControls replacement"
url="https://github.com/OpenWinControls/OpenWinControls"
arch=("x86_64")
license=("GPL3")
depends=("qt6-base")
makedepends=("git" "cmake")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="owc.install"
source=(
  "git+https://github.com/OpenWinControls/OpenWinControls.git"
  "owc.ico"
  "openwincontrols.desktop"
  "70-gpd-controller.rules"
)
sha256sums=(
  "SKIP"
  "924c9ae4922597c9cc8c5c83afb5ffce8879347c8c61ad4bfa1c09774aff504e"
  "ffc480a3fdf781c683cfddce46161f97dd75637abf2b27aebc63031d5991fa2f"
  "8a66dcc6eac7274eaddbb9d3096bf02e3304896423fd165f205247fb09f7a07f"
)

pkgver() {
  cd "$srcdir/OpenWinControls"
  printf "%s.%s" "${_version}" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/OpenWinControls"
  git submodule update --init --recursive
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  install -Dm755 "$srcdir/OpenWinControls/build/OpenWinControls" "$pkgdir/usr/bin/OpenWinControls"
  install -Dm644 owc.ico "$pkgdir/usr/share/icons/hicolor/256x256/apps/owc.ico"
  install -Dm644 openwincontrols.desktop "$pkgdir/usr/share/applications/openwincontrols.desktop"
  install -Dm644 70-gpd-controller.rules "$pkgdir/etc/udev/rules.d/70-gpd-controller.rules"
}

