# Maintainer: James An <james@jamesan.ca>
# Contributor: AwesomeHaircut <jesusbalbastro at gmail com>

pkgname=droidcam
pkgver=6.0
pkgrel=8
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
source_i686=("$pkgname.tar.bz2"::"https://www.dev47apps.com/files/600/$pkgname-32bit.tar.bz2")
source_x86_64=("$pkgname.tar.bz2"::"https://www.dev47apps.com/files/600/$pkgname-64bit.tar.bz2")
noextract=("$pkgname.tar.bz2")
md5sums=('199d8f3dbc6697f06350b00de99f2274'
         '0f0e1d04146dd5be70d5028f144bd0a2')
md5sums_i686=('b4b4bb43a4e4a46aab2c1b38cd0892c3')
md5sums_x86_64=('743b71f1af4d90b5ced59c02fcbc925f')

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
  MODPATH="/usr/lib/modules/extramodules-$(uname -r | sed 's/\.[0-9]\+-[0-9]\+//')"
  install -Dm644 v4l2loopback-dc.ko.gz        "$pkgdir$MODPATH/v4l2loopback_dc.ko.gz"
  install -Dm644 "$pkgname.modules-load.conf" "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
  install -Dm644 "$pkgname.modprobe.conf"     "$pkgdir/etc/modprobe.d/$pkgname.conf"

}
