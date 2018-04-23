  # Maintainer:  solaraquarion <shlomochoina@gmial.com>
pkgname=extraterm-git
_pkgname=extraterm
_pkgver=0.33.1
pkgver=v0.33.1.r49.gd07488b
pkgrel=1
conflicts=('extraterm')
pkgdesc="The swiss army chainsaw of terminal emulators."
arch=("i686" "x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
depends=("nodejs")
_branch=dev
source=(git+$url#branch=$_branch)
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
 cd $srcdir/$_pkgname

 yarn install 
 yarn run build
 yarn run package
}
package() {
  cd $srcdir/$_pkgname

  msg2 "  -> Installing program..."

  install -d $pkgdir/opt
  install -d $pkgdir/opt/$_pkgname

  install -d $pkgdir/usr/bin
  cp -r "$srcdir/$_pkgname"/build_tmp/extraterm-$_pkgver-linux-x64/* "$pkgdir/opt/$_pkgname"

   install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
     #!/usr/bin/bash
    /opt/extraterm/extraterm
END

  msg2 "  -> Installing icons..."
  local _icon_dir="usr/share/icons/hicolor"
  install -Dm644 $pkgdir/opt/$_pkgname/resources/app/extraterm/resources/logo/extraterm_main_logo.svg $pkgdir/$_icon_dir/scalable/apps/$_pkgname.svg

   install -Dm644 $pkgdir/opt/$_pkgname/resources/app/extraterm/resources/logo/extraterm_small_logo_256x256.png  $pkgdir/$_icon_dir/256x256/apps/$_pkgname.png

  msg2 "  -> Installing .desktop file..."
  install -Dm644 $pkgdir/opt/$_pkgname/resources/app/extraterm/resources/extraterm.desktop $pkgdir/usr/share/applications/extraterm.desktop

  msg2 "  -> Installing license..."
  install -Dm755 $pkgdir/opt/$_pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$_pkgname/copyright
}
