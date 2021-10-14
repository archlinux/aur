# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=pomerium-bin
pkgname=(pomerium-bin pomerium-cli-bin)
pkgver=0.15.4
pkgrel=1
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
sha256sums_x86_64=('1da71cc4f1b1ca6ac3be0eae5052da38d9d61bcb158b1a0997d2f51dc0cca9d8'
                   '8f8599c860ba4263b7650f43037fac0ffabf558b5a891e3ac91285547091c830')
sha256sums_armv6h=('fc63cf428efe8ad291d2e3c6b903c76ce8cf9ee8a29c0bc0db940ff98941d8a1')
sha256sums_armv7h=('38362ff8b6de07f58f1f506dcb06861193eaaa9fa0d26f5c3dae3cfd9bca757d')
sha256sums_aarch64=('65df93fff35daa4540625b2173bfb6354fc6240a9d164dc565f0f001300b3c68'
                    'e140ace0849544119e6bbbfd4a8e975283edc9736a7da6192a60dbc0124558fd')

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
