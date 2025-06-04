# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=shiru-git
_pkgname=shiru
pkgver=r1560.7ed5569
pkgrel=1
pkgdesc="BitTorrent streaming software with no paws in the way—watch anime in real-time, no waiting for downloads!"
arch=('x86_64')
url="https://github.com/RockinChaos/Shiru"
license=('GPL-3.0')
#depends=()
makedepends=('git' 'npm' 'pnpm')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/$_pkgname/electron"
	pnpm install
}

build() {
	cd "$srcdir/$_pkgname/electron"
	pnpm build
}

package() {
	cd "$srcdir/$_pkgname/electron/"
	install -Dm755 dist/linux-Shiru-*.AppImage "$pkgdir/usr/bin/$_pkgname"
	install -D "buildResources/icon.png" "$pkgdir/usr/share/icons/$_pkgname.png"

	install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop <<EOF
[Desktop Entry]
Name=Shiru
Comment=BitTorrent streaming software with no paws in the way—watch anime in real-time, no waiting for downloads!
Exec=/usr/bin/$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Categories=AudioVideo;
EOF
}
