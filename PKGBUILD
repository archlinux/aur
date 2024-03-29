# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=pam-exec-oauth2
pkgver=0.0.1
pkgrel=2
pkgdesc='Allows Linux user authentication to OAuth2 via pam_exec'
arch=(x86_64)
url="https://github.com/shimt/$pkgname"
license=(MIT)
makedepends=(go)
backup=("etc/pam.d/${pkgname#pam-}"
        "etc/$pkgname.yml")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
        "$pkgname.pam"
        "$pkgname.yml")
sha256sums=('557dd202be7e9c94c1e58a3440835d2a6a4fdcfdc89a934cf19ecb1573c56815'
            '90e85140a7194f4f2d95daa0959e75ec784fac9f49226ff43cef6e35139b48de'
            '1c302bb98640aa0a6197a1fdd6e6643dc94b3c961f99a6f73851c665c91de55b')

build() {
	cd "$_archive"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags \"$LDFLAGS\"" \
		.
}

package() {
	cd "$_archive"
	install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm600 -t "$pkgdir/etc/" ../$pkgname.yml
	install -Dm644 "../$pkgname.pam" "$pkgdir/etc/pam.d/${pkgname#pam-}"
}
