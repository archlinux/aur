# Maintainer: TomHu
# Contributor: edwloef
# Contributor: hannut
# Contributor: Leo_Verto
# Contributor: tsuflux
# Contributor: sekret

pkgname=roomeqwizard-beta
_pkgname=roomeqwizard
pkgver=5.40.beta.118
_pkgver=5_40_beta_118-api
pkgrel=2
pkgdesc="A room acoustics analysis software for measuring and analysing room and loudspeaker responses"
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://www.roomeqwizard.com"
license=('custom')
depends=('xdg-utils' 'bash' 'glibc' 'java-runtime>=11' 'alsa-lib' 'xorg-xwayland')
makedepends=('java-environment' 'fontconfig' 'freetype2')
conflicts=('roomeqwizard')
source=(
    "http://www.roomeqwizard.com/installers/REW_linux_no_jre_$_pkgver.sh"
    "https://www.roomeqwizard.com/Sampledata.mdat"
)
sha512sums=(
    '90351f4427cc5c375c88d8bdd70bd28f1a1d1a5a3a7ad075aeecc99ef4e5688e4b9c39fa933b76d56335ab4fa6eb3d8fb846c6e1bb3ef015e85cb68cde90870f' 
    '79214c2c9e35dc2dfbc926b37c058ed8a67edc156823c25b353492379aa542534997b0ca94676921252d6152bfe4fb1196c7c6df16645f14ce9ffbd8e9859770'
)

package() {
  export INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/default

  sh REW_linux_no_jre_$_pkgver.sh -q -dir "$pkgdir/usr/share/java/$pkgname"  -J-Djava.util.prefs.userRoot=$srcdir/java.uprefs -J-Djava.util.prefs.systemRoot=$srcdir/java.sprefs -J-Duser.home=${HOME}

  mkdir -p "$pkgdir/usr/bin" \
           "$pkgdir/usr/share/icons" \
           "$pkgdir/usr/share/licenses/$pkgname" \
           "$pkgdir/usr/share/doc/$pkgname" \
           "$pkgdir/usr/share/applications/$pkgname"


  ln -s "/usr/share/java/$pkgname/$_pkgname" "$pkgdir/usr/bin/$pkgname"
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
  sed "s/^-Dsun.java2d.opengl=.*$/-Dsun.java2d.opengl=True/" -i "$pkgdir/usr/share/java/$pkgname/$_pkgname.vmoptions"

  # basic cleanup
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/files.log"
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/installation.log"
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/uninstall.png"
  rm -f $pkgdir/usr/share/java/$pkgname/.install4j/*.desktop
  rm -rf "$pkgdir/usr/share/java/$pkgname/uninstall"
}
