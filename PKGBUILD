  # Maintainer:  solaraquarion <shlomochoina@gmial.com>
pkgname=extraterm-git
_pkgname=extraterm
_pkgver=0.39.0
pkgver=0.38.0.r41.ge69cf935
pkgrel=1
conflicts=('extraterm-bin')
pkgdesc="The swiss army chainsaw of terminal emulators."
arch=("i686" "x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
#depends=("nodejs")
makedepends=('openssh' 'python2' 'git' 'npm' 'yarn' 'nodejs-lts-carbon' 'typescript')
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
 cd $srcdir/$_pkgname
 yarn install
 yarn run package-linux-zip-only
}
package() {
  cd $srcdir/$_pkgname
  
  install -d $pkgdir/usr/lib
  install -d $pkgdir/usr/lib/$_pkgname

  install -d $pkgdir/usr/bin
  cp -r "$srcdir/$_pkgname"/build_tmp/extraterm-$_pkgver-linux-x64/* "$pkgdir/usr/lib/$_pkgname"

   install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
     #!/usr/bin/bash
    /usr/lib/extraterm/extraterm
END

  local _icon_dir="usr/share/icons/hicolor"
  install -Dm644 $pkgdir/usr/lib/$_pkgname/resources/app/extraterm/resources/logo/extraterm_main_logo.svg $pkgdir/$_icon_dir/scalable/apps/$_pkgname.svg

   install -Dm644 $pkgdir/usr/lib/$_pkgname/resources/app/extraterm/resources/logo/extraterm_small_logo_256x256.png  $pkgdir/$_icon_dir/256x256/apps/$_pkgname.png

  install -Dm644 $pkgdir/usr/lib/$_pkgname/resources/app/extraterm/resources/extraterm.desktop $pkgdir/usr/share/applications/extraterm.desktop

  install -Dm755 $pkgdir/usr/lib/$_pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$_pkgname/copyright
}
