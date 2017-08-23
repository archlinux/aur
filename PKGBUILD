# $Id$
# Maintainer: Kris McCleary <kris27mc@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: |AhIoRoS| < ahioros@gmail.com >

pkgname=tuxguitar-gtk3
pkgver=1.4
pkgrel=1
pkgdesc="multitrack guitar tablature editor and player"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tuxguitar"
license=('LGPL')
depends=('java-runtime>=8' 'alsa-lib' 'gtk3' 'libxtst')
makedepends=('unzip' 'zip' 'apache-ant' 'jack' 'fluidsynth' 'jdk8-openjdk' 'maven')
conflicts=('tuxguitar')
provides=('tuxguitar')
optdepends=('fluidsynth')
source=(tuxguitar-src-$pkgver.tar.gz::http://downloads.sourceforge.net/project/tuxguitar/TuxGuitar/TuxGuitar-$pkgver/tuxguitar-$pkgver-src.tar.gz
        tuxguitar.desktop tuxguitar.xml nogcj.patch)
sha256sums=('ac72690bc1c20919dd66df46f757c6890be4c54b38f2a3b59a0265c777392210'
            '6a6c2c64f75f7402b6913e493b847f6b6d9d789bad7ab3ec023f61784d38bbfa'
            'd5b79049776c39e8c58bfa5b9748678ed2ed376e7c4cc1e837de5666f18a8e56'
            'bda4bc1b864ecfa27392a145854ee3b5ab20876c2d2bc38bbf85f92ce97fe2bc')

case $CARCH in
  i686) _arch=x86;;
  *) _arch=$CARCH;;
esac

prepare() {
  cd tuxguitar-$pkgver-src
  patch -Np1 -i ../nogcj.patch
}

build() {
  export MAVEN_OPTS="$MAVEN_OPTS -Duser.home=$srcdir"
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"

  cd tuxguitar-$pkgver-src
  for _i in . TuxGuitar-{lib,gm-utils} \
    build-scripts/{tuxguitar,native-modules/tuxguitar-{alsa,oss,jack,fluidsynth}}-linux-$_arch
  do (
    cd $_i
    mvn install
  ); done
}

package() {
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

  # desktop files
  cd ..
  install -D /dev/stdin "$pkgdir"/usr/bin/tuxguitar <<EOF
#!/bin/sh -e
cd /usr/share/tuxguitar
exec ./tuxguitar.sh -Dorg.eclipse.swt.internal.gtk.cairoGraphics=false "\$@"
EOF
  install -Dm644 tuxguitar.xml "$pkgdir"/usr/share/mime/packages/tuxguitar.xml
  install -Dm644 tuxguitar.desktop "$pkgdir"/usr/share/applications/tuxguitar.desktop
}