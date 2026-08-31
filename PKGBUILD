# Maintainer: TomHu
# Contributor: edwloef
# Contributor: hannut
# Contributor: Leo_Verto
# Contributor: tsuflux
# Contributor: sekret

pkgname=roomeqwizard-beta
pkgver=5.40.beta.134
pkgrel=1
pkgdesc="A room acoustics analysis software for measuring and analysing room and loudspeaker responses"
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://www.roomeqwizard.com"
license=('custom')
depends=('xdg-utils' 'bash' 'glibc' 'java-runtime=17' 'alsa-lib' 'xorg-xwayland')
makedepends=('fontconfig' 'freetype2')
#conflicts=('roomeqwizard')
source=(
    "https://www.roomeqwizard.com/installers/REW_linux_no_jre_${pkgver//./_}-api.sh"
    "https://www.roomeqwizard.com/Sampledata.mdat"
)

sha512sums=('cbb88601372f5df5982816ff908ece9132f4770911105550813f8803336efcbb7eed961ea414a7de2f411c3cd9de09a6a19468aebe6ca8e31f5bdd21d7d06643'
            '79214c2c9e35dc2dfbc926b37c058ed8a67edc156823c25b353492379aa542534997b0ca94676921252d6152bfe4fb1196c7c6df16645f14ce9ffbd8e9859770')

package() {
  export INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/default
  sh REW_linux_no_jre_${pkgver//./_}-api.sh -q -dir "$srcdir/usr/share/java/$pkgname"  -J-Djava.util.prefs.userRoot=$srcdir/java.uprefs -J-Djava.util.prefs.systemRoot=$srcdir/java.sprefs -J-Duser.home=${HOME}

  #delete unfitting arch libs
  case "$CARCH" in
    x86_64)
        rm "$srcdir/usr/share/java/$pkgname/bin/libcsjsound_aarch64.so"
        ;;
    aarch64)
        rm "$srcdir/usr/share/java/$pkgname/bin/libcsjsound_amd64.so"
        ;;
    *)
        # Commands for other architectures
        ;;
  esac

  # modify application name to contain "-beta"
  sed 's/REW/Room EQ Wizard beta/' -i "$srcdir/usr/share/java/$pkgname/REW.desktop"
  sed '/Exec/c\Exec=roomeqwizard-beta %U' -i "$srcdir/usr/share/java/$pkgname/REW.desktop"
  sed "/Icon/c\Icon=\/usr\/share\/icons\/$pkgname.png" -i "$srcdir/usr/share/java/$pkgname/REW.desktop"
  
  # fix waterfall crash
  # https://www.avnirvana.com/threads/rew-for-linux-waterfall-drawing-problem.2956/
  sed '/-Dsun.java2d.opengl/c\-Dsun.java2d.opengl=True' -i "$srcdir/usr/share/java/$pkgname/${pkgname%-beta}.vmoptions"

  # repair
  sed "s%$srcdir%%g" -i "$srcdir/usr/share/java/$pkgname/.install4j/response.varfile"
  sed "s%$srcdir%%g" -i "$srcdir/usr/share/java/$pkgname/.install4j/install.prop"
  sed "s%$srcdir%%g" -i "$srcdir/usr/share/java/$pkgname/REW.desktop"
  
  # basic cleanup
  rm -f  "$srcdir/usr/share/java/$pkgname/.install4j/install4j_rg7rr1-roomeqwizard.desktop" \
    "$srcdir/usr/share/java/$pkgname/.install4j/files.log" \
    "$srcdir/usr/share/java/$pkgname/.install4j/installation.log" \
    "$srcdir/usr/share/java/$pkgname/.install4j/install4j_rg7rr1-application.x-rew.xml" \
    "$srcdir/usr/share/java/$pkgname/.install4j/uninstall.png"
  rm -rf "$srcdir/usr/share/java/$pkgname/uninstall"

  install -m 755 -d \
    "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/icons" \
    "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/share/java/$pkgname/bin" \
    "$pkgdir/usr/share/java/$pkgname/lib" \
    "$pkgdir/usr/share/java/$pkgname/bundles" \
    "$pkgdir/usr/share/java/$pkgname/.install4j" \
    "$pkgdir/usr/share/applications/"

  # copy all files into the target
  cp -Lr "$srcdir/usr/share/java/$pkgname/bin" "$pkgdir/usr/share/java/$pkgname"
  cp -Lr "$srcdir/usr/share/java/$pkgname/lib" "$pkgdir/usr/share/java/$pkgname"
  cp -Lr "$srcdir/usr/share/java/$pkgname/bundles" "$pkgdir/usr/share/java/$pkgname"
  cp -Lr "$srcdir/usr/share/java/$pkgname/.install4j" "$pkgdir/usr/share/java/$pkgname"
  install -m 644 -t "$pkgdir/usr/share/java/$pkgname" \
      "$srcdir/usr/share/java/$pkgname/keystore.jks" \
      "$srcdir/usr/share/java/$pkgname/RoomEQ_Wizard_obf.jar" \
      "$srcdir/usr/share/java/$pkgname/roomeqwizard.vmoptions" \
      "$srcdir/usr/share/java/$pkgname/spark-swagger.conf"

  install -T -m 755 "$srcdir/usr/share/java/$pkgname/${pkgname%-beta}" "$pkgdir/usr/share/java/$pkgname/$pkgname"
  ln -s "/usr/share/java/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -T -m 644 "$srcdir/usr/share/java/$pkgname/EULA.html" "$pkgdir/usr/share/licenses/$pkgname/EULA.html"
  install -T -m 644 "$srcdir/usr/share/java/$pkgname/REW.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -T -m 644 "$srcdir/usr/share/java/$pkgname/.install4j/roomeqwizard.png" "$pkgdir/usr/share/icons/$pkgname.png"
  install -m 644 "$srcdir/Sampledata.mdat" "$pkgdir/usr/share/doc/$pkgname/"
}
