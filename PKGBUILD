# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD

# In order to verify the PGP signature of the source archive, you may need to
# use this command to download the needed public key:
#   gpg --recv-keys BCA689B636553801C3C62150197A5888235FACAC

pkgname=guix
pkgver=0.12.0
pkgrel=2
pkgdesc="A purely functional package manager for the GNU system"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/guix/"
license=('GPL3')
options=('!strip')
makedepends=(
  'bash-completion'
  'emacs'    # Please remove this if you are not going to use guix in emacs
  'graphviz' # Please remove this if you are not going to use guix in emacs
  'guile-json'
  'guile-ssh>=0.10.2'
  'help2man')
depends=(
  'guile>=2.0.7'
  'sqlite>=3.6.19'
  'bzip2'
  'gnutls'
  'libgcrypt'
  'zlib')
optdepends=(
  'bash-completion: to enable bash programmable completion'
  'emacs: to enable Emacs Interface'
  'graphviz: to enable Emacs Interface'
  'guile-json: to import packages from cpan, gem, pypi'
  'guile-ssh: to offload builds to other machines')
source=(
  "ftp://alpha.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
install="${pkgname}.install"
sha1sums=('2189ab3a658040e51b036b1bca11594c3d6e4966'
          '3300991092ba2eea2b2113456cd0409d11b00ca6')
validpgpkeys=('BCA689B636553801C3C62150197A5888235FACAC')

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
	# Check whether the current working directory is too long
	cwd_str="$(pwd)"
	cwd_len="${#cwd_str}"
	if [ "${cwd_len}" -gt 46 ]; then
		error "${cwd_str} is too long."
		error "The working directory cannot be longer than 46 bytes."
		false
	fi
	# Make sure we have a valid shell accepting -c option
	SHELL=/bin/sh make check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
	# Remove the unused upstart service file
	rm -r ${pkgdir}/usr/lib/upstart
	# The default makepkg strip option cannot be used here because binaries
	# installed in /usr/share must not be stripped.
	# To keep user-defined 'strip' and 'debug' options useful, we still
	# depend on 'tidy_strip' function provided by makepkg to do the stripping
	# work. To make the function useful, we have to temporarily remove the
	# '!strip' option from 'options' array. However, assignments to 'options'
	# cause mksrcinfo to insert wrong lines to .SRCINFO, so they have to be
	# put in eval.
	eval 'options=()'
	cd ${pkgdir}/usr/bin
	tidy_strip
	cd ${pkgdir}/usr/lib
	tidy_strip
	eval 'options=("!strip")'
}
