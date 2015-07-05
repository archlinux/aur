pkgname=sundtek
pkgver=141118.145034
pkgrel=1
pkgdesc='Driver for Sundtek MediaTV Pro'
arch=('i686' 'x86_64' 'armv6h')
url='http://www.sundtek.com/'
license=('custom')
backup=('etc/sundtek.conf')
install="$pkgname.install"
_filename="sundtek_installer_$pkgver.sh"
source=("http://www.sundtek.de/media/$_filename"
        'sundtek.conf'
        'sundtek.rules'
        'sundtek.service'
        'sundtek-restart.service')
sha256sums=('9637527e6954c4ce2d28c7a1583088cf677cea84a806ee2ab2aee7bce193b731'
            '9460c259a46b46787ca76a3e9b2fa9e3ca308d86c8bd19c73c63821e26f17f8a'
            '25d285416ca8b050fdd6fb21b70d448500e402767f87ce19a85520eb005da589'
            'c8c928d5ff8f1ee48ab2eb5c287c172e33c15b4a7d7ec7a0f993e701351c3f9d'
            '5192c1283b2c117188d265d29f360ff99baeb87bfb703961f9d6d6e692c800db')

build() {
  cd "$srcdir"

  msg2 "extracting files stage 1"
  sh "$_filename" -e

  case "$CARCH" in
    i686)
       msg2 "extracting files stage 2 ($CARCH)"
       tar xzf "$srcdir/32bit/installer.tar.gz"
       ;;
    x86_64)
       msg2 "extracting files stage 2 ($CARCH)"
       tar xzf "$srcdir/64bit/installer.tar.gz"
       ;;
    armv6h)
       msg2 "extracting files stage 2 ($CARCH)"
       tar xzf "$srcdir/armsysvhf/installer.tar.gz"
       ;;
    *)
       msg2 "architecture $CARCH not supported"
       exit 1
       ;;
  esac
}

package() {
  cd "$srcdir"

  # fix broken access rights
  chmod +r -R *

  mkdir -p "$pkgdir/opt/lib"
  cp -pr opt/bin "$pkgdir/opt/"
  cp -pr opt/lib/*.so "$pkgdir/opt/lib/"

  install -D "sundtek.conf" "$pkgdir/etc/sundtek.conf"
  install -D "sundtek.rules" "$pkgdir/etc/udev/rules.d/sundtek.rules"
  install -D "sundtek.service" "$pkgdir/usr/lib/systemd/system/sundtek.service"
  install -D "sundtek-restart.service" "$pkgdir/usr/lib/systemd/system/sundtek-restart.service"
  install -D "opt/doc/README" "$pkgdir/usr/share/licenses/sundtek/README"
}

# vim:set ts=2 sw=2 et:
