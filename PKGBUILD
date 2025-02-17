# Maintainer: Riedler <dev@riedler.wien>

_pkgname=lb-planner
pkgname=${_pkgname}-git
pkgver=1.2.0.979_1c505a5
pkgrel=1
pkgdesc='a Planning tool for students at the TGM Vienna (unstable version)'
provides=('lb-planner')
arch=('x86_64')
url='https://github.com/necodeIT/lb_planner_app'
license=('CC-NC-SA 4.0')
depends=('gtk3' 'xz')
makedepends=('cmake' 'clang' 'ninja' 'fvm' 'pkgconf' 'gtk3' 'xz')
source=(
	"$_pkgname::git+https://github.com/necodeIT/lb_planner_app.git#branch=main"
	"lb-planner.desktop"
	".env"
)
sha256sums=(
	'SKIP'
	'60e1bd92785022878f71b51f972ddf9dabb851951432e1cb72c69640b6f02bb6'
	'bf1c21c5307e93b8234072a7c1490c4fc6152588f0eec3fdddef08ca22ce4de4'
)

pkgver() {
	cd "$_pkgname"
	printf "%s.%s_%s" "$(git describe --tags "$(git rev-list --tags --max-count=1)")" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	fvm use --force
	fvm flutter pub get
}

build() {
	cd "$_pkgname"
	IFS='.' read -r major minor patch rev <<< "${pkgver}"
	fvm flutter config --enable-linux-desktop #TODO: check if this is even necessary
	fvm flutter build linux --release \
		--dart-define-from-file=../.env \
		--dart-define=MAJOR_VERSION=$major \
		--dart-define=MINOR_VERSION=$minor \
		--dart-define=PATCH_VERSION=$patch \
		--dart-define=BUILD_NUMBER=$rev
}

package() {
	cd "$_pkgname"
	install -Dm644 ../lb-planner.desktop -t "$pkgdir/usr/share/applications"
	install -Dm644 app_icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/lb-planner.svg"
	#NOTE: install can't copy whole directories, so I'm finding all files within the folder and installing them one-by-one
	cd ./build/linux/x64/release/bundle/
	find ./ -type f -exec install -D "{}" "$pkgdir/opt/$_pkgname/{}" \;
}
