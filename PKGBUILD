# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD 

# In order to verify the PGP signature of the source archive, you may need to
# use this command to download the needed public key:
#   gpg --recv-keys 090B11993D9AEBB5

pkgname=guix
pkgver=0.8.1
pkgrel=1
pkgdesc="GNU guix is a purely functional package manager"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/guix/"
license=('GPL')
makedepends=(
  'emacs') # Please remove this if you are not going to use guix in emacs
depends=(
  'guile>=2.0.5'
  'sqlite>=3.6.19'
  'bzip2'
  'libgcrypt')
optdepends=('emacs: to enable Emacs Interface')
source=(
  "ftp://alpha.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig}
  "guix.service")
sha256sums=('c54d19e948eae7ed15f63c6ad69bd8193fd1ed8128d3a6a8511f381f64a3058a'
            '932f3d021ae6ea3101961c346cd8caf6aed42db23a515fd70be4c41cb49f301d'
            'd0a014de859c4f5d6f760be84991b88f4855ead933368f3ab815a1deabc361ce')
validpgpkeys=('3CE464558A84FDC69DB40CFB090B11993D9AEBB5')

build() {
	current_arch="`uname -m`"
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --sbindir=/usr/bin \
		--localstatedir=/var --disable-rpath
	make
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
	mkdir -p ${pkgdir}/usr/lib/systemd/system
	install -m 644 "${srcdir}/guix.service" \
		${pkgdir}/usr/lib/systemd/system/guix.service
}
