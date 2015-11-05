# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD 

# In order to verify the PGP signature of the source archive, you may need to
# use this command to download the needed public key:
#   gpg --recv-keys 090B11993D9AEBB5

pkgname=guix
pkgver=0.9.0
pkgrel=1
pkgdesc="GNU guix is a purely functional package manager"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/guix/"
license=('GPL')
makedepends=(
  'bash-completion'
  'emacs' # Please remove this if you are not going to use guix in emacs
  'guile-json')
depends=(
  'guile>=2.0.7'
  'sqlite>=3.6.19'
  'bzip2'
  'libgcrypt')
optdepends=(
  'bash-completion: to enable bash programmable completion'
  'emacs: to enable Emacs Interface')
source=(
  "ftp://alpha.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
install="${pkgname}.install"
sha1sums=('765de53aa344a801c3d376cf1e050650cec58039'
          'ab25cfdb39ff6d53458c07a8ab9b397a7bc8c9c5')
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
	# Don't run container tests if the kernel doesn't support user namespace
	zgrep "CONFIG_USER_NS=y" /proc/config.gz || \
		sed -i 's|tests/guix-environment-container.sh||' Makefile
	make check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
