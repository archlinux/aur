# Maintainer: Riedler <dev@riedler.wien>

_repo=lb_planner_app

pkgname=lb-planner
pkgver=1.2.0
pkgrel=1
pkgdesc='a Planning tool for students at the TGM Vienna'
arch=('x86_64')
url="https://github.com/necodeIT/$_repo"
license=('CC-NC-SA 4.0')
depends=('gtk3' 'xz')
makedepends=('cmake' 'clang' 'ninja' 'fvm' 'pkgconf' 'gtk3' 'xz')
source=(
	"$pkgname.tar.gz::https://github.com/necodeIT/$_repo/archive/$pkgver.tar.gz"
	"lb-planner.desktop"
	".env"
	)
sha256sums=(
	'3c01d976f19f449351c6ab106956e086a0c1376503a2b7555900b8f81bbcd6f7'
	'60e1bd92785022878f71b51f972ddf9dabb851951432e1cb72c69640b6f02bb6'
	'717795fa794d8d33e056f5b3f2890ee2cdd948ba38e1db2f5214cd1264287309'
	)
conflicts=('lb-planner-git')

prepare() {
	cd "$_repo-$pkgver"
	fvm use --force
	fvm flutter pub get
}

build() {
	cd "$_repo-$pkgver"
	fvm flutter config --enable-linux-desktop #TODO: check if this is even necessary
	fvm flutter build linux --release \
		--dart-define-from-file=../.env \
		--dart-define=RELEASE_DATE="$(git show -s --format=%as)"
}

package() {
	cd "$_repo-$pkgver"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 LICENSE.md "$pkgdir/opt/$pkgname/LICENSE"
	install -Dm644 ../lb-planner.desktop -t "$pkgdir/usr/share/applications"
	install -Dm644 app_icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/lb-planner.svg"
	#NOTE: install can't copy whole directories, so I'm finding all files within the folder and installing them one-by-one
	cd ./build/linux/x64/release/bundle/
	find ./ -type f -exec install -D "{}" "$pkgdir/opt/$pkgname/{}" \;
}
