# Maintainer: Riedler <dev@riedler.wien>

pkgname=lb-planner
pkgver=0.0.2
pkgrel=5
pkgdesc='a Planning tool for students at the TGM Vienna'
arch=('any')
url='https://github.com/necodeIT/lb_planner'
license=('CC-NC-SA 4.0')
depends=('gtk3' 'xz' 'xdg-user-dirs') #TODO: check if xz is actually needed or just a precaution by the flutter devs
makedepends=('cmake' 'clang' 'ninja' 'fvm-bin' 'pkgconf' 'gtk3' 'xz') #TODO: contact maintainer of fvm-bin to add provides=('fvm')
source=(
	"$pkgname::git+https://github.com/necodeIT/lb_planner.git#branch=app"
	"lb-planner.desktop"
	)
sha256sums=('SKIP' '3cdcb4b0c0a92711f2e3c2db94e6a18915df375de0a7265487fa4372136397f1')
conflicts=('lb-planner-git')

pkgver() {
	cd "$pkgname"
	# getting the three-digit version and nothing else
	git describe --tags | grep -P -e "(\d\.\d\.\d)" -o
}

prepare() {
	cd "$pkgname"
	fvm use 3.3.3
	fvm flutter pub get
}

build() {
	cd "$pkgname"
	fvm flutter config --enable-linux-desktop #TODO: check if this is even necessary
	fvm flutter build linux --no-sound-null-safety --release --dart-define=LB_PLANNER_SETUP_TYPE=aur
}

package() {
	cd "$pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 LICENSE.md "$pkgdir/opt/$pkgname/LICENSE"
	install -Dm644 ../lb-planner.desktop -t "$pkgdir/usr/share/applications"
	install -Dm644 app_icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/lb-planner.png"
	install -Dm644 app_icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/lb-planner.svg"
	#NOTE: install can't copy whole directories, so I'm finding all files within the folder and installing them one-by-one
	cd ./build/linux/x64/release/bundle/
	find ./ -type f -exec install -D "{}" "$pkgdir/opt/$pkgname/{}" \;
}
