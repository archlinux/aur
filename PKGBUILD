# Maintainer: kylon
pkgbase="openwincontrols-git"
_rulespkgbase="openwincontrols-rules"
pkgname=("$pkgbase" "$_rulespkgbase")
pkgver=1.0
pkgrel=3
url="https://github.com/OpenWinControls/OpenWinControls"
arch=("x86_64")
license=("GPL-3.0-or-later")
depends=("qt6-base")
makedepends=("git" "cmake")
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
  git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
  cd "$srcdir/OpenWinControls"
  git submodule update --init --recursive
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package_openwincontrols-git() {
  pkgdesc="Open source GPD WinControls replacement"
  provides=("openwincontrols")
  conflicts=("openwincontrols")
  depends+=("$_rulespkgbase")

  install -Dm755 "$srcdir/OpenWinControls/build/OpenWinControls" "$pkgdir/usr/bin/OpenWinControls"
  install -Dm644 owc.ico "$pkgdir/usr/share/icons/hicolor/256x256/apps/owc.ico"
  install -Dm644 openwincontrols.desktop "$pkgdir/usr/share/applications/openwincontrols.desktop"
}

package_openwincontrols-rules() {
  pkgdesc="GPD controller udev rules to allow non-root access"
  provides=("$_rulespkgbase")
  conflicts=("$_rulespkgbase")

  install -Dm644 70-gpd-controller.rules "$pkgdir/etc/udev/rules.d/70-gpd-controller.rules"
}
