# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=josm-svn
pkgver=16176
pkgrel=1
pkgdesc="An editor for OpenStreetMap written in Java"
arch=('any')
url="http://josm.openstreetmap.de/"
license=('GPL')
depends=('java-runtime>=8' 'libxtst' 'ttf-font')
makedepends=('apache-ant' 'java-environment>=8' 'subversion')
provides=('josm')
conflicts=('josm')
backup=('etc/conf.d/josm')
source=("$pkgname::svn+https://josm.openstreetmap.de/svn/trunk"
        "josm.sh"
        "josm.conf")
sha256sums=('SKIP'
            '04d12673ad6e00093123a474b9d85400fcbdd28ec1e8421ac33859cd2e69d134'
            '43ee660f17ee2205c0e0654e8d229db78535e4d28e1298f02ebb814ae433dfd1')

pkgver() {
  cd "$pkgname"
  printf "%s" "$(svnversion | tr -d 'A-z')"
}

build() {
  cd "$pkgname"
  ant clean
  ant dist
}

package() {
  # application
  install -Dm644 "$pkgname/dist/josm-custom.jar" "$pkgdir/usr/share/java/josm/josm.jar"
  install -Dm755 josm.sh "$pkgdir/usr/bin/josm"

  # configuration
  install -Dm644 josm.conf "$pkgdir/etc/conf.d/josm"

  # desktop integration
  install -Dm644 "$pkgname/native/linux/tested/usr/share/applications/org.openstreetmap.josm.desktop" "$pkgdir/usr/share/applications/org.openstreetmap.josm.desktop"
  install -Dm644 "$pkgname/native/linux/tested/usr/share/metainfo/org.openstreetmap.josm.appdata.xml" "$pkgdir/usr/share/metainfo/org.openstreetmap.josm.appdata.xml"
  install -Dm644 "$pkgname/native/linux/tested/usr/share/pixmaps/org.openstreetmap.josm.png" "$pkgdir/usr/share/pixmaps/org.openstreetmap.josm.png"
  cp -dr --preserve=mode,timestamp "$pkgname/native/linux/tested/usr/share/icons" "$pkgdir/usr/share/icons"

  # man page
  install -Dm644 "$pkgname/native/linux/tested/usr/share/man/man1/josm.1" "$pkgdir/usr/share/man/man1/josm.1"
}
