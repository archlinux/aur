# Maintainer: tPenguinLTG <tpenguinltg@disroot.org>
pkgname=oed
pkgver=6.7
pkgrel=1
pkgdesc="OpenED: Portable OpenBSD ed(1) editor."
arch=(x86_64 i686)
url="https://github.com/ibara/oed"
license=('BSD' 'ISC')
depends=()
source=("https://github.com/ibara/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('95bb8ea554a91784a76eeeeb53b42e65')

build() {
	local f
	local license_file

	cd "$pkgname-$pkgver"

	./configure --prefix=/usr --mandir=/usr/share/man
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

	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	
	# Install licenses
	for f in ../licenses/*.LICENSE; do
	  install -Dm644 "$f" "$pkgdir/usr/share/licenses/$pkgname/${f##*/}"
	done
}
