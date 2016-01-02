# Maintainer: Henrik Hodne <henrik@hodne.io>

pkgname=ruby-install
pkgver=0.6.0
pkgrel=1
pkgdesc="Installs Ruby, JRuby, Rubinius, MagLev or MRuby."
arch=(any)
url="https://github.com/postmodern/ruby-install"
license=('MIT')
depends=('bash')
optdepends=('zsh')
makedepends=('gnupg')
source=(https://github.com/postmodern/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('3cc90846ca972d88b601789af2ad9ed0a496447a13cb986a3d74a4de062af37d')

prepare() {
    if gpg --fingerprint 0xB9515E77 >/dev/null 2>&1; then
	# Download key
	msg "Downloading package signature"
	curl -L -o ${pkgname}-${pkgver}.tar.gz.asc https://raw.github.com/postmodern/${pkgname}/master/pkg/${pkgname}-${pkgver}.tar.gz.asc -s

	# Check key
	if gpg --verify ${pkgname}-${pkgver}.tar.gz.asc ${srcdir}/v${pkgver}.tar.gz; then
	    msg "Verification of package was successful."
	else
	    msg "Verification of package failed. Please check yourself with:"
	    echo "gpg --verify ${pkgname}-${pkgver}.tar.gz.asc ${srcdir}/v${pkgver}.tar.gz"
	fi
    else
	printf "\n\n"
	msg "Please import the gpg key of the ruby-install author, to check package integrity:"
	msg "https://postmodern.github.io/contact.html#pgp"
	printf "\n\n"
    fi
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make PREFIX="${pkgdir}/usr" install
}
