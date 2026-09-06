# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=passless
pkgname="${_pkgname}-bin"
pkgver=0.19.2
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
sha256sums=('3d2f820650c2f4683129053bf6573603f7fa31d3b9364ac85d1cad8719d95581'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
	install -Dm755 passless "${pkgdir}/usr/bin/passless"
	install -Dm755 passless-git-sync "${pkgdir}/usr/bin/passless-git-sync"
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
