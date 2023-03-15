# Maintainer: tPenguinLTG <tpenguinltg@disroot.org>
pkgname=oed
pkgver=7.1
pkgrel=2
pkgdesc="OpenED: Portable OpenBSD ed(1) editor."
arch=(x86_64 i686)
url="https://github.com/ibara/oed"
license=('BSD' 'ISC')
depends=()
source=("https://github.com/ibara/${pkgname}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
sha256sums=('227ad4e6e9d2adb3a4b743c8ad3a50bcda63dea146d41bd6cbd8b79f495b057b')

build() {
	local f
	local license_file

	cd "$pkgname-$pkgname-$pkgver"

	# On systems without ed installed, configure will default to building
	# as ed instead of oed. Force the it to always build as oed instead.
	./configure --prefix=/usr --mandir=/usr/share/man --program-name=oed
	make

	# Extract licenses from files
	mkdir ../licenses
	for f in *.c *.h; do
		license_file="../licenses/${f}.LICENSE"
		sed '/Copyright/!d; :a; s/ \* \{0,1\}//; n; /\*\//d; $!ba' "$f" >"$license_file"
		[ -s "$license_file" ] || rm -f -- "$license_file"
	done
}

package() {
	local f

	cd "$pkgname-$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# Install licenses
	for f in ../licenses/*.LICENSE; do
		install -Dm644 "$f" "$pkgdir/usr/share/licenses/$pkgname/${f##*/}"
	done
}
