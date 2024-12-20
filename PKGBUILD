# Maintainer:
# Contributor: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>

_pkgname="mindustry"
pkgbase="$_pkgname"
pkgver="146"
pkgrel=1
pkgdesc="A sandbox tower defense game"
url="https://github.com/Anuken/Mindustry"
license=('GPL-3.0-only')
arch=('any')

makedepends=(
  'alsa-lib'
  'archlinux-java-run' # AUR
  'java-environment=17'
  'libicns'
)

_build="${pkgver##.r*}"
_pkgsrc="Mindustry-$_build"
_pkgsrc_arc="Arc-$_build"
_pkgext="tar.gz"
source=(
  "$_pkgname-$_build.$_pkgext"::"https://github.com/Anuken/Mindustry/archive/v$_build.$_pkgext"
  "$_pkgname-arc-$_build.$_pkgext"::"https://github.com/Anuken/Arc/archive/refs/tags/v$_build.$_pkgext"
)
sha256sums=(
  'aa1684d87d9f3e1d1a2da415b5e055ea6493fe31398748447927bd903019adbd'
  '30cc1b00968aaec8dbb76a2dad6439c7d7418970fafe24c350b2be4e68c3e5d6'
)

prepare() {
  ln -sf "$_pkgsrc_arc" Arc

  cd "$_pkgsrc"
  sed -E -e '/archash/s&archash=.*$&archash='v${_build}'&' -i gradle.properties
}

build() {
  cd "$_pkgsrc"

  # skip android subproject; see settings.gradle
  unset ANDROID_HOME JITPACK

  JAVA_HOME=$(archlinux-java-run --min 17 --max 17 --feature jdk --java-home) \
    ./gradlew --no-daemon dist -Pbuildversion="${_build}" desktop:dist server:dist

  cd core/assets/icons
  icns2png --extract icon.icns
}

_package_common() {
  depends+=(
    'hicolor-icon-theme'
    'java-runtime'
  )

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/${pkgname#$_pkgtype}.desktop" << END
[Desktop Entry]
Type=Application
Name=$(sed -E -e "s/-/ /g;s/\b(.)/\u\1/g" <<< "${pkgname#$_pkgtype}")
Comment=$pkgdesc
Exec=${pkgname#$_pkgtype}
Icon=${pkgname#$_pkgtype}
Categories=Game;
Terminal=false
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/${pkgname#$_pkgtype}" << END
#!/usr/bin/env sh
exec /usr/bin/java -jar /usr/share/java/$_pkgname/${pkgname#$_pkgtype}.jar "\$@"
END

  cd "$_pkgsrc"
  local icon_size
  for icon_size in 256 512 1024; do
    install -Dm644 "core/assets/icons/icon_${icon_size}x${icon_size}x32.png" \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${pkgname#$_pkgtype}.png"
  done
}

_package_mindustry() {
  install -Dm755 "desktop/build/libs/Mindustry.jar" "$pkgdir/usr/share/java/$_pkgname/${pkgname#$_pkgtype}.jar"
}

_package_mindustry-server() {
  pkgdesc+=" - server"

  install -Dm755 "server/build/libs/server-release.jar" "$pkgdir/usr/share/java/$_pkgname/${pkgname#$_pkgtype}.jar"
}

pkgname=("$_pkgname${_pkgtype:-}" "$_pkgname-server${_pkgtype:-}")

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_common" | tail -n +2)
    $(declare -f "_package_${_p#$_pkgtype}" | tail -n +2)
  }"
done
