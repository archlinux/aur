pkgbase=smallstep
pkgname=('smallstep-ca' 'smallstep-cli')
pkgrel=2
pkgver=0.29.0
pkgdesc='smallstep'
url='https://github.com/smallstep'
license=('Apache-2.0')
arch=(x86_64 aarch64)

makedepends=('go' 'pcsclite')

source=("${pkgbase}-ca-${pkgver}.tar.gz::https://github.com/smallstep/certificates/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgbase}-cli-${pkgver}.tar.gz::https://github.com/smallstep/cli/archive/refs/tags/v${pkgver}.tar.gz"
	"step-ca.service")

sha256sums=('85855b044d9eb846932af963c06ab1bf41cc4a2c38f500bc3dabd8a3fbd36b40'
            '6dbdec708ed4b52914113925e2fd1af53ca7484a2affa2dfb93749adec524c0e'
            '61cc97068b78d1ceb46f54143903a005f049c035bb701586e94068584b1cc4ec')

build() {
	msg "building certificates"
	cd "${srcdir}/certificates-${pkgver}"
	CGO_ENABLED=1 go build -o $srcdir/step-ca ./cmd/step-ca
	msg "building cli"
	cd "${srcdir}/cli-${pkgver}"
	CGO_ENABLED=1 go build -o $srcdir/step-cli ./cmd/step
	
}

package_smallstep-ca() {
depends=('pcsclite')
	install -D -m 755 -o root -g root $srcdir/step-ca $pkgdir/usr/bin/step-ca
	install -D -m 644 -o root -g root $srcdir/step-ca.service $pkgdir/usr/lib/systemd/system/step-ca.service
}

package_smallstep-cli() {
	install -D -m 755 -o root -g root $srcdir/step-cli $pkgdir/usr/bin/step
	for s in cert-renewer.target cert-renewer@.service cert-renewer@.timer ssh-cert-renewer.service ssh-cert-renewer.timer; do
		install -D -m 644 -o root -g root $srcdir/cli-${pkgver}/systemd/${s} $pkgdir/usr/lib/systemd/system/${s}
	done
}
