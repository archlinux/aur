# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD

# In order to verify the PGP signature of the source archive, you may need to
# use this command to download the needed public key:
#   gpg --recv-keys 090B11993D9AEBB5

pkgname=guix
pkgver=0.11.0
pkgrel=1
pkgdesc="A purely functional package manager for the GNU system"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/guix/"
license=('GPL')
makedepends=(
  'bash-completion'
  'emacs'    # Please remove this if you are not going to use guix in emacs
  'graphviz' # Please remove this if you are not going to use guix in emacs
  'guile-json'
  'help2man')
depends=(
  'guile>=2.0.7'
  'sqlite>=3.6.19'
  'bzip2'
  'gnutls'
  'libgcrypt')
optdepends=(
  'bash-completion: to enable bash programmable completion'
  'emacs: to enable Emacs Interface'
  'graphviz: to enable Emacs Interface'
  'guile-json: to import packages from cpan, gem, pypi')
source=(
  "ftp://alpha.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
install="${pkgname}.install"
sha1sums=('bd12d65a46c8eef3b490efea6ac953b995d524eb'
          'a9080412df96832d22e57a1bcc76e3016f93f0b0')
validpgpkeys=('3CE464558A84FDC69DB40CFB090B11993D9AEBB5')

build() {
	bash_completion_dir="`pkg-config --variable=completionsdir bash-completion`"
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --sbindir=/usr/bin \
		--libexecdir=/usr/lib/${pkgname} --localstatedir=/var \
		--sysconfdir=/etc --with-bash-completion-dir="${bash_completion_dir}" \
		--disable-rpath
	make
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}
	# Don't run tests requiring user namespace
	if unshare -Ur true; then :; else
		sed -i 's|tests/syscalls.scm||' Makefile
		sed -i 's|tests/containers.scm||' Makefile
		sed -i 's|tests/guix-environment-container.sh||' Makefile
	fi
	# Make sure we have a valid shell accepting -c option
	SHELL=/bin/sh make check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
	# Remove the unused upstart service file
	rm -r ${pkgdir}/usr/lib/upstart
}
