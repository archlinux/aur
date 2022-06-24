# Maintainer: hannut
# Contributor: Leo_Verto
# Contributor: tsuflux
# Contributor: sekret

pkgname=roomeqwizard
pkgver=5.20.8
_pkgver=5_20_8
pkgrel=1
pkgdesc="A room acoustics analysis software for measuring and analysing room and loudspeaker responses"
arch=('any')
url="https://www.roomeqwizard.com"
license=('custom')
depends=('java-runtime=8' 'xdg-utils')
makedepends=('java-environment=8' 'fontconfig' 'freetype2')
source=(
    "https://www.roomeqwizard.com/installers/REW_linux_$_pkgver.sh"
    "https://www.roomeqwizard.com/Sampledata.mdat"
)
sha512sums=(
    '730030b53f5d190294ee4b2b517609625203fbceacef64bf5e9c30f277930e5179e6a8b52562046a01629624761427967fbd8ae95573e08898bfcdfeef8bd01a'
    '79214c2c9e35dc2dfbc926b37c058ed8a67edc156823c25b353492379aa542534997b0ca94676921252d6152bfe4fb1196c7c6df16645f14ce9ffbd8e9859770'
)

package() {
  export INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/default

  sh REW_linux_$_pkgver.sh -q -dir "$pkgdir/usr/share/java/$pkgname"

  mkdir -p "$pkgdir/usr/bin" \
           "$pkgdir/usr/share/icons" \
           "$pkgdir/usr/share/licenses/$pkgname" \
           "$pkgdir/usr/share/doc/$pkgname" \
           "$pkgdir/usr/share/applications/$pkgname"


  ln -s "/usr/share/java/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/usr/share/java/$pkgname/EULA.html" "$pkgdir/usr/share/licenses/$pkgname/"
  cp -L "$pkgdir/usr/share/java/$pkgname/REW.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  rm "$pkgdir/usr/share/java/$pkgname/REW.desktop"

  cp "$pkgdir/usr/share/java/$pkgname/.install4j/i4j_extf_3_1byc03v_1rq5vvq.png" "$pkgdir/usr/share/icons/$pkgname.png"

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
