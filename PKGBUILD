# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=pam-exec-oauth2
pkgver=0.0.0
_sha=023ac35ab559f3e0210c6dd4a88256234bfc7ce9
pkgrel=2
pkgdesc='Allows Linux user authentication to OAuth2 via pam_exec'
arch=(x86_64)
url="https://github.com/shimt/$pkgname"
license=(MIT)
makedepends=(go)
backup=("etc/pam.d/${pkgname#pam-}"
		"etc/$pkgname.yml")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_sha.tar.gz"
		"$pkgname.pam"
		"$pkgname.yml")
sha256sums=('3067444aa8c9b388f37dd4feeb75057bed2d5ce6b762c5db2ddb49c1ef530b33'
            '90e85140a7194f4f2d95daa0959e75ec784fac9f49226ff43cef6e35139b48de'
            '1c302bb98640aa0a6197a1fdd6e6643dc94b3c961f99a6f73851c665c91de55b')

build() {
	cd "$pkgname-$_sha"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags \"$LDFLAGS\"" \
		.
}

package() {
	cd "$pkgname-$_sha"
	install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm600 -t "$pkgdir/etc/" ../$pkgname.yml
	install -Dm644 "../$pkgname.pam" "$pkgdir/etc/pam.d/${pkgname#pam-}"
}
