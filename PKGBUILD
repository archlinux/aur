# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=tpm2-totp-git
pkgver=0.1.0.r28.a388092
pkgrel=1
pkgdesc='Attest the trustworthiness of a device against a human using time-based one-time passwords'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-totp'
license=('BSD')
depends=('qrencode' 'tpm2-tss')
makedepends=('git' 'autoconf-archive' 'pandoc' 'plymouth')
checkdepends=('ibm-sw-tpm2' 'iproute2' 'mkinitcpio' 'oath-toolkit' 'procps-ng' 'psmisc' 'tpm2-tools-git')
optdepends=('mkinitcpio: display the TOTP during boot'
            'plymouth: display the TOTP during boot')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	autoreconf --install --force
}

build() {
	cd "${pkgname%-git}"
	(( CHECKFUNC )) && _opts=('--enable-integration')
	./configure --prefix=/usr \
	            --libexecdir=/usr/lib \
	            --with-mkinitcpiodir=/usr/lib/initcpio \
	            "${_opts[@]}"
	make
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
