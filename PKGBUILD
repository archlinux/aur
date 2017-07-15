# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec at gmail dot com>

pkgname=brackets-bin
_pkgname=brackets
pkgver=1.10
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
source_x86_64=("https://github.com/adobe/$_pkgname/releases/download/release-$pkgver/Brackets.Release.$pkgver.64-bit.deb")
sha512sums_i686=('4b71cd70e94ac0510cf1ac2779accacbaab0782ca01864402f4492495304e9fecedc04ad7ac129cc8f0fe15eda585ebad3c4901d4260439a31c9d26265cb821f')
sha512sums_x86_64=('fdc9deea875c34c6250506714dd088b7c77036de88f14539a4cf51ecf64f3cbfc527d16f97d41cee154b54c556a4b28ce6a5b838860479792451376c92fb1b14')

 
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
