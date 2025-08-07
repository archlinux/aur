# Maintainer: Markus Sommer <markus@splork.de>

_gopkgname='github.com/dtn7/dtn7-go'

pkgname=dtn7
pkgver=0.10.0
pkgrel=1
pkgdesc="Delay tolerant routing daemon - Implements Bundle Protocol Version 7"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://dtn7.github.io/"
license=('GPL3')
depends=("glibc")
makedepends=("go")
provides=('dtnd' "dtnclient")
conflicts=('dtnd')
backup=("etc/dtn7/config.toml" "etc/ufw/applications.d/dtn7")
source=("https://$_gopkgname/archive/v$pkgver.tar.gz"
        "config.toml"
        "dtn7.service"
        "dtn7.sysusers"
        "dtn7.tmpfiles"
        "dtn7.ufw")
sha512sums=("43431589d3589d5be867fb719c94adc34a32e9322f889893f2115b8efbb769ba6dede142879666a1e7ec5971021ac147b51aaa773de6cc7f104645eac3544363"
            "51e0a00afbbaa437852713c8f1f79d6c7a59d347568b7c367dd88d8ef7fde7f823b0bcdd0cdc1e90a0d4db1f1f3923672c4db3ef2a1dc935c7e18d567961e56e"
            "8c6bc8bd67b48a7442c714839be068741b478def45970f57cccca7d1a62fd0b4adbee2680b4fff1f0dd1cb1ccd7cc7da1bf9cd6b4f468d397168c0acc223c7cd"
            "714a43cc0d6520b8bf6a9fc09bbec8828a4d9f8d5f17b029a35885c4c418a62ac47bf5dc1a052153963750ca1ed43352db360e0d5a80339967c033abff7d8888"
            "3716cea39f6e6a2e2623a0decb2531ddd0925258ea4ebabd315d03a2ed2ec6415d0575f1ba9e561a20f270c925c7fd247a6cdd9d3fa672352337b105cd5aca2a"
            "c026883b2cc5f46a1bdd2a13688012c469a57f8f9678f0bb3bbd2b84c00451afbc3eb7423055eefd08f1a8ab609856697e6d7aee63eb1b896f7ff417b7f6c0ab")

build() {
	cd "$srcdir/$pkgname-go-$pkgver"
	go build -buildmode=pie -trimpath -ldflags "-s -w" ./cmd/dtnd
	go build -buildmode=pie -trimpath -ldflags "-s -w" ./cmd/dtnclient
}

package() {
	install -D -m 0644 "config.toml" "$pkgdir/etc/dtn7/config.toml"
	install -D -m 0644 "dtn7.service" "$pkgdir/usr/lib/systemd/system/dtn7.service"
	install -D -m 0644 "dtn7.sysusers" "$pkgdir/usr/lib/sysusers.d/dtn7.conf"
	install -D -m 0644 "dtn7.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/dtn7.conf"
	install -D -m 0644 "dtn7.ufw" "$pkgdir/etc/ufw/applications.d/dtn7"

	cd "$srcdir/$pkgname-go-$pkgver"
	install -D -m 0755 dtnd "$pkgdir/usr/bin/dtnd"
	install -D -m 0755 dtnclient "$pkgdir/usr/bin/dtnclient"
}
