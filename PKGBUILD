# Maintainer: Jan Fader <jan.fader@web.de>
pkgname=jameica
pkgver=2.6.2
_pkgver=2.6
pkgrel=2
pkgdesc="Jameica is a JAVA GUI framework basing on SWT"
arch=('i686' 'x86_64')
url="https://www.willuhn.de/projects/jameica/"
license=("GPL")
depends=('java-runtime>=1.5' 'java-environment' 'swt')
makedepends=('unzip')
# See https://willuhn.de/products/jameica/download.php for checksums
if [ "$CARCH" = "i686" ]; then
  source=("${pkgname}-${pkgver}::https://www.willuhn.de/projects/jameica/releases/$_pkgver/jameica/$pkgname-linux.zip")
  sha1sums=('42d929a71c40a21a3d1814ac660f642508da787d')
elif [ "$CARCH" = "x86_64" ]; then
  source=("${pkgname}-${pkgver}::https://www.willuhn.de/projects/jameica/releases/$_pkgver/jameica/$pkgname-linux64.zip")
  sha1sums=('c0d4a8cf2eb9f1c48e232f70510537f1aa6ddd15')
fi

build() {
  cd $srcdir/jameica
  sed -i '6c cd /opt/jameica' jameica.sh jameicaserver.sh
  sed -i '10 s/lib\/swt\/linux/\/usr\/lib/' jameica.sh jameicaserver.sh
  sed -i '10 s/$@/& \&> \/dev\/null \&/' jameica.sh jameicaserver.sh
  sed -i '/^dir/d' jameica.sh jameicaserver.sh
  sed -i '/^link/d' jameica.sh jameicaserver.sh
  sed -i '/^cd "$dir"/d' jameica.sh jameicaserver.sh
}
package() {
  cd $srcdir/jameica
  mkdir -p $pkgdir/{usr/bin,opt}
  install -m755 jameica.sh $pkgdir/usr/bin/jameica
  install -m755 jameicaserver.sh $pkgdir/usr/bin/jameicaserver
  cd $srcdir
  cp -r jameica $pkgdir/opt/
  rm $pkgdir/opt/jameica/jameica{,server}.sh
  rm $pkgdir/opt/jameica/rcjameica
  if [ "$CARCH" =  "x86_64" ]; then
    rm -rf $pkgdir/opt/jameica/lib/swt/linux64
    mkdir $pkgdir/opt/jameica/lib/swt/linux64
    ln -s /usr/share/java/swt.jar $pkgdir/opt/jameica/lib/swt/linux64/swt.jar
  else
    rm -rf $pkgdir/opt/jameica/lib/swt/linux
    mkdir $pkgdir/opt/jameica/lib/swt/linux
    ln -s /usr/share/java/swt.jar $pkgdir/opt/jameica/lib/swt/linux/swt.jar
  fi
  find $pkgdir/opt/jameica -type f -exec chmod 644 {} +
}
