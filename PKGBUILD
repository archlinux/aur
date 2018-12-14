# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>
# Contributor: Alexandre Moine <alexandre@moine.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: |AhIoRoS| < ahioros@gmail.com >

pkgbase=tuxguitar
pkgname=(tuxguitar tuxguitar-common tuxguitar-gtk2)
pkgver=1.5.2
pkgrel=2
pkgdesc="multitrack guitar tablature editor and player"
arch=('x86_64')
url="http://sourceforge.net/projects/tuxguitar"
license=('LGPL')
depends=('java-runtime>=8' 'alsa-lib' 'libxtst')
makedepends=('unzip' 'zip' 'apache-ant' 'jack' 'fluidsynth' 'java-environment>=8' 'maven')
optdepends=('fluidsynth')
source=(https://downloads.sourceforge.net/tuxguitar/tuxguitar-$pkgver-src.tar.gz
        nogcj.patch
        tuxguitar
        tuxguitar-gtk2)
sha256sums=('a9ade566752aa0ac72831a1cd0b18b85d302eca7934e2192ad875f51df755981'
            'bda4bc1b864ecfa27392a145854ee3b5ab20876c2d2bc38bbf85f92ce97fe2bc'
            'efeef39d43ecf5a87ed64abc7d8cf63a01f3c9b08bac0ea299bf959fcb7c216a'
            '39f92c0de6fcf86635dec5ac3b83613ca980fa7d24f66888fd06e5bb2c7c571f')

case $CARCH in
  i686) _arch=x86;;
  *) _arch=$CARCH;;
esac

prepare() {
  cd tuxguitar-$pkgver-src
  patch -Np1 -i ../nogcj.patch

  # For jdk9
  for _i in `find . -name pom.xml -print`; do
    sed -i 's|<source>1.5</source>|<source>1.6</source>|g' $_i
    sed -i 's|<target>1.5</target>|<target>1.6</target>|g' $_i
  done
  
}

build() {
  export MAVEN_OPTS="$MAVEN_OPTS -Duser.home=$srcdir"
  export JAVA_HOME="/usr/lib/jvm/"`archlinux-java get`

  cd tuxguitar-$pkgver-src
  for _i in . TuxGuitar-{lib,gm-utils} \
    build-scripts/{tuxguitar,native-modules/tuxguitar-{alsa,oss,jack,fluidsynth}}-linux-$_arch
  do (
    cd $_i
    mvn install
  ); done
}

package_tuxguitar-common () {
  # tuxguitar
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
