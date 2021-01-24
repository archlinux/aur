# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=openssl-tpm-engine
pkgver=0.5.0+jejb
pkgrel=1
pkgdesc="OpenSSL engine for TPM 1.2 hardware-backed keys"
arch=(i686 x86_64)
url="https://github.com/mgerstner/openssl_tpm_engine"
license=(custom:openssl)
depends=(openssl trousers)
_commit=b28de5065e6eb9aa5d5afe2276904f7624c2cbaf
source=("$pkgname::git+https://github.com/mgerstner/openssl_tpm_engine#commit=$_commit"
        0001-try-well-known-authority-for-SRK-first.patch
        0002-Handle-EVP-keys.patch
        0003-Add-option-for-random-migration-authority.patch
        0004-e_tpm-reduce-TPM-connection-time.patch)
sha256sums=('SKIP'
            'b713c5e46e6ea26bee50234786a8d24da154b52f078c5580508c72f644c45083'
            '5eeb49e0af7f393bfcabc7a82f6b4d13c57e7bbc4219e7cca4316bc2ec0e5bb1'
            '95489c2c01544081bc19ac9a9210227ebe17f97e72e83be38579cf6a19dfbbe0'
            '682da7346e3351b8e63ce165d610331f04d558b57cd585f09336666fc827cf31')

pkgver() {
  cd $pkgname
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./; s/$/+jejb/"
}

prepare() {
  cd $pkgname
  patch -Np1 < ../0001-try-well-known-authority-for-SRK-first.patch
  patch -Np1 < ../0002-Handle-EVP-keys.patch
  patch -Np1 < ../0003-Add-option-for-random-migration-authority.patch
  patch -Np1 < ../0004-e_tpm-reduce-TPM-connection-time.patch
  sh bootstrap.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

# vim: ts=2:sw=2:et

