# Maintainer: AwesomeHaircut <jesusbalbastro at gmail com>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>
# Past Contributor: James An <james@jamesan.ca>

pkgname=droidcam
pkgver=6.7.5
pkgrel=3
pkgdesc='A tool for using your android device as a wireless/usb webcam'
arch=('i686' 'x86_64')
url="https://www.dev47apps.com/$pkgname/linuxx"
license=('custom')
makedepends=( 'linux-headers' )
options=('!strip')
optdepends=('v4l-utils: Userspace tools and conversion library for Video 4 Linux'
            'gtk2: use GUI version in addition to CLI interface' )
install="$pkgname.install"
source=("$pkgname.desktop"
        "https://github.com/aramg/$pkgname/raw/master/linux/icon2.png")
source_i686=("$pkgname.tar.bz2::https://www.dev47apps.com/files/linux/droidcam_081219_32bit.tar.bz2")
source_x86_64=("$pkgname.tar.bz2::https://www.dev47apps.com/files/linux/droidcam_081219_64bit.tar.bz2")
noextract=("$pkgname.tar.bz2")
md5sums=('199d8f3dbc6697f06350b00de99f2274'
         '0f0e1d04146dd5be70d5028f144bd0a2')
md5sums_i686=('661effc75e2772f20466e738027a16d4')
md5sums_x86_64=('eb676cd06c92a722ab8b3c4c771baf94')

prepare() {
  # Extract source from within leading arcqh-specific folder
  tar --transform='s/-\(32\|64\)bit//' --show-transformed-names -xjf "$pkgname.tar.bz2"
  cd "$pkgname"

  # Generate the module loading configuration files
  cat <<EOF >| "v4l2loopback/$pkgname.modules-load.conf"
videodev
v4l2loopback_dc
EOF
  echo "options v4l2loopback_dc width=320 height=240" >| "v4l2loopback/$pkgname.modprobe.conf"
}

build() {
  cd "$pkgname/v4l2loopback"
  make
  gzip -f v4l2loopback-dc.ko
}

package() {
  cd "$pkgname"

  # Install droidcam program files
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$pkgname-cli" "$pkgdir/usr/bin/$pkgname-cli"
  install -Dm644 ../icon2.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 README "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install kernel module and config files
  cd v4l2loopback
  MODPATH="/usr/lib/modules/$(uname -r | sed 's/.[0-9]+-[0-9]+//')/extramodules"
  install -Dm644 v4l2loopback-dc.ko.gz        "$pkgdir$MODPATH/v4l2loopback_dc.ko.gz"
  install -Dm644 "$pkgname.modules-load.conf" "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
  install -Dm644 "$pkgname.modprobe.conf"     "$pkgdir/etc/modprobe.d/$pkgname.conf"
}

