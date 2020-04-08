# Maintainer: AwesomeHaircut <jesusbalbastro at gmail com>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>
# Past Contributor: James An <james@jamesan.ca>

pkgname=droidcam
pkgver=6.7.5
pkgrel=4
pkgdesc='A tool for using your android device as a wireless/usb webcam'
arch=('x86_64')
url="https://www.dev47apps.com/$pkgname/linuxx"
license=('custom')
makedepends=( 'linux-headers' )
options=('!strip')
optdepends=('v4l-utils: Userspace tools and conversion library for Video 4 Linux'
            'gtk2: use GUI version in addition to CLI interface' )
install="$pkgname.install"
source=(
	"$pkgname.desktop"
    "https://github.com/aramg/$pkgname/raw/master/linux/icon2.png"
    "$pkgname.tar.bz2::https://www.dev47apps.com/files/linux/droidcam_latest.zip"
)

#noextract=("$pkgname.tar.bz2")
md5sums=(
	'199d8f3dbc6697f06350b00de99f2274'
	'0f0e1d04146dd5be70d5028f144bd0a2'
    '7775e36b5325dc1f32d485eb3cc72fd1'
)

prepare() {
  # Generate the module loading configuration files
  cat <<EOF >| "v4l2loopback/$pkgname.modules-load.conf"
videodev
v4l2loopback_dc
EOF
  echo "options v4l2loopback_dc width=320 height=240" >| "v4l2loopback/$pkgname.modprobe.conf"
}

build() {
  cd "v4l2loopback"
  make
  gzip -f v4l2loopback-dc.ko
}

package() {
  # Install droidcam program files
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$pkgname-cli" "$pkgdir/usr/bin/$pkgname-cli"
  install -Dm644 ../icon2.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install kernel module and config files
  cd v4l2loopback
  MODPATH="/usr/lib/modules/$(uname -r | sed 's/.[0-9]+-[0-9]+//')/extramodules"
  install -Dm644 v4l2loopback-dc.ko.gz        "$pkgdir$MODPATH/v4l2loopback_dc.ko.gz"
  install -Dm644 "$pkgname.modules-load.conf" "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
  install -Dm644 "$pkgname.modprobe.conf"     "$pkgdir/etc/modprobe.d/$pkgname.conf"
}

