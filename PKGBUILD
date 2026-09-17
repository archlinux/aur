# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=stayorganised-git
appname=stayorganised
pkgver=0.3.3.r1.g8f13216
pkgrel=1
pkgdesc="Calendar-first personal agenda manager designed to replace Google Calendar, Outlook etc (git version)"
arch=('x86_64')
url="https://gitlab.com/nathanchere/stayorganised"
license=('Apache-2.0')
depends=('fmt' 'layer-shell-qt' 'qt6-base' 'qt6-svg' 'qt6-wayland' 'qtkeychain-qt6' 'spdlog' 'wayland')
makedepends=('cmake' 'git' 'ninja' 'pkgconf' 'wayland-protocols')
provides=('stayorganised')
conflicts=('stayorganised')
source=("${appname}::git+https://gitlab.com/nathanchere/stayorganised.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$appname"
	git describe --long --tags --abbrev=7 --match 'v[0-9]*' |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "$srcdir/$appname" -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	install -Dm644 "$srcdir/$appname/resources/icons/tray.svg" \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/stayorganised.svg"
	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/stayorganised.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=StayOrganised
Comment=Calendar-first personal agenda manager designed to replace Google Calendar, Outlook etc
Exec=stayorganised
Icon=stayorganised
Terminal=false
Categories=Office;Calendar;Contacts;Email
EOF
	install -Dm644 "$srcdir/$appname/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
