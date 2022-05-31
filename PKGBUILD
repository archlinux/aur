# Maintainer: Eric Engestrom <aur@engestrom.ch>

_TARBALL_PKGVER=1.2.1-11
_UPLOAD_DATE=20220527

pkgname=xencelabs
pkgver=${_TARBALL_PKGVER/-/.}
pkgrel=1
pkgdesc='Driver for the Xencelabs Pen Tablets'
arch=(x86_64)
url='https://www.xencelabs.com'
license=(LGPL3)
depends=(qt5-base qt5-x11extras icu openssl)
install=$pkgname.install
source_x86_64=("https://download01.xencelabs.com/file/$_UPLOAD_DATE/XencelabsLinux_$_TARBALL_PKGVER.zip")
sha256sums_x86_64=('0ee73309d9c2f6681c47542ae1c0efaea8c49f273c835046968d9271b7c7ed03')

prepare() {
  rm -rf $pkgname-$_TARBALL_PKGVER.$CARCH
  tar xf XencelabsLinux_$_TARBALL_PKGVER/$pkgname-$_TARBALL_PKGVER.$CARCH.tar.gz
}

build() {
  cd $pkgname-$_TARBALL_PKGVER.$CARCH/App

  # provided by the `licenses` package
  rm usr/lib/xencelabs/lib/LGPL

  # fix FSH to match Arch's
  mv lib/*/ usr/lib/
  rmdir lib

  # Replace xencelabs.desktop copy with symlink
  ln -sf ../../../usr/share/applications/xencelabs.desktop \
    etc/xdg/autostart/xencelabs.desktop

  # provided by package dependencies
  rm usr/lib/xencelabs/lib/libQt5*
  rm usr/lib/xencelabs/platforms/libqxcb.so
  rm usr/lib/xencelabs/lib/libicu*
  rm usr/lib/xencelabs/lib/libssl.so*
  rm usr/lib/xencelabs/lib/libcrypto.so*

  # make sure it's empty, so that if some other lib is added in a future
  # release we notice it right away.
  rmdir usr/lib/xencelabs/lib/
  rmdir usr/lib/xencelabs/platforms/

  # Now that we use the sytem libs, the wrapper doesn't do anything anymore
  mkdir usr/bin
  mv usr/lib/xencelabs/xencelabs usr/bin/xencelabs
  rm usr/lib/xencelabs/xencelabs.sh
  sed s,/usr/lib/xencelabs/xencelabs.sh,xencelabs,g -i \
    usr/share/applications/xencelabs.desktop
}

package() {
  cp -r --no-preserve=ownership,mode $pkgname-$_TARBALL_PKGVER.$CARCH/App/* "$pkgdir"
  chmod +x "$pkgdir"/usr/bin/xencelabs
}
