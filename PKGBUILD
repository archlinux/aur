# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD 

# In order to verify the PGP signature of the source archive, you may need to
# use this command to download the needed public key:
#   gpg --recv-keys 090B11993D9AEBB5

pkgname=guix
pkgver=0.8.3
pkgrel=2
pkgdesc="GNU guix is a purely functional package manager"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/guix/"
license=('GPL')
makedepends=(
  'bash-completion'
  'emacs') # Please remove this if you are not going to use guix in emacs
depends=(
  'guile>=2.0.5'
  'sqlite>=3.6.19'
  'bzip2'
  'libgcrypt')
optdepends=(
  'bash-completion: to enable bash programmable completion'
  'emacs: to enable Emacs Interface')
source=(
  "ftp://alpha.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
install="${pkgname}.install"
sha256sums=('dfea48f13e6584db812c24746467eb21cb0553a2f5860e1fe40d4e06e4b4c092'
            '411b3b850191f1fc701e9a2178aa02a403c44baa59b58a6ef9c18237a10fd049')
validpgpkeys=('3CE464558A84FDC69DB40CFB090B11993D9AEBB5')

build() {
	current_arch="`uname -m`"
	bash_completion_dir="`pkg-config --variable=completionsdir bash-completion`"
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --sbindir=/usr/bin --localstatedir=/var \
		--sysconfdir=/etc --with-bash-completion-dir="${bash_completion_dir}" \
		--disable-rpath
	make
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i 's|tests/builders.scm||' Makefile
	make check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
