# Maintainer : Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=systemd-manager
pkgver=1.0.0
pkgrel=2
pkgdesc="GUI manager for systemd services, using GTK+3"
arch=('i686' 'x86_64')
url="https://gitlab.com/mmstick/systemd-manager"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
conflicts=('systemd-manager-git')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"Cargo.toml.patch"
	"src_gui_gtk3_analyze.rs.patch")
sha256sums=('035bc96d13f873ed29463ef9c20988a6670dcb0b05cc4384089a81dbbc226a47'
	'518d88c331a799327d25b063217a42a4be893c5c649c7590545f9cf7b895a842'
	'c511895451ddd2e87b6fcf0c3ddfcef30b5c7c5a2d4ecb7777fef950d6f3906f')

build() {
  cd "$pkgname-$pkgver"
  cp ../../Cargo.toml.patch ./
  patch Cargo.toml Cargo.toml.patch
  cp ../../src_gui_gtk3_analyze.rs.patch ./
  patch src/gui/gtk3/analyze.rs src_gui_gtk3_analyze.rs.patch
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/systemd-manager -t "$pkgdir/usr/bin"
  install -Dm 755 assets/systemd-manager-pkexec -t "$pkgdir/usr/bin"
  install -Dm 644 assets/systemd-manager.desktop -t "$pkgdir/usr/share/applications"
  install -Dm 644 assets/org.freedesktop.policykit.systemd-manager.policy -t "$pkgdir/usr/share/polkit-1/actions"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/systemd-manager/COPYING"
}
