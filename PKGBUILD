# Maintainer: Luca Saalfeld <luluklzde@gmail.com>

# this is my first package, I mostly copied it from prefabs and other PKGBUILD's

pkgname=minecraft-infrared-git
pkgver=v2.0.0.alpha.r2.r0.e401591
pkgrel=1
pkgdesc="A reverse proxy for minecraft servers."
arch=('x86_64')
url="https://github.com/haveachin/infrared"
license=('AGPL-3.0-only')
groups=()
depends=()
makedepends=('git' 'go')
# Infrared is spelled as 'minecraft-infrared' to avoid conflicts with the other 'infrared-git' package
provides=("minecraft-infrared")
conflicts=("minecraft-infrared")
replaces=()
backup=()
options=()
install=
source=('infrared::git+https://github.com/haveachin/infrared.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/infrared"
	
	# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/infrared"
	# for some reason make likes to ignore this step and just print 'build is up to date' without a build existing
	make -B build
}

check() {
	cd "$srcdir/infrared"
	make test
}

package() {
	cd "$srcdir/.."
	install -Dm644 "infrared.service" "$pkgdir/usr/lib/systemd/system/infrared.service"
	install -Dm644 "infrared.ufw" "$pkgdir/etc/ufw/applications.d/infrared" 
	
	cd "$srcdir/infrared"
	
	install -Dsm755 "out/infrared" "$pkgdir/usr/bin/infrared"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
