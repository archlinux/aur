# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

# after a .so bump first rebuild dirmngr
# with sudo testing-x86_64-build -- -I libgcrypt-1.6.0-1-x86_64.pkg.tar.xz
# then cp /usr/lib/libgcrypt.so.11 /var/lib/archbuild/staging-x86_64/root/usr/lib/ and do staging-x86_64-build

pkgname=libgcrypt-git
pkgver=1.8.7
pkgrel=1
pkgdesc="General purpose cryptographic library based on the code from GnuPG"
arch=(x86_64)
url="https://www.gnupg.org"
license=('LGPL')
depends=('libgpg-error')
options=('!emptydirs')
# https://www.gnupg.org/download/integrity_check.html
provides=(libgcrypt)
conflicts=(libgcrypt)
source=(git://git.gnupg.org/libgcrypt.git)
sha1sums=('SKIP')
#validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA') # "Werner Koch (dist signing 2020)"

pkgver() {
  cd libgcrypt
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libgcrypt
  # tests fail due to systemd+libseccomp preventing memory syscalls when building in chroots
  #  t-secmem: line 176: gcry_control (GCRYCTL_INIT_SECMEM, pool_size, 0) failed: General error
  #  FAIL: t-secmem
  #  t-sexp: line 1174: gcry_control (GCRYCTL_INIT_SECMEM, 16384, 0) failed: General error
  #  FAIL: t-sexp
#  sed -i "s:t-secmem::" tests/Makefile.am
#  sed -i "s:t-sexp::" tests/Makefile.am
#  autoreconf -vfi
}

build() {
  cd libgcrypt

  ./autogen.sh
  ./configure --prefix=/usr \
	--disable-static \
	--disable-padlock-support \
	--disable-doc \
	--disable-O-flag-munging
  make
}

#check() {
#  cd libgcrypt
#  make check
#}

package() {
  cd libgcrypt
  make DESTDIR="${pkgdir}" install
}
