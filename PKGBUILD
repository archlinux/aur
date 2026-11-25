# Maintainer: Scott <158021536+nathawatc@users.noreply.github.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=noirpass
pkgver=1.0.2
pkgrel=1
pkgdesc="Minimal on-demand GPG-backed freedesktop Secret Service"
arch=('x86_64' 'aarch64')
url="https://github.com/nathawatc/noirpass"
license=('Apache-2.0')
depends=('dbus' 'gcc-libs' 'glibc' 'gnupg' 'openssl')
makedepends=('capnproto' 'cargo' 'clang' 'pkgconf')
provides=('org.freedesktop.secrets')

_tag=v${pkgver}

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
b2sums=('cff8418724e973d0799d3264e60e4ef54574e6f4693fa0f7b8639d7cb2c9d4a8f2d74b1b76b50d66d3a3ba8a85224a7a61e4792fe12eead10827bcff0b33bdc4')

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked
}

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --frozen --release --target-dir target
}

check() {
	cd "${pkgname}-${pkgver}"

	cargo test --frozen --release --target-dir target
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 target/release/noirpass \
		"${pkgdir}/usr/bin/noirpass"

	install -Dm644 systemd/org.freedesktop.secrets.service \
		"${pkgdir}/usr/share/dbus-1/services/org.freedesktop.secrets.service"

	install -Dm644 systemd/noirpass.service \
		"${pkgdir}/usr/lib/systemd/user/noirpass.service"

	install -Dm644 man/noirpass.1 \
		"${pkgdir}/usr/share/man/man1/noirpass.1"

	install -Dm644 man/noirpass.toml.5 \
		"${pkgdir}/usr/share/man/man5/noirpass.toml.5"

	install -Dm644 README.md \
		"${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
