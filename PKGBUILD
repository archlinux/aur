# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kdelibs3
pkgver=3.5.10
pkgrel=19
pkgdesc='KDE3 Core Libraries'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL')
depends=('libxslt' 'libart-lgpl' 'alsa-lib' 'libcups' 'jasper'
         'libidn' 'openexr' 'aspell' 'qt3' 'ca-certificates' 'xorg-iceauth')
makedepends=('cups' 'hspell' 'optipng')
optdepends=('hspell: for Hebrew spell-checking support')
options=('libtool' 'staticlibs' '!makeflags')
source=("ftp://ftp.kde.org/pub/kde/stable/${pkgver}/src/kdelibs-${pkgver}.tar.bz2"
        'ftp://ftp.archlinux.org/other/kde/kde-3.5-1074156.patch.gz'
        'acinclude.patch'
        'kde3.profile'
        'kde4-compatibility.patch'
        'kconf_updaterc'
        'openssl.patch'
        'kdelibs3-missing-include.patch'
	'kdelibs3-cups16.patch')
sha1sums=('c930a25f4419134def55b8466c3a6f737227fb82'
          'c8ca21e4848a627760746d0a8a64bf4f90684c3e'
          '50c9de71b102507fb78b192ecc22a5fc3e031bc3'
          'd63d51c8fef5e521b4a9a8efa050a0c8ce6f94bf'
          '5fbbf7a5e2032878815fa055bfb5020f478d2b25'
          '35e56fe4c5f71685e64b13f448dcacc620166e06'
          '50e92950498463defb9149ffcf8cbc2e8cd1063b'
          'e5f5b8c060a2db9cedb82bf18caadfa869921779'
          '6a6c544b3336bfe89bb17ef737d783a7ec006c6c')

prepare() {
  cd kdelibs-${pkgver}
  patch -p0 -i "$srcdir"/kde-3.5-1074156.patch
  patch -p1 -i "$srcdir"/acinclude.patch
  patch -p1 -i "$srcdir"/kde4-compatibility.patch
  patch -p1 -i "${srcdir}"/openssl.patch
  patch -p0 -i "$srcdir"/kdelibs3-missing-include.patch
  patch -p1 -i "${srcdir}"/kdelibs3-cups16.patch
  pushd pics/crystalsvg
  optipng -quiet -force -fix cr{16,22,32,48,64,128}-app-kttsd.png cr22-app-password.png \
    cr16-filesys-folder_green{,_open}.png cr32-action-today.png
  popd
  optipng -quiet -force -fix interfaces/kimproxy/library/icons/cr48-action-presence_offline.png
}

build() {
  cd kdelibs-${pkgver}
  ./configure --prefix=/opt/kde --with-distribution='Arch Linux' \
    --with-alsa --disable-dnssd --disable-dnotify \
    --enable-inotify --enable-sendfile --with-hspell \
    --enable-gcc-hidden-visibility --enable-final \
    --without-arts --without-lua --disable-libfam
  make
}

package() {
  cd kdelibs-${pkgver}

  make DESTDIR="$pkgdir" install

# disable broken kconf_update by default
  install -D -m644 "$srcdir"/kconf_updaterc "$pkgdir"/opt/kde/share/config/kconf_updaterc

# install KDE3 profile
  install -D -m755 "$srcdir"/kde3.profile "$pkgdir"/etc/profile.d/kde3.sh
# make KDE3 styles available to Qt3
  install -d -m755 "$pkgdir"/usr/lib/qt3/plugins
  ln -sf /opt/kde/lib/kde3/plugins/styles "$pkgdir"/usr/lib/qt3/plugins/styles

# cert bundle seems to be hardcoded
# link it to the one from ca-certificates
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir"/opt/kde/share/apps/kssl/ca-bundle.crt

# we don't have khelpcenter anyway
  rm -rf "$pkgdir"/opt/kde/share/doc

  install -d -m755 "${pkgdir}"/etc/ld.so.conf.d/
  echo '/opt/kde/lib' > "${pkgdir}"/etc/ld.so.conf.d/kdelibs3.conf
}
