# Maintainer:  trtf4006 <tim@frydaho.com>

pkgname=brackets-extract
_pkgname=brackets
pkgver=1.6
pkgrel=1
pkgdesc="A code editor for HTML, CSS and JavaScript with Extract bundle."
arch=("i686" "x86_64")
url="http://brackets.io"
license=("MIT")
depends=("gconf" "libgcrypt15" "nodejs" "nspr" "nss" "systemd")
makedepends=("prelink")
optdepends=("google-chrome: to enable Live Preview"
            "gnuplot: to enable node benchmarking"
            "gtk2: to enable native UI"
            "ruby: to enable LiveDevelopment Inspector"
            "desktop-file-utils: for update-desktop-database"
            "hicolor-icon-theme: for hicolor theme hierarchy")
provides=("brackets-extract=$pkgver")
conflicts=('brackets' 'brackets-git' 'brackets-bin')
install=$pkgname.install

if [[ $CARCH == "x86_64" ]]; then
  _arch=64
  sha512sums=('4617a4761d2bd8c9eee45e838a4cf5f1b119810c9b1deb7a150a9750b45fd27db929e51f6b8f5a5f4bd656d81da8d210050c98e3eb27d772dd5dd8f66067ba46')
elif [[ $CARCH == "i686" ]]; then
  _arch=32
sha512sums=('75819fd004fceb9e46277795166ce56a951dbe2ff1a762775594d4c417fc7d9982334c09666961ee0e5cdc3173d98a23f346ba4111292335a5ff7a549b250898')
fi

source=("https://github.com/adobe/$_pkgname/releases/download/release-$pkgver%2Beb4/Brackets.$pkgver.Extract.$_arch-bit.deb")

prepare() {
  cd $srcdir

  msg2 "  -> Extracting files..."
  tar -xf data.tar.xz

  msg2 "  -> Fixing executable stack..."
  execstack -c opt/$_pkgname/Brackets
}

package() {
  cd $srcdir

  msg2 "  -> Installing program..."

  install -d $pkgdir/opt
  cp -r opt/$_pkgname $pkgdir/opt/$_pkgname

  chmod -R a+rw $pkgdir/opt/$_pkgname/samples

  install -d $pkgdir/usr/bin
  ln -s /opt/brackets/brackets $pkgdir/usr/bin/$_pkgname

  msg2 "  -> Installing icons..."
  local _icon_dir="usr/share/icons/hicolor"
  install -d $pkgdir/$_icon_dir/scalable/apps
  install -Dm644 $_icon_dir/scalable/apps/$_pkgname.svg $pkgdir/$_icon_dir/scalable/apps/$_pkgname.svg
  for _icon in "opt/brackets/appshell"*.png; do
    local _icon_size=${_icon##*/appshell}
    install -d $pkgdir/$_icon_dir/${_icon_size%.png}x${_icon_size%.png}/apps
    install -Dm644 $_icon $pkgdir/$_icon_dir/${_icon_size%.png}x${_icon_size%.png}/apps/$_pkgname.png
  done

  msg2 "  -> Installing .desktop file..."
  install -d $pkgdir/usr/share/applications
  sed 's/Development/Development;/' opt/$_pkgname/$_pkgname.desktop > $pkgdir/usr/share/applications/$_pkgname.desktop

  msg2 "  -> Installing license..."
  install -Dm755 usr/share/doc/$_pkgname/copyright $pkgdir/usr/share/licenses/$_pkgname/copyright
}
