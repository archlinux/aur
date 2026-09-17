# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=stayorganised
appname=stayorganised
pkgver=0.3.3
pkgrel=1
pkgdesc="Calendar-first personal agenda manager designed to replace Google Calendar, Outlook etc"
arch=('x86_64')
url="https://gitlab.com/nathanchere/stayorganised"
license=('Apache-2.0')
depends=('fmt' 'layer-shell-qt' 'qt6-base' 'qt6-svg' 'qt6-wayland' 'qtkeychain-qt6' 'spdlog' 'wayland')
makedepends=('cmake' 'git' 'ninja' 'pkgconf' 'wayland-protocols')
source=("${appname}::git+https://gitlab.com/nathanchere/stayorganised.git#tag=v${pkgver}")
sha256sums=('71d90ba531f970d32f3f3064e4ff432cb34ec6d6e297a78432ae0afdf99e11d1')

build() {
	cmake -S "$srcdir/$appname" -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSTAYORGANISED_VERSION="$pkgver"
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
