# Maintainer: Eric Biggers <ebiggers3 at gmail dot com>

pkgname=fscrypt-git
pkgver=0.2.1.1.ga949b13
pkgrel=1
pkgdesc='A tool for managing Linux filesystem encryption'
arch=('x86_64' 'i686')
url='https://github.com/google/fscrypt'
license=('Apache')
makedepends=('git' 'go')
depends=('argon2' 'pam')
provides=('fscrypt')
source=('git://github.com/google/fscrypt.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/fscrypt"
	git describe --tags --long | tr - .
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
	make DESTDIR="${pkgdir}/usr/bin" \
	     PAM_MODULE_DIR="${pkgdir}/usr/lib/security" \
	     PAM_CONFIG_DIR="${pkgdir}/usr/share/pam-configs" \
	     install
	install -Dm644 README.md "${pkgdir}/usr/share/fscrypt/README.md"
}
