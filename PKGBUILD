# Maintainer: edwloef
# Contributor: hannut
# Contributor: Leo_Verto
# Contributor: tsuflux
# Contributor: sekret

pkgname=roomeqwizard
pkgver=5.31.3
_pkgver=5_31_3
pkgrel=1
pkgdesc="A room acoustics analysis software for measuring and analysing room and loudspeaker responses"
arch=('x86_64' 'aarch64')
url="https://www.roomeqwizard.com"
license=('custom')
depends=('xdg-utils' 'bash' 'glibc' 'java-runtime=8' 'alsa-lib')
makedepends=('java-environment=8' 'fontconfig' 'freetype2')
source=(
    "http://www.roomeqwizard.com/installers/REW_linux_no_jre_$_pkgver.sh"
    "https://www.roomeqwizard.com/Sampledata.mdat"
)
sha512sums=(
    '921872ff4be2cd09b3ee11a7bdca8f7e838c683e450c6886530a99861b9dd877441498bf2fc671e1e0414464b78ffdc15cca7fc7ee6da01a7aa63e181e2766ad'
    '79214c2c9e35dc2dfbc926b37c058ed8a67edc156823c25b353492379aa542534997b0ca94676921252d6152bfe4fb1196c7c6df16645f14ce9ffbd8e9859770'
)

package() {
  export INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/default

  sh REW_linux_no_jre_$_pkgver.sh -q -dir "$pkgdir/usr/share/java/$pkgname"  -J-Djava.util.prefs.userRoot=$srcdir/java.uprefs -J-Djava.util.prefs.systemRoot=$srcdir/java.sprefs

  mkdir -p "$pkgdir/usr/bin" \
           "$pkgdir/usr/share/icons" \
           "$pkgdir/usr/share/licenses/$pkgname" \
           "$pkgdir/usr/share/doc/$pkgname" \
           "$pkgdir/usr/share/applications/$pkgname"


  ln -s "/usr/share/java/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/usr/share/java/$pkgname/EULA.html" "$pkgdir/usr/share/licenses/$pkgname/"
  cp -L "$pkgdir/usr/share/java/$pkgname/REW.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  rm "$pkgdir/usr/share/java/$pkgname/REW.desktop"

  cp "$pkgdir/usr/share/java/$pkgname/.install4j/roomeqwizard.png" "$pkgdir/usr/share/icons/$pkgname.png"

  cp Sampledata.mdat "$pkgdir/usr/share/doc/$pkgname/"

  # repair
  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/java/$pkgname/.install4j/response.varfile"
  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/java/$pkgname/.install4j/install.prop"
  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  sed "s/REW/Room EQ Wizard/g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  echo "Icon=/usr/share/icons/$pkgname.png" >> "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  # fix waterfall crash
  # https://www.avnirvana.com/threads/rew-for-linux-waterfall-drawing-problem.2956/
  sed "s/^-Dsun.java2d.opengl=.*$/-Dsun.java2d.opengl=True/" -i "$pkgdir/usr/share/java/$pkgname/$pkgname.vmoptions"

  # basic cleanup
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/files.log"
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/installation.log"
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/uninstall.png"
  rm -f $pkgdir/usr/share/java/$pkgname/.install4j/*.desktop
  rm -rf "$pkgdir/usr/share/java/$pkgname/uninstall"
}
