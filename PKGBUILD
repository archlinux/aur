# Maintainer: Evgeny Cherkashin <eugeneai@irnok.net>

coname=ramus
pkgname=$coname-modeler
pkgver=2.0.1
pkgrel=3
pkgdesc='Java-based IDEF0 & DFD Modeler'
arch=('any')
url='http://ramussoftware.com/'
license=('GPL')
depends=('java-runtime>=8')
 makedepends=('gendesk')
options=('!emptydirs')
source=("https://github.com/isu-enterprise/ramus/archive/v-$pkgver.zip")
sha256sums=('907d9f5ad8339d770251a353cbd320ffaff1b8a0e71f1293da6606c2c4237c10')

dname=$coname-v-$pkgver

prepare() {
  gendesk -f -n \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --exec "/usr/bin/$pkgname %U" \
    --name Ramus-modeler \
    --genericname Modeler \
    --icon "/usr/share/icons/32x32/$pkgname/icon.png" \
    --categories "Development;IDE"
}

build() {
  cd "$dname"
  ./gradlew build
  ./gradlew copyFiles
}

package() {
  install -d "$pkgdir/usr/share/doc/$pkgname/"{ru,en}
  install -d "$pkgdir/usr/share/java/$pkgname"

  install -t "$pkgdir/usr/share/doc/$pkgname"/ru "$dname/dest/doc/ru"/*
  install -t "$pkgdir/usr/share/doc/$pkgname"/en "$dname/dest/doc/en"/*
  mv "$dname/dest/full/lib/thirdparty/"{local-client-1.0-SNAPSHOT.jar,ramus-modeler.jar}
  install -C -t "$pkgdir/usr/share/java/$pkgname" "$dname/dest/full/lib/$coname/"*.jar "$dname/dest/full/lib/thirdparty/"*.jar
  install -Dm755 "$startdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$dname/dest/izpack/icon.png" "$pkgdir/usr/share/icons/32x32/$pkgname/icon.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
