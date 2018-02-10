# Maintainer: Darshit Shah <darnir gnu org>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gnutls-tiny-git
pkgver=3.6.0.1.r11.g2b29963b5
pkgrel=1
pkgdesc="A secure communications library implementing the SSL, TLS and DTLS protocols and technologies around them"
arch=('x86_64')
url="https://www.gnutls.org/"
license=('GPL3' 'LGPL2.1')
depends=('gcc-libs' 'libidn2' 'libtasn1' 'libunistring' 'nettle' 'p11-kit' 'readline' 'zlib')
checkdepends=('net-tools')
optdepends=('guile: for use with Guile bindings')
makedepends=('git')
provides=('gnutls')
conflicts=('gnutls')
source=("git+https://gitlab.com/gnutls/gnutls.git")
sha256sums=('SKIP')

prepare() {
	cd "gnutls"

	make bootstrap
}

pkgver() {
  cd "gnutls"

  git describe --long --tags | sed 's/^gnutls_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "gnutls"

  ./configure --prefix=/usr \
	--with-zlib \
	--disable-static \
	--enable-guile --with-guile-site-dir=no \
	--disable-tests \
	--disable-tools \
	--disable-maintainer-mode \
	--disable-libdane \
	--disable-doc \
	--with-default-trust-store-pkcs11="pkcs11:model=p11-kit-trust;manufacturer=PKCS%2311%20Kit"
  make
}

package() {
  cd "gnutls"

  make DESTDIR="$pkgdir" install

  # lots of .png files are put into infodir and are gzipped by makepkg! this needs to be fixed by using !zipman
  # gzip -9 all files in infodir and manpages manually
  find "$pkgdir/usr/share/info" -name '*.info*' -exec gzip -9 {} \;
  find "$pkgdir/usr/share/man" -exec gzip -9 {} \;
}
