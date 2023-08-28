# Maintainer: Alex Wiggins <aur.dev.ate@etwmail.com>
# Contributor: Clive Wright <seawright27@gmail.com>
# Contributor: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Julian Rother <julian@toksik.org>
# Contributor: Sebastian Schwarz <seschwar@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=oss
pkgname=oss
true && pkgname=(oss libflashsupport-oss)
pkgver=4.2_2020
pkgrel=2
arch=(i686 x86_64)
url="http://developer.opensound.com/"
license=(GPL2)
makedepends=(gtk2)
source=("http://www.4front-tech.com/developer/sources/stable/gpl/oss-v${pkgver/_*}-build${pkgver/*_}-src-gpl.tar.bz2"
        oss.service
        remove-hal.patch
        rm-init-scripts.patch
        soundon.patch
        osscore.patch
        extramodules.patch
        ossvermagic.patch)
sha512sums=('6b0c5390e92f9c9466669600321140b54d1fde5eeaef2f9938d6bdbc7ae686f4a1ad0fa9669a1505962eb515d61d29d8a677911557a9b245ce039e1ab3b77d69'
            '355e1380432947c0e9caa21114b2c3debeb162fb5abcf845125ec281ce52b437ad1ee1db04d37e9b7a5ac79816c4dcbc21b4ed4cf8191f71218d99acd7bab70e'
            '6956e5e2e9323b568bb18e80bbee591b0e5ffd3d4612a50df09879941b2733c31d6b3178dc9a46c283bd1629f76b7ff5e2b54893a42a47f6379eaee4731fd9be'
            '64e6d9d8eb5320f737d3a0698a245da2b2d141b68cfb2f02e448144d1c610aa8b8a6c38b56fcca364d63171a49afe93161a00545cdb90086b5328997b3096690'
            'a8196aeea43499f4822bad6adc8c7f8721eb122045732ab34bb675182a1c4403c3f4a30ead85188fdaec77ee79a5097dd8de84782f8915db4061157474b5c7c6'
            '6f074cc61cb2aef98221e95700b79033504bf397b3e5313ebb27069873ead4dbc7a1969b2f04c254a33947af438abbc22cf33446ca20acd14393ef855ae7492d'
            '0742a9400d6b683e3813cf1b1a1fb7f07dff22b6d26d47ca4e3d6179bc099044661c33e2d445a3fef278187d8dab90aae3323b4693e63383e03b9b5213bbc4a5'
            'eec0608d82d5bec305b374d9cb62d70860d7be833f87f563a828c44b2dd67754cb27716194d2ea2707391d1257ba1b4b7b5cdf513d618dfd877a065999baa4ad')
_dir=oss-v${pkgver/_*}-build${pkgver/*_}-src-gpl

prepare() {
  cd "$_dir"

  # OSS wants an empty build directory
  rm -rf build
  mkdir build

  patch -p1 < "$srcdir/osscore.patch"
  patch -p1 < "$srcdir/extramodules.patch"
  patch -p0 < "$srcdir/ossvermagic.patch"

  # remove outdated stuff
  cd setup/Linux
  patch -p2 < "$srcdir/rm-init-scripts.patch"
  rm oss/etc/S89oss
  patch -p2 < "$srcdir/remove-hal.patch"
  rm oss/scripts/*oss_usb-create-device*
  patch -p1 < "$srcdir/soundon.patch"
}

build() {
  export CFLAGS=""
  cd "$_dir/build"
  touch ../kernel/drv/lynxtwo/.nomake
  ../configure --enable-libsalsa=NO --regparm
  make build
  gcc $CFLAGS -shared -fPIC -Wall -Werror oss/lib/flashsupport.c \
      -o libflashsupport.so
}

package_libflashsupport-oss() {
  pkgdesc="Adobe flash plugin support lib (OSSv4)"
  conflicts=(libflashsupport libflashsupport-oss-nonfree libflashsupport-oss-git libflashsupport-pulse)
  depends=(oss)

  install -dm755 "$pkgdir/usr/lib"
  ln -s oss/lib/libflashsupport.so "$pkgdir/usr/lib/libflashsupport.so"
}

package_oss() {
  pkgdesc="Open Sound System UNIX audio architecture"
  depends=(linux-headers)
  optdepends=('gtk2: for graphical mixer (ossxmix)'
              'libflashsupport-oss: Adobe flash plugin support')
  conflicts=(oss-git oss-nonfree libflashsupport-oss-git libflashsupport-oss-nonfree)
  backup=(usr/lib/oss/soundon.user)
  install=oss.install

  cd "$_dir/build"
  make DESTDIR="$pkgdir/" copy
  install -Dm755 libflashsupport.so \
      "$pkgdir/usr/lib/oss/lib/libflashsupport.so"
  cd "$pkgdir"

  # usr-move fixes
  mv usr/sbin/* usr/bin
  rmdir usr/sbin
  grep -IlrZ '\<s\?bin\>' . \
      | xargs -0 sed -i 's,\<\(usr/\)\?s\?bin\>,usr/bin,g' --
  grep -IlrZ '\<lib/modules\>' . \
      | xargs -0 sed -i 's,\<\(usr/\)\?lib/modules\>,usr/&,g' --

  # make OSS install its modules to /usr/lib/modules/$KERNEL/extramodules/oss
  grep -IlrZ '\<usr/lib/modules/[^/]\+/kernel/oss\>' . \
      | xargs -0 sed -i 's,\<usr/lib/modules/\([^/]\+\)/kernel/oss\>,usr/lib/modules/\1/extramodules/oss,g' --

  chmod -R a+rX .  # FS#13815
  install -Dm644 "$srcdir/oss.service" usr/lib/systemd/system/oss.service
}
