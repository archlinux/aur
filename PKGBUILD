# Maintainer: Eric Biggers <ebiggers3 at gmail dot com>

pkgname=fscrypt-git
pkgver=0.3.4.0.gf91f8e4
pkgrel=1
pkgdesc='A tool for managing Linux filesystem encryption'
arch=('x86_64')
url='https://github.com/google/fscrypt'
license=('Apache')
makedepends=('go' 'git')
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
  make GO_FLAGS="-buildmode=pie -mod=readonly -modcacherw" \
       GO_LINK_FLAGS="-s -w -linkmode=external"
}

package() {
  cd fscrypt
  make DESTDIR="$pkgdir" PREFIX=/usr PAM_CONFIG_DIR="" install
  install -Dm644 ../pam_config "${pkgdir}/etc/pam.d/fscrypt"
  install -Dm644 -t "$pkgdir/usr/share/doc/fscrypt/" README.md NEWS.md
}
