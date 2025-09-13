# Maintainer: Pooyan Khanjankhani <pooyankhan@gmail.com>
# SPDX-FileCopyrightText: 2025 Pooyan Khanjankhani <pooyankhan@gmail.com>
#
# SPDX-License-Identifier: 0BSD

pkgname=ella
pkgver='0.0.8'
pkgrel=5
pkgdesc='A process manager for running and managing services'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'armv6l' 'riscv64')
url='https://github.com/thekhanj/ella'
conflicts=('ella-bin')
license=('MIT')
makedepends=('go>=1.24.5')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('cf5420f1fa53230f698675324741f4f519343bcdc72666ca455a0abe36da95ff1173e608cbd1f2f0234f9288e47b24047dbd9a6b48c3a2f0c99fd9bb0732202f')

_go_cleanup() {
	chmod 700 "${srcdir}/gopath" -R
	rm -r "${srcdir}/gopath"
}

build() {
	export GOPATH="${srcdir}/gopath"

	go install github.com/atombender/go-jsonschema@latest &&
		go install golang.org/x/tools/cmd/stringer@latest || {
		_go_cleanup
		exit 1
	}

	cd "${srcdir}/ella-${pkgver}"
	PATH="$GOPATH/bin:$PATH" make || {
		_go_cleanup
		exit 1
	}

	_go_cleanup
}

package() {
	cd "${srcdir}/ella-${pkgver}"
	./install "${pkgdir}"
}
