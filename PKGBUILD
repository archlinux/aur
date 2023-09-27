# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Thanos Apostolou <thanosapostolou@outlook.com>
# Contributor: Alexandre Moine <alexandre@moine.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: |AhIoRoS| < ahioros@gmail.com >

pkgbase=tuxguitar
pkgname=(tuxguitar tuxguitar-common tuxguitar-gtk2)
pkgver=1.5.6
pkgrel=4
pkgdesc="multitrack guitar tablature editor and player"
arch=('any')
url="https://sourceforge.net/projects/tuxguitar/"
license=('LGPL')
depends=('jre-openjdk' 'alsa-lib')
makedepends=('unzip' 'zip' 'ant' 'jack' 'fluidsynth' 'jdk-openjdk' 'maven')
optdepends=('fluidsynth')
source=(https://downloads.sourceforge.net/tuxguitar/tuxguitar-$pkgver-src.tar.gz
        tuxguitar
        tuxguitar-gtk2)
sha256sums=('441e561ffbb9d91470f255c817f6c30300f579bf9013032615efe3f6701af274'
            'efeef39d43ecf5a87ed64abc7d8cf63a01f3c9b08bac0ea299bf959fcb7c216a'
            '39f92c0de6fcf86635dec5ac3b83613ca980fa7d24f66888fd06e5bb2c7c571f')

case $CARCH in
  i686) _arch=x86;;
  *) _arch=$CARCH;;
esac

prepare() {
  cd tuxguitar-$pkgver-src
  for file in pom.xml gervill/pom.xml TuxGuitar-lib/pom.xml; do
      sed -i -e 's|<source>1\.7</source>|<source>1\.8</source>|g' \
             -e 's|<target>1\.7</target>|<target>1\.8</target>|g' "$file"
  done
  sed -i 's|http://maven-eclipse.github.io/maven|https://maven-eclipse.github.io/maven|' pom.xml
}

build() {
  cd tuxguitar-$pkgver-src
  export MAVEN_OPTS="$MAVEN_OPTS -Duser.home=$srcdir"
  export JAVA_HOME=/usr/lib/jvm/default

  mvn clean install -P platform-linux-$_arch
  for _i in build-scripts/{tuxguitar,native-modules/tuxguitar-{alsa,oss,jack,fluidsynth}}-linux-$_arch
  do (
    cd $_i
    mvn clean install
  ); done
}

package_tuxguitar-common () {
  arch=('x86_64')
  cd tuxguitar-$pkgver-src/build-scripts
  install -d "$pkgdir"/usr/share
  cp -a tuxguitar-linux-$_arch/target/tuxguitar-$pkgver-linux-$_arch "$pkgdir"/usr/share/tuxguitar
  cp -a native-modules/tuxguitar-{alsa,oss,jack,fluidsynth}-linux-$_arch/target/build/* \
    "$pkgdir"/usr/share/tuxguitar/

  # icons
  cd ..
  for _i in 16 24 32 48 64 96; do
    _dir="$pkgdir"/usr/share/icons/hicolor/${_i}x${_i}
    install -d "$_dir"/{apps,mimetypes}
    install -m644 TuxGuitar/share/skins/Lavender/icon-${_i}x${_i}.png "$_dir"/apps/tuxguitar.png
    for _m in audio-x-{tuxguitar,gtp,ptb}; do
      ln -sr "$_dir"/apps/tuxguitar.png "$_dir"/mimetypes/$_m.png
    done
  done 
  
  #misc
  cd "${srcdir}/tuxguitar-$pkgver-src/misc"
  install -Dm644 tuxguitar.xml "$pkgdir"/usr/share/mime/packages/tuxguitar.xml
  install -Dm644 tuxguitar.desktop "$pkgdir"/usr/share/applications/tuxguitar.desktop
  
  # remove tuxguitar.sh
  rm "${pkgdir}/usr/share/tuxguitar/tuxguitar.sh"
}

package_tuxguitar () {
  depends=('tuxguitar-common' 'gtk3')
  replaces=('tuxguitar-gtk3')
  
  install -Dm 755 tuxguitar "$pkgdir"/usr/bin/tuxguitar
  install -Dm 755 "${srcdir}/tuxguitar-$pkgver-src/build-scripts/tuxguitar-linux-$_arch/target/tuxguitar-$pkgver-linux-$_arch/tuxguitar.sh" \
                  "${pkgdir}/usr/share/tuxguitar/tuxguitar.sh"
  sed -i s/SWT_GTK3=0/SWT_GTK3=1/g "${pkgdir}/usr/share/tuxguitar/tuxguitar.sh"
}

package_tuxguitar-gtk2 () {
  depends=('tuxguitar-common' 'gtk2')
  conflicts=('tuxguitar')
  provides=('tuxguitar')
  
  install -Dm 755 tuxguitar-gtk2 "$pkgdir"/usr/bin/tuxguitar
  install -Dm 755 "${srcdir}/tuxguitar-$pkgver-src/build-scripts/tuxguitar-linux-$_arch/target/tuxguitar-$pkgver-linux-$_arch/tuxguitar.sh" \
                  "${pkgdir}/usr/share/tuxguitar/tuxguitar.sh"
}
