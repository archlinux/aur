# Maintainer: Eric Biggers <ebiggers3 at gmail dot com>

pkgname=fscrypt-git
pkgver=0.2.7.0.g2b160ae
pkgrel=1
pkgdesc='A tool for managing Linux filesystem encryption'
arch=('x86_64')
url='https://github.com/google/fscrypt'
license=('Apache')
makedepends=('go-pie' 'git')
depends=('pam')
conflicts=('fscrypt')
provides=('fscrypt')
source=('git+https://github.com/google/fscrypt.git'
        'pam_config')
sha256sums=('SKIP'
            'ae6ceaefc6d936c95a9b7a3f925111ffb946e6fd0152373247f1d40132f05aef')

pkgver() {
  cd fscrypt
  git describe --tags --long | sed 's/^v//' | tr - .
}

build() {
  cd fscrypt
  make
}

package() {
  cd fscrypt
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 ../pam_config "${pkgdir}/etc/pam.d/fscrypt"
  install -Dm644 -t "$pkgdir/usr/share/doc/fscrypt/" README.md

  # Remove Ubuntu-specific PAM file
  rm -rf "$pkgdir"/usr/share/pam-configs/
}
