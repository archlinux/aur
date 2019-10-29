# Maintainer: Eric Biggers <ebiggers3 at gmail dot com>

pkgname=fscrypt-git
pkgver=0.2.5.8.ga3434e4
pkgrel=1
pkgdesc='A tool for managing Linux filesystem encryption'
arch=('x86_64' 'i686')
url='https://github.com/google/fscrypt'
license=('Apache')
makedepends=('git' 'go')
depends=('pam')
provides=('fscrypt')
source=('git+https://github.com/google/fscrypt.git' 'pam_config')
sha256sums=('SKIP'
            'ae6ceaefc6d936c95a9b7a3f925111ffb946e6fd0152373247f1d40132f05aef')

pkgver() {
	cd "${srcdir}/fscrypt"
	git describe --tags --long | sed 's/^v//' | tr - .
}

prepare() {
	export GOPATH="${srcdir}/go"
	mkdir -p "${GOPATH}/src/github.com/google"
	ln -sf "${srcdir}/fscrypt" "${GOPATH}/src/github.com/google/"
}

build() {
	export GOPATH="${srcdir}/go"
	cd "${GOPATH}/src/github.com/google/fscrypt"
	make
}

package() {
	cd "${srcdir}/fscrypt"
	make PREFIX="${pkgdir}/usr" install
	install -Dm644 README.md "${pkgdir}/usr/share/fscrypt/README.md"
	install -Dm644 ../pam_config "${pkgdir}/etc/pam.d/fscrypt"
}
