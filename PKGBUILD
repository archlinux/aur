# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=passless
pkgname="${_pkgname}-bin"
pkgver=0.19.0
pkgrel=1
pkgdesc="Virtual FIDO2 device and client FIDO 2 utility. Passkeys made easy."
arch=('x86_64' 'aarch64')
url="https://github.com/pando85/passless"
license=('GPL')
install=passless.install
depends=('gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/pando85/passless/releases/download/v${pkgver}/passless-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz"
        "passless-${pkgver}.tar.gz::https://github.com/pando85/passless/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/pando85/passless/releases/download/v${pkgver}/passless-completions-${pkgver}.tar.gz"
        "passless.install")
sha256sums=('80a800921e696c85d087964e7cab1c09a24cd89b417c949cf8b7d2d3760cb94c'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
	install -Dm755 passless "${pkgdir}/usr/bin/passless"
	install -Dm755 sign-proxy "${pkgdir}/usr/bin/sign-proxy"
	install -Dm755 agent-prompt-probe "${pkgdir}/usr/bin/agent-prompt-probe"

	# Install shell completions
	if [ -f "passless.bash" ]; then
		install -Dm0644 passless.bash \
			"${pkgdir}/usr/share/bash-completion/completions/passless"
	fi
	if [ -f "passless.fish" ]; then
		install -Dm0644 passless.fish \
			"${pkgdir}/usr/share/fish/vendor_completions.d/passless.fish"
	fi
	if [ -f "_passless" ]; then
		install -Dm0644 _passless \
			"${pkgdir}/usr/share/zsh/site-functions/_passless"
	fi
	if [ -f "passless.elv" ]; then
		install -Dm0644 passless.elv \
			"${pkgdir}/usr/share/elvish/lib/passless.elv"
	fi

	install -Dm0644 "passless-${pkgver}/contrib/systemd/passless.service" \
		"${pkgdir}/usr/lib/systemd/user/passless.service"
	install -Dm0644 "passless-${pkgver}/contrib/udev/90-passless.rules" \
		"${pkgdir}/usr/lib/udev/rules.d/90-passless.rules"
	install -Dm0644 "passless-${pkgver}/contrib/sysusers.d/passless.conf" \
		"${pkgdir}/usr/lib/sysusers.d/passless.conf"
	install -Dm0644 "passless-${pkgver}/contrib/modules-load.d/fido.conf" \
		"${pkgdir}/etc/modules-load.d/fido.conf"
}
