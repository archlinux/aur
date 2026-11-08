# Maintainer: tomori
pkgname=tomori-git
pkgver=r8.g22a0cb5
pkgrel=1
pkgdesc='A cross-platform Minecraft launcher written in Go'
arch=('x86_64')
url='https://github.com/UruhaLushia/tomori'
license=('GPL-3.0-only')
depends=('gtk3')
makedepends=('git' 'go')
provides=('tomori')
conflicts=('tomori')
source=('tomori::git+https://github.com/UruhaLushia/tomori.git')
sha256sums=('SKIP')
options=('!debug')

pkgver() {
	cd "$srcdir/tomori"
	(
		set -o pipefail
		git describe --long --tags --abbrev=7 --exclude=rolling 2>/dev/null |
			sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$srcdir/tomori"
	CGO_ENABLED=0 go tool mygo build \
		-platform linux/amd64 \
		-skip-installer \
		-skip-dmg \
		-o "$srcdir/build"
}

package() {
	install -Dm755 "$srcdir/build/linux-amd64/tomori" "$pkgdir/usr/bin/tomori"
	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/tomori.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Tomori
Exec=tomori %U
Categories=Game;
Terminal=false
StartupWMClass=tomori
MimeType=x-scheme-handler/tomori;
EOF
}
