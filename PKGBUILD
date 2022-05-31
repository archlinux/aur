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

  # Replace the wrapper script
  mkdir usr/bin
  rm usr/lib/xencelabs/xencelabs.sh
  cat > usr/bin/xencelabs <<'EOF'
#!/bin/sh
LD_LIBRARY_PATH=/usr/lib/xencelabs/lib
export LD_LIBRARY_PATH
cd /usr/lib/xencelabs/
./xencelabs "$@"
EOF

  sed s,/usr/lib/xencelabs/xencelabs.sh,xencelabs,g -i \
    usr/share/applications/xencelabs.desktop
}

package() {
  cp -r --no-preserve=ownership,mode $pkgname-$_TARBALL_PKGVER.$CARCH/App/* "$pkgdir"
  chmod +x "$pkgdir"/usr/bin/xencelabs
  chmod +x "$pkgdir"/usr/lib/xencelabs/xencelabs
}
