_name=gnome-modulesets
pkgname=$_name-git
pkgver=20160125.r76.792f8ab
pkgrel=1
pkgdesc="Latests modulesets to build GNOME with JHBuild"
arch=(any)
url="https://wiki.gnome.org/Jhbuild"
license=('GPL')
depends=('jhbuild')
makedepends=('git')
source=("git+https://git.gnome.org/browse/$_name")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_name"
  d=$(date +'%Y%m%d')
  printf "%s.r%s.%s" $d $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$_name"
  
  install -d -m755 "$pkgdir/usr/share/jhbuild/modulesets/"
  for mod in $(ls *.modules); do
    install -m644 $mod "$pkgdir/usr/share/jhbuild/modulesets/${mod/.modules/-master.modules}"
  done
  
    # use JHBuild 3.15.92 file naming (before suite-core, later core; prefer before)
  mv "$pkgdir"/usr/share/jhbuild/modulesets/gnome-{,suite-}core-master.modules
  mv "$pkgdir"/usr/share/jhbuild/modulesets/gnome-{,suite-}core-deps-master.modules

    # store documentation
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
