# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec at gmail dot com>

pkgname=brackets-bin
_pkgname=brackets
pkgver=1.5
pkgrel=1
pkgdesc="A code editor for HTML, CSS and JavaScript. "
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
provides=("brackets=$pkgver")
conflicts=('brackets' 'brackets-git')
install=$pkgname.install

if [[ $CARCH == "x86_64" ]]; then
  _arch=64
  sha512sums=('63b9893e2aa8e2ffc3e5b21a217e5b6cc9a1b41c35b7a7710bc9f6afe71b6a9618e2b4c5759a89dcad64efa370629d59a26a33f989e28e9dc944431e5ffb8404')
elif [[ $CARCH == "i686" ]]; then
  _arch=32
  sha512sums=('65cf961dd3c14643a307f9925a071fed5546dd7c075ae9d8c765e0afb73062e8ae67ea5bc035a610c13291bd29e151858ec08f2929464a3e7c69e9c63fdba3be')
fi

source=("https://github.com/adobe/$_pkgname/releases/download/release-$pkgver/Brackets.Release.$pkgver.$_arch-bit.deb")

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
