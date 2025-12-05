# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=passless
pkgname="${_pkgname}-bin"
pkgver=0.6.2
pkgrel=1
pkgdesc="FIDO2 security token emulator"
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
sha256sums=('579370a957828ce0ead4bf34bcd763df3782ecce4845e12b0ffa144e2d007269'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
	install -Dm755 passless "${pkgdir}/usr/bin/passless"

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
