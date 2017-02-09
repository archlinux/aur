# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=gpsprune
pkgver=18.6
pkgrel=1
pkgdesc="a java application for viewing, editing and converting coordinate data from GPS systems"
arch=('any')
url="http://sourceforge.net/projects/prune-gps/"
license=("GPL")
depends=('java-runtime')
makedepends=('java-environment' 'java3d')
optdepends=('povray' 'perl-image-exiftool' 'gpsbabel' 'gnuplot')
source=("http://activityworkshop.net/software/${pkgname%%_bin}/${pkgname%%_bin}_${pkgver}_source.tar.bz2" "http://activityworkshop.net/software/gpsprune/prunelogo.png" "${pkgname%%_bin}.desktop")
md5sums=('53d5b4350b6952343ffd1ff3a533b50b'
         '0dce06ef7eec27ecff78eb0a83c0b123'
         '000b0d3ba573fedf4eaf92ac6c1829dd')
noextract=("${pkgname%%_bin}_${pkgver}.jar")
conflicts=('gpsprune_bin' 'prune_dev_bin')

build() {
  cd ${srcdir}/${pkgname%%_bin}_${pkgver}
  sed -i '/javac/s%compile%compile -cp "/opt/java/jre/lib/ext/*"%' build.sh
  chmod +x ./build.sh
  ./build.sh
}

package() {
  cd ${srcdir}/${pkgname%%_bin}_${pkgver}
  install -D -m644 dist/gpsprune_${pkgver}.jar $pkgdir/usr/share/java/gpsprune/gpsprune_${pkgver}.jar
  echo -e "#"'!'"/bin/bash\njava -jar /usr/share/java/gpsprune/gpsprune_${pkgver}.jar \"\$@\"" >./gpsprune
  install -D -m755 ./gpsprune $pkgdir/usr/bin/gpsprune
  install -D -m644 $srcdir/prunelogo.png $pkgdir/usr/share/pixmaps/gpsprune.png
  install -D -m644 $srcdir/gpsprune.desktop $pkgdir/usr/share/applications/gpsprune.desktop
}
