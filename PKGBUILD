# -*- shell-script -*-
#
# Contributor: Adrian C. <anrxc..sysphere.org>

pkgname=alpine
pkgver=2.20
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Apache licensed PINE mail user agent"
url="http://patches.freeiz.com/alpine/"
license=("APACHE")
depends=("libldap" "krb5" "gettext")
optdepends=("aspell: for spell-checking support"
	    "hunspell: for spell-checking support"
            "topal: glue program that links GnuPG and alpine")
provides=("pine")
conflicts=("pine" "re-alpine")
replaces=("pine")
options=("!makeflags")
source=(http://patches.freeiz.com/${pkgname}/release/src/${pkgname}-${pkgver}.tar.xz
        #ftp://ftp.cac.washington.edu/${pkgname}/${pkgname}.tar.bz2
        http://patches.freeiz.com/${pkgname}/patches/${pkgname}-${pkgver}/all.patch.gz
        topal-1.patch
        topal-2.patch)
md5sums=("043b67666af73b26f9627ad97e2aaf92"
         "d2c2576b58f65566ccf1a9d5add0f14a"
         "ce47b232339b251c74dc56de73513101"
         "e53177e123ec68fc77d55f60cd9eba9f")


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

# User compile time patches
# - Eduardo Chappa patches
  patch -p1 < ../all.patch
# - Phil Brooke patches (optional topal support)
  #patch -p1 < ../topal-1.patch
  #patch -p1 < ../topal-2.patch


# Configure Alpine
  LIBS+="-lpam -lkrb5 -lcrypto" ./configure --prefix=/usr \
  --without-passfile --without-tcl --disable-shared \
  --with-system-pinerc=/etc/${pkgname}.d/pine.conf \
  --with-system-fixed-pinerc=/etc/${pkgname}.d/pine.conf.fixed

# Build Alpine
  make
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

# Install Alpine
  make DESTDIR="${pkgdir}" install
}
