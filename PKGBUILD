# Maintainer: Pablo Lezzaeta Reyes <prflr88 arro'a gmail puntocom>

pkgname=xfmedia
pkgver=0.9.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A lightweighted multimedia player designed for Xfce based on xine"
url="https://www.spurint.org/projects/xfmedia/"
group=xfce4-goodies
licence=('GPL')
#provides=
depends=('gtk2' 'xine-lib' 'libxfcegui4' 'exo')
optdeps=('taglib')
source=('https://www.spurint.org/files/xfmedia/xfmedia-0.9.2.tar.bz2'
	'01-xfmedia-exo-0.6.patch'
	'02-xfmedia-dbus-0.6-support.patch'
	'03-xfmedia-empty-prev-next-fix.patch')
#validpgpkeys=('E97C96E9511E027B') # There is a PGP but no server contain the key info to validate it
md5sums=('6eb8bd1f67201f829e0f45e733c02bd5'
         'f5e17fcdf2056dcc8ca8aae8600c0132'
         '8f2aa12eea584de65d8ed28179e56b51'
         'd6d59079e8a9d30010b42ec23a44826d')

prepare() {
 cd "${srcdir}/${pkgname}-${pkgver}"

 # Build with newer Exo
 patch -Np1 -i "${srcdir}/01-xfmedia-exo-0.6.patch"
 patch -Np1 -i "${srcdir}/02-xfmedia-dbus-0.6-support.patch"
 patch -Np1 -i "${srcdir}/03-xfmedia-empty-prev-next-fix.patch"
 
 # Fix Xscreensaer problem
 sed -i 's|define HAVE_XSCREENSAVER_EXTENSION .*|undef HAVE_XSCREENSAVER_EXTENSION|' config.h.in
 
}

build() {
 cd "${srcdir}/${pkgname}-${pkgver}"

 export LDFLAGS="$LDFLAGS -lXext -lX11 -lm -lgmodule-2.0 "

 ./configure --prefix=/usr --sbindir=/usr/bin --bindir=/usr/bin \
        --libdir=/usr/lib --libexecdir=/usr/lib --sysconfdir=/etc \
	--enable-exo --disable-static

 make
}

package() {
 cd "${srcdir}/${pkgname}-${pkgver}"

 make DESTDIR="${pkgdir}" install
}
