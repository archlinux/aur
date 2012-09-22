# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Florian Pritz <flo@xinu.at>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=krb5
pkgname=libx32-$_pkgbasename
pkgver=1.10.3
pkgrel=1.1
pkgdesc="The Kerberos network authentication system (x32 ABI)"
arch=('x86_64')
url="http://web.mit.edu/kerberos/"
license=('custom')
depends=('libx32-e2fsprogs' 'libx32-libldap' 'libx32-keyutils' "$_pkgbasename")
makedepends=('perl' 'gcc-multilib-x32')
source=("http://web.mit.edu/kerberos/dist/${_pkgbasename}/1.10/${_pkgbasename}-${pkgver}-signed.tar"
        'krb5-1.10.1-gcc47.patch')
sha1sums=('04ab9837e5d1958158bcb30bd6480201089a0cbb'
          '78b759d566b1fdefd9bbcd06df14f07f12effe96')
options=('!emptydirs')

build() {
   tar zxvf ${_pkgbasename}-${pkgver}.tar.gz
   cd "${srcdir}/${_pkgbasename}-${pkgver}/src"

   # With gcc47 : deltat.c:1694:12: error: 'yylval' may be used uninitialized
   # in this function [-Werror=maybe-uninitialized]
   # As this is generated code, just ignore the complaint.
   patch -Np2 -i ../../krb5-1.10.1-gcc47.patch
   rm lib/krb5/krb/deltat.c

   export CC="gcc -mx32"
   export CXX="g++ -mx32"
   export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"
   export PYTHON="/usr/bin/python2-x32"

   export CFLAGS+=" -fPIC -fno-strict-aliasing -fstack-protector-all"
   export CPPFLAGS+=" -I/usr/include/et"
   ./configure --prefix=/usr \
               --sysconfdir=/etc/krb5 \
               --mandir=/usr/share/man \
               --localstatedir=/var/lib \
               --libdir=/usr/libx32 \
               --enable-shared \
               --with-system-et \
               --with-system-ss \
               --disable-rpath \
               --without-tcl \
               --enable-dns-for-realm \
               --with-ldap \
               --without-system-verto

   make
}

check() {
   # We can't do this in the build directory.
   cd "${srcdir}/${_pkgbasename}-${pkgver}"
   make -C src check
}

package() {
   cd "${srcdir}/${_pkgbasename}-${pkgver}/src"
   make DESTDIR="${pkgdir}" install

   rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
   mkdir -p "$pkgdir/usr/share/licenses"
   ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
