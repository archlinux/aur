# Maintainer: Yuuki Galaxy <galaxy001@gmail.com>
# Contributor: Alex Wiggins <alex.d.wiggins@gmail.com>
# Contributor: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Julian Rother <julian@toksik.org>
# Contributor: Sebastian Schwarz <seschwar@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=oss-git
pkgname=oss-git
true && pkgname=(oss-git libflashsupport-oss-git)
pkgver=7cf6b07
pkgrel=1
arch=(i686 x86_64 pentium4)
url="http://developer.opensound.com/"
license=(GPL2)
makedepends=(git)
source=(oss::git://git.code.sourceforge.net/p/opensound/git
        oss4_sys-libs_glibc-2.23_ossdetect_fix_git.patch
        seawright.patch
        galaxy.patch
        oss.service
        remove-hal.patch
        rm-init-scripts.patch
        soundon.patch
        kmod-link.patch
        kmod-link2.patch
        ossvermagic.patch)
sha512sums=('SKIP'
            '5599f75ac2784aca7d0367e88705938d2680e7a0eb7ae7300080e3fc0ea0c9d3b183554a9e208ed8359f675028024e8de62baa5f8dbc79e9f3bd942db6aa6157'
            'a1696a8775613d77d2602b9b0288b112401162b3ee8d5b487a9662521e91f5bf2daab7d1dc2e7aed5edc4d01cfd354abc3c5aaad0ceab73d8eaad7fc8f66dc3c'
            'SKIP'
            '355e1380432947c0e9caa21114b2c3debeb162fb5abcf845125ec281ce52b437ad1ee1db04d37e9b7a5ac79816c4dcbc21b4ed4cf8191f71218d99acd7bab70e'
            '6956e5e2e9323b568bb18e80bbee591b0e5ffd3d4612a50df09879941b2733c31d6b3178dc9a46c283bd1629f76b7ff5e2b54893a42a47f6379eaee4731fd9be'
            '64e6d9d8eb5320f737d3a0698a245da2b2d141b68cfb2f02e448144d1c610aa8b8a6c38b56fcca364d63171a49afe93161a00545cdb90086b5328997b3096690'
            'a8196aeea43499f4822bad6adc8c7f8721eb122045732ab34bb675182a1c4403c3f4a30ead85188fdaec77ee79a5097dd8de84782f8915db4061157474b5c7c6'
            'f73b837643c7b86c5ce3a2ff18a66b99166d16ac7d1ac3d419b203efd8d398d8c4b21c304d6fa1c038ebf180ca0620d6517be384b307bb66e84a15b0339800df'
            '6cefeca6921916d2fbf7c4efd354d3c0b7f7285c6d049912bd318f0b520698a2de2a974604a56a7b288636939773ef49f022962bb88f9e3b5ea442462a50de1b'
            '5db4bb6d636983485bc56aa7dd83347de848624d4ff160c1ec77d7d21d22154be61cad393af2d772f58bca47494d853dd5b286e4820440bd339cbb6edd50d1db')


pkgver() {
  cd "oss"
  git describe --always | sed 's/-/./g'
}

prepare() {
  cd "oss"

  # OSS wants an empty build directory
  rm -rf build
  mkdir build

  # make OSS compile with current Linux kernel
  # - no longer required from build 2010
  # patch -p0 < "$srcdir/linux-3.14.0.patch"
  # - no longer required (from commit c110e9)
  # patch -p1 < "$srcdir/linux-4.0.patch"
  # - no longer required (from commit 5d996a)
  # patch -p0 < "$srcdir/linux-4.6.patch"
  # - no longer required (from commit 891ddd)
  # patch -p0 < "$srcdir/linux-4.8-usercopy.patch"
  patch -p1 < "$srcdir/ossvermagic.patch"
  patch -p1 < "$srcdir/seawright.patch"
  patch -p1 < "$srcdir/galaxy.patch"

  # make OSS compile with glibc >= 2.23
  patch -p1 < "$srcdir/oss4_sys-libs_glibc-2.23_ossdetect_fix_git.patch"

  # make OSS compile with gcc-5
  # - no longer required (from commit b3dc64)
  # patch -p0 < "$srcdir/gcc-5.patch"

  # remove outdated stuff
  cd setup/Linux
  patch -p2 < "$srcdir/rm-init-scripts.patch"
  rm oss/etc/S89oss
  patch -p2 < "$srcdir/remove-hal.patch"
  rm oss/scripts/*oss_usb-create-device*
  patch -p1 < "$srcdir/soundon.patch"

  # FS#35672
  mv oss/build/{osscore.c,osscore_wrapper.c}
  patch -p3 < "$srcdir/kmod-link2.patch"
  patch -p2 < "$srcdir/kmod-link.patch"
  cd ../..
}

build() {
  cd "$srcdir/oss/build"
  ../configure --config-midi=YES
  make build
  gcc $CFLAGS -shared -fPIC -Wall -Werror oss/lib/flashsupport.c \
      -o libflashsupport.so
}

package_libflashsupport-oss-git() {
  pkgdesc="Adobe flash plugin support lib (OSSv4)"
  conflicts=(libflashsupport libflashsupport-oss libflashsupport-oss-nonfree libflashsupport-pulse)
  depends=(oss)

  install -dm755 "$pkgdir/usr/lib"
  ln -s oss/lib/libflashsupport.so "$pkgdir/usr/lib/libflashsupport.so"
}

package_oss-git() {
  pkgdesc="Open Sound System UNIX audio architecture"
  depends=(linux-headers)
  optdepends=('gtk2: for graphical mixer (ossxmix)'
              'libflashsupport-oss: Adobe flash plugin support')
  provides=(oss)
  conflicts=(oss oss-nonfree libflashsupport-oss libflashsupport-oss-nonfree)
  backup=(usr/lib/oss/soundon.user)
  install=oss.install

  cd "oss/build"
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
