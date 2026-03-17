# Maintainer: TomHu
# Contributor: edwloef
# Contributor: hannut
# Contributor: Leo_Verto
# Contributor: tsuflux
# Contributor: sekret

pkgname=roomeqwizard-beta
pkgver=5.40.beta.119
pkgrel=2
pkgdesc="A room acoustics analysis software for measuring and analysing room and loudspeaker responses"
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://www.roomeqwizard.com"
license=('custom')
depends=('xdg-utils' 'bash' 'glibc' 'java-runtime=11' 'alsa-lib' 'xorg-xwayland')
makedepends=('java-runtime=11' 'fontconfig' 'freetype2')
#conflicts=('roomeqwizard')
source=(
    "https://www.roomeqwizard.com/installers/REW_linux_no_jre_${pkgver//./_}-api.sh"
    "https://www.roomeqwizard.com/Sampledata.mdat"
)
sha512sums=(
    '888d9970469770084fc64bb57410d179c90b0776df5ea7224679cee3075662de43a8b339ce730f59e12eb8b5ce2d2e171c2020b2a5a0f5881de2cbea2b4f3af9' 
    '79214c2c9e35dc2dfbc926b37c058ed8a67edc156823c25b353492379aa542534997b0ca94676921252d6152bfe4fb1196c7c6df16645f14ce9ffbd8e9859770'
)

package() {
  export INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/default

  sh REW_linux_no_jre_${pkgver//./_}-api.sh -q -dir "$pkgdir/usr/share/java/$pkgname"  -J-Djava.util.prefs.userRoot=$srcdir/java.uprefs -J-Djava.util.prefs.systemRoot=$srcdir/java.sprefs -J-Duser.home=${HOME}

  mkdir -p "$pkgdir/usr/bin" \
           "$pkgdir/usr/share/icons" \
           "$pkgdir/usr/share/licenses/$pkgname" \
           "$pkgdir/usr/share/doc/$pkgname" \
           "$pkgdir/usr/share/applications/$pkgname"


  ln -s "/usr/share/java/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/usr/share/java/$pkgname/${pkgname%-beta}" "$pkgdir/usr/share/java/$pkgname/$pkgname" 
  mv "$pkgdir/usr/share/java/$pkgname/EULA.html" "$pkgdir/usr/share/licenses/$pkgname/"
  cp -L "$pkgdir/usr/share/java/$pkgname/REW.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  rm "$pkgdir/usr/share/java/$pkgname/REW.desktop"

  cp "$pkgdir/usr/share/java/$pkgname/.install4j/roomeqwizard.png" "$pkgdir/usr/share/icons/$pkgname.png"

  #delete unfitting arch libs
  case "$CARCH" in
    x86_64)
	rm "$pkgdir/usr/share/java/$pkgname/bin/libcsjsound_aarch64.so"
	;;
    aarch64)
	rm "$pkgdir/usr/share/java/$pkgname/bin/libcsjsound_amd64.so"
	;;
    *)
        # Commands for other architectures
        ;;
  esac

  cp Sampledata.mdat "$pkgdir/usr/share/doc/$pkgname/"

  # repair
  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/java/$pkgname/.install4j/response.varfile"
  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/java/$pkgname/.install4j/install.prop"
  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  sed "s/REW/Room EQ Wizard beta/g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  sed "s/roomeqwizard-beta\/roomeqwizard/roomeqwizard-beta\/roomeqwizard-beta/" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  echo "Icon=/usr/share/icons/$pkgname.png" >> "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  # fix waterfall crash
  # https://www.avnirvana.com/threads/rew-for-linux-waterfall-drawing-problem.2956/
  sed "s/^-Dsun.java2d.opengl=.*$/-Dsun.java2d.opengl=True/" -i "$pkgdir/usr/share/java/$pkgname/${pkgname%-beta}.vmoptions"

  # basic cleanup
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/files.log"
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/installation.log"
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/uninstall.png"
  rm -f $pkgdir/usr/share/java/$pkgname/.install4j/*.desktop
  rm -rf "$pkgdir/usr/share/java/$pkgname/uninstall"
}
