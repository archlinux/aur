# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=fortune-mod-fr-deb
pkgver=0.65+nmu3
pkgrel=1
pkgdesc="Collection of French fortune cookie files from Debian"
arch=('any')
url="https://packages.debian.org/bullseye/fortunes-fr"
license=('custom')
groups=('fortune-mods')
depends=('fortune-mod')
makedepends=('recode')
provides=('fortune-mod-fr')
conflicts=('fortune-mod-fr')
replaces=('fortune-mod-fr')
source=("https://deb.debian.org/debian/pool/main/f/fortunes-fr/fortunes-fr_${pkgver}.tar.gz")
sha256sums=('98488a2c1a62f2740ea085b3aca9757e3083d9b028657f16eaf3c5cfab379d28')

build() {
  cd "fortunes-fr-$pkgver"

  # Inspired by debian/rules

  msg2 "Building fortunes-fr"
  cd fortunes-fr-*
  ./configure --prefix=/usr --with-fortunesdir=/usr/share/fortune/fr --with-charset=UTF8
  make

  msg2 "Unpacking archives"
  cd ../linuxfr-undernet
  bsdtar -xf linuxfr-20020411.tar.gz

  cd ../tolkien
  bsdtar -xf tolkien_fr-1.6.tgz

  cd ..
  rm -rf build
  mkdir build

  msg2 "Converting files"
  lines=`wc -l gcu/cabale.txt | sed -e 's/gcu\/cabale.txt//g'` \
       head -n $(($lines - 2)) gcu/cabale.txt | sed -e "s/^$/%/g" \
       > build/gcu
  sed -e "s/^$/%/g" gfa/GFA > build/gfa
  (cat gpj/gpj ; echo) | sed -e "s/^$/%/g" > build/gpj
  (cat glp/glp.txt ; echo) | sed -e "s/^$/%/g" > build/glp

  msg2 "Copying files"
  cp ellisllk/mauriceetpatapon build/
  cp ellisllk/oulipo build/
  cp tribune-linuxfr/tribune.fortune build/tribune-linuxfr
  cp tolkien/tolkien_fr-1.6/tolkien_fr build/
  cp multidesk/multidesk build/
  cp mdos/fortunes-mdos.txt build/multidesk2
  cp linuxfr-undernet/linuxfr-20020411/linuxfr build/linuxfr-undernet
  cp debian-fr/debian-fr build/

  msg2 "Fixing files"
  for file in build/*; do
    sed -e '/^-- $/d' $file > $file.new && mv $file.new $file
  done

  msg2 "Converting to UTF-8 and generating .dat files"
  for file in build/*; do
    recode ISO-8859-15..UTF-8 $file
    strfile $file
  done
}

package() {
  cd "fortunes-fr-$pkgver"

  msg2 "Installing fortunes-fr"
  cd fortunes-fr-*
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/share/doc

  msg2 "Installing other files"
  cd ../build
  for file in ./*; do
    install -Dm644 $file "$pkgdir"/usr/share/fortune/fr/$file
  done

  msg2 "Installing license file"
  cd ..
  install -Dm644 debian/copyright "$pkgdir"/usr/share/licenses/$pkgname/copyright
}
