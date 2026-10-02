# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=noirpass
pkgver=1.0.1
pkgrel=1
pkgdesc="Minimal on-demand GPG-backed freedesktop Secret Service"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/koharu/noirpass"
license=('Apache-2.0')
depends=('dbus' 'gcc-libs' 'glibc' 'gnupg' 'openssl')
makedepends=('capnproto' 'cargo' 'clang' 'pkgconf')
provides=('org.freedesktop.secrets')

_tag=v${pkgver}

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
b2sums=('54780c212debae668d0b58cfc036bd507b50b1abe1323e27057822a4e38a02d2b60569ef3fc23939476474f351699af0240617d9a71b26bacef975dee1eb2d1c')

prepare() {
	cd "${pkgname}"

	cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
	cd "${pkgname}"

	cargo build --frozen --release --target-dir target
}

check() {
	cd "${pkgname}"

	cargo test --frozen --release --target-dir target
}

package() {
	cd "${pkgname}"

	install -Dm755 target/release/noirpass \
		"${pkgdir}/usr/bin/noirpass"

	install -Dm644 systemd/org.freedesktop.secrets.service \
		"${pkgdir}/usr/share/dbus-1/services/org.freedesktop.secrets.service"

	install -Dm644 systemd/noirpass.service \
		"${pkgdir}/usr/lib/systemd/user/noirpass.service"

	install -Dm644 README.md \
		"${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
