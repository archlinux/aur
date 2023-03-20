# This module was originally made for IBM TSS (aur/ibm-tss).
#
# As of 3.0.0 it *can* be built against the Intel TSS (community/tpm2-tss), but
# in that case you should probably be using community/tpm2-tss-engine instead.
#
# For that reason the default is still to use IBM TSS, but if you prefer, you
# can run `makepkg use_ibm_tss=0` to build against the Intel one.
: ${use_ibm_tss:=1}

pkgname=openssl-tpm2-engine
_commit=d954f97da5780fb23dc72b531484c90bbd04c582
pkgver=3.3.2
pkgrel=1
pkgdesc="OpenSSL engine for TPM-backed keys using IBM's TPM2 software stack"
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
source=("$pkgname::git+https://git.kernel.org/pub/scm/linux/kernel/git/jejb/openssl_tpm2_engine.git#commit=$_commit")
sha256sums=('SKIP')

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

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
