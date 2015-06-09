# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Black_Codec

pkgname=maximus
pkgver=0.4.14
pkgrel=4
pkgdesc="A desktop daemon which will automatically maximise and, optionally, un-decorate windows."
arch=("i686" "x86_64")
url="https://launchpad.net/maximus"
license=('GPL')
groups=(gnome)
depends=('gtk2' 'gconf' 'libwnck' 'libgnomeui' 'libxtst' 'libfakekey' 'libunique')
install=${pkgname}.install
source=(http://launchpad.net/maximus/0.4/ubuntu-9.10/+download/${pkgname}-${pkgver}.tar.gz 
        configure.patch 
        1.patch)
sha256sums=('02b1f92374b19716a9511f0beb9b67e2f7dcb0b34839c0c9bc90b63432c82b92'
            '33c9ce1a060fe0f0c1ad9a472e4a13a1f66ec35761792db21ebb22ba0c305f29'
            '7410af24920d137e19a4ce0c58ff95700e591135cb8569d8032d18cc160e15dd')
 
prepare() {
  cd "$srcdir/$pkgname-$pkgver"
 
  patch -R -n configure ${srcdir}/configure.patch
  patch -p1 < ${srcdir}/1.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain ${pkgname} ${pkgdir}/usr/etc/gconf/schemas/*.schemas
}
