# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=pomerium-bin
pkgname=(pomerium-bin pomerium-cli-bin)
pkgver=0.15.0
pkgrel=2
pkgdesc='An identity-aware access proxy'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://www.pomerium.io'
license=('Apache')
source=('pomerium.sysusers')
source_x86_64=("pomerium-server-${pkgver}-x86_64.deb::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium_${pkgver}-1_amd64.deb"
               "pomerium-cli-${pkgver}-x86_64.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-amd64.tar.gz")
source_armv6h=("pomerium-cli-${pkgver}-armv6h.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-armv6.tar.gz")
source_armv7h=("pomerium-cli-${pkgver}-armv7h.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-armv7.tar.gz")
source_aarch64=("pomerium-server-${pkgver}-aarch64.deb::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium_${pkgver}-1_arm64.deb"
               "pomerium-cli-${pkgver}-aarch64.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-arm64.tar.gz")
sha256sums=('36b44da89f922a8017d5b26ac6fd71215e4d82525d94161f999aba6e223fd111')
sha256sums_x86_64=('121e4e16b32820a5d5433f2f60cd59753b5ea2a91eaf6bc995400b3a2dc30482'
                   '7f021f9abaae13ce997864b4ba44353bcd2d08ba8ff8ffc2b94e176c1cc289b1')
sha256sums_armv6h=('d858e8f1eaa8cfdd792641db514d7049bfce105b5ac263fa174372f6fb4db560')
sha256sums_armv7h=('6ebd26376480456ecfbabe2e6d0bf1a576df5f3ef09385a2e88a75cb33f463e5')
sha256sums_aarch64=('6303401b1ac8efc6579bee3fbdee03220fa706c42b3cc0388f1b0c37324428e2'
                    '025faa78541df948bb81d9e3e3dd7916ce9b24eae5668c9643d3cd347c46bee1')

prepare() {
	mkdir dump
	bsdtar xf data.tar.gz -C dump
}

package_pomerium-bin() {
	pkgdesc+=' -- server component'
	arch=('x86_64' 'aarch64')
	provides=('pomerium')
	conflicts=('pomerium')
	backup=('etc/pomerium/config.yaml')
	optdepends=('pomerium-cli: CLI component for interacting with server')

	install -Dm 644 pomerium.sysusers "$pkgdir/usr/lib/sysusers.d/pomerium.conf"

	cd dump
	install -Dm 755 usr/sbin/pomerium -t "$pkgdir/usr/bin/"
	install -Dm 644 usr/lib/systemd/system/pomerium.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm 644 etc/pomerium/config.yaml -t "$pkgdir/etc/pomerium/"
}

package_pomerium-cli-bin() {
	pkgdesc+=' -- CLI component'
	provides=('pomerium-cli')
	conflicts=('pomerium-cli')

	install -Dm 755 pomerium-cli -t "$pkgdir/usr/bin/"
}
