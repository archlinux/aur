# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Eric DeStefano <eric at ericdestefano dot com>

pkgbase=sheepshaver-git
pkgname=(sheepshaver-git sheepnet-dkms-git)
pkgver=r2687.g720eb598
pkgrel=2
pkgdesc="An Open Source PowerMac Emulator"
arch=('x86_64')
url="http://sheepshaver.cebix.net"
license=('GPL')
depends=('gtk2' 'sdl' 'vde2')
options=(!lto)
makedepends=('git')
source=('git+https://github.com/cebix/macemu'
        'SheepShaver.sysctl'
        'SheepShaver.desktop'
        'SheepShaver.png'
		'sdl2_bug.patch'
		)
sha256sums=('SKIP'
            'a4aa858b95d29906873693988d5db42d5a4da8aa94a72c79374f59fc488efd51'
            'cb002e73e864a6ca271e0bbaa6df6eb89dc1df86856fc575c20bf79367458c39'
            'b7f67b1f8424f3e0ffa1a5e57597f368c4c4f93ea1f871ec0a76700b7519b241'
            'ab944b2d074df35671ad534a1c768fdcf663d9d0f838d68b73007e3737b1a0c4')

pkgver() {
  cd macemu
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd macemu/
  # patch -p1 -i "$srcdir/sdl2_bug.patch"
}

build() {
  cd macemu/SheepShaver/src/Unix
  export CXXFLAGS="$CXXFLAGS -DSTDC_HEADERS=1 -Werror=format-security"
  ./autogen.sh \
    --prefix=/usr \
    --enable-addressing=direct \
    --enable-standalone-gui \
    --enable-sdl-audio \
	--enable-addressing=real \
    --enable-sdl-video \
    --with-bincue \
	;
  make -j1
}

package_sheepshaver-git() {
  provides=("sheepshaver=$pkgver")
  conflicts=("sheepshaver")

  install -Dm755 macemu/SheepShaver/src/Unix/SheepShaver    "$pkgdir"/usr/bin/SheepShaver
  install -Dm755 macemu/SheepShaver/src/Unix/SheepShaverGUI "$pkgdir"/usr/bin/SheepShaverGUI

  mkdir -p "$pkgdir"/usr/share/doc
  cp -a macemu/SheepShaver/doc/Linux "$pkgdir"/usr/share/doc/SheepShaver

  install -Dm644 SheepShaver.desktop "$pkgdir"/usr/share/applications/SheepShaver.desktop
  install -Dm644 SheepShaver.png     "$pkgdir"/usr/share/pixmaps/SheepShaver.png
  install -Dm644 SheepShaver.sysctl  "$pkgdir"/etc/sysctl.d/90-SheepShaver.conf
}

package_sheepnet-dkms-git() {
  depends=('dkms')
  provides=("sheepnet-dkms=$pkgver")
  conflicts=("sheepnet-dkms")

  mkdir -p "$pkgdir"/usr/src
  cp -rL macemu/SheepShaver/src/Unix/Linux/NetDriver "$pkgdir"/usr/src/sheepnet-$pkgver

  cat > "$pkgdir"/usr/src/sheepnet-$pkgver/dkms.conf <<-EOF
	PACKAGE_NAME="sheepnet"
	PACKAGE_VERSION="$pkgver"
	AUTOINSTALL=yes
	BUILT_MODULE_NAME="sheep_net"
	DEST_MODULE_LOCATION="/kernel/net"
EOF
}

# vim: ts=2:sw=2:et:
