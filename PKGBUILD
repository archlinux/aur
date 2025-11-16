# This module was originally made for IBM TSS (aur/ibm-tss).
#
# As of 3.0.0 it *can* be built against the Intel TSS (community/tpm2-tss), but
# in that case you should probably be using community/tpm2-tss-engine instead.
#
# For that reason the default is still to use IBM TSS, but if you prefer, you
# can run `makepkg use_ibm_tss=0` to build against the Intel one.
: ${use_ibm_tss:=1}

pkgbase=openssl-tpm2-engine
pkgname=(openssl-tpm2-engine openssl-tpm2-engine-alias)
pkgver=4.4.3
pkgrel=2
pkgdesc="OpenSSL engine & provider for TPM-backed keys using IBM's TPM2 software stack"
arch=(x86_64)
url="https://git.kernel.org/pub/scm/linux/kernel/git/jejb/openssl_tpm2_engine.git"
license=('LGPL2.1')
if (( use_ibm_tss )); then
  depends=('openssl' 'ibm-tss')
else
  depends=('openssl' 'tpm2-tss')
fi
makedepends=('git' 'help2man')
checkdepends=('swtpm')
source=("$pkgname::git+https://git.kernel.org/pub/scm/linux/kernel/git/jejb/openssl_tpm2_engine.git#tag=v$pkgver")
sha256sums=('432678983b8932ede05e1bfebb28d8c759c701c3efc7254d66b4a854df06996e')

pkgver() {
  cd $pkgname
  git describe | sed "s/^v//; s/-/.r/; s/-/./"
}

prepare() {
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

#check() {
#  cd $pkgname
#  make check
#}

package_openssl-tpm2-engine() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  for _dir in "$pkgdir"/usr/lib/{engines-3,ossl-modules}; do
    test -L "$_dir"/tpm2.so && rm -vf "$_dir"/tpm2.so
  done
}

package_openssl-tpm2-engine-alias() {
  pkgdesc="'tpm2' alias for openssl-tpm2-engine as drop-in replacement for tpm2-openssl"
  depends=('openssl-tpm2-engine')
  conflicts=('tpm2-openssl')
  for _dir in "$pkgdir"/usr/lib/{engines-3,ossl-modules}; do
    mkdir -p "$_dir"
    ln -vnsf libtpm2.so "$_dir"/tpm2.so
  done
}

# vim: ts=2:sw=2:et
