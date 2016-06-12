# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec at gmail dot com>

pkgname=brackets-bin
_pkgname=brackets
pkgver=1.7
pkgrel=1
pkgdesc="A code editor for HTML, CSS and JavaScript. "
arch=("i686" "x86_64")
url="http://brackets.io"
license=("MIT")
depends=("gconf" "libgcrypt15" "nodejs" "nspr" "nss" "systemd")
optdepends=("google-chrome: to enable Live Preview"
            "gnuplot: to enable node benchmarking"
            "gtk2: to enable native UI"
            "ruby: to enable LiveDevelopment Inspector"
            "desktop-file-utils: for update-desktop-database"
            "hicolor-icon-theme: for hicolor theme hierarchy")
provides=("brackets=$pkgver")
conflicts=('brackets' 'brackets-git')
install=$pkgname.install

source_i686=("https://github.com/adobe/$_pkgname/releases/download/release-$pkgver/Brackets.Release.$pkgver.32-bit.deb")
sha512sums_i686=('a121aaef840ad52c6fe7f5068e5d4079490977baf23faa2d8b7adcb174df5674f7df43ad210ad4b9b00cca1889933383779e99c74e4d5b689658e66a7cad355a')

source_x86_64=("https://github.com/adobe/$_pkgname/releases/download/release-$pkgver/Brackets.Release.$pkgver.64-bit.deb")
sha512sums_x86_64=('33fa6bf08f2fb69a1ac5b8c2ca958384774083d749f5281444697a20048e771427999119ffc8665129486eff25f0be81f322a58d334d0a328086d121ad1a560e')
 
prepare() {
  cd $srcdir

  msg2 "  -> Extracting files..."
  tar -xf data.tar.xz

  msg2 "  -> Fixing executable stack..."
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
