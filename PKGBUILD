# Contributor: Henrik Hodne <henrik@hodne.io>
# Maintainer: Dennis Schubert <mail@dennis-schubert.de>

pkgname=ruby-install
pkgver=0.6.1
pkgrel=1
pkgdesc="Installs Ruby, JRuby, Rubinius, MagLev or MRuby."
arch=(any)
url="https://github.com/postmodern/ruby-install"
license=('MIT')
depends=('bash')
optdepends=('zsh')
makedepends=('gnupg')
source=("https://github.com/postmodern/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b3adf199f8cd8f8d4a6176ab605db9ddd8521df8dbb2212f58f7b8273ed85e73')

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
