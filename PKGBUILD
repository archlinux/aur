# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD 

# In order to verify the PGP signature of the source archive, you may need to
# use this command to download the needed public key:
#   gpg --recv-keys 090B11993D9AEBB5

pkgname=guix
pkgver=0.8.2
pkgrel=1
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
  "ftp://alpha.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig}
  "guix.service")
install="${pkgname}.install"
sha256sums=('ff1380a551f8ba18057f7c5e8fdbcc6a371c89817718ff4b7ceef013e0b4afa8'
            '6bf1b3ea501109feb11ec550dec9619fd1f8fe703986b50a58921b51d5e02cc0'
            'd0a014de859c4f5d6f760be84991b88f4855ead933368f3ab815a1deabc361ce')
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
	make check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
	mkdir -p ${pkgdir}/usr/lib/systemd/system
	install -m 644 "${srcdir}/guix.service" \
		${pkgdir}/usr/lib/systemd/system/guix.service
}
