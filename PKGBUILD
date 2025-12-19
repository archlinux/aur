# Maintainer:
# Contributor: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>

: ${_java_ver:=17}

_pkgname="mindustry"
pkgbase="$_pkgname"
pkgver=154.2
pkgrel=1
pkgdesc="A sandbox tower defense game"
url="https://github.com/Anuken/Mindustry"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'alsa-lib'
)
makedepends=(
  "java-environment=${_java_ver:?}"
  'libicns'
)

_build="${pkgver%%.r*}"
_pkgsrc="Mindustry-$_build"
_pkgsrc_arc="Arc-$_build"
_pkgext="tar.gz"
source=(
  "$_pkgname-$_build.$_pkgext"::"https://github.com/Anuken/Mindustry/archive/v$_build.$_pkgext"
  "$_pkgname-arc-$_build.$_pkgext"::"https://github.com/Anuken/Arc/archive/refs/tags/v$_build.$_pkgext"
)
sha256sums=(
  '565f9b134dd726854905b2327ad76eb8b3845a6cee917fc88a35a5def88f0b7a'
  'f01d0a0a60bbaaeb74190055e2a019c652791978a18686edfde6ab47c382fc82'
)

prepare() {
  ln -sf "$_pkgsrc_arc" Arc

  cd "$_pkgsrc"
  sed -E -e '/archash/s&archash=.*$&'"archash=v${_build}&" -i gradle.properties
}

build() {
  cd "$_pkgsrc"

  # skip android subproject; see settings.gradle
  unset ANDROID_HOME JITPACK

  JAVA_HOME="/usr/lib/jvm/java-${_java_ver}-openjdk" \
    ./gradlew --warning-mode=all --no-daemon dist -Pbuildversion="${_build}" desktop:dist server:dist

  icns2png --extract core/assets/icons/icon.icns
}

_package_common() {
  depends+=(
    'hicolor-icon-theme'
    'java-runtime'
  )

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/${pkgname%$_pkgtype}.desktop" << END
[Desktop Entry]
Type=Application
Name=$(sed -E -e "s/-/ /g;s/\b(.)/\u\1/g" <<< "${pkgname%$_pkgtype}")
Comment=$pkgdesc
Exec=${pkgname%$_pkgtype}
Icon=${pkgname%$_pkgtype}
Categories=Game;
Terminal=false
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/${pkgname%$_pkgtype}" << END
#!/usr/bin/env sh
exec /usr/bin/java -jar /usr/share/java/$_pkgname/${pkgname%$_pkgtype}.jar "\$@"
END

  cd "$_pkgsrc"
  local icon_size
  for icon_size in 256 512 1024; do
    install -Dm644 "icon_${icon_size}x${icon_size}x32.png" \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${pkgname%$_pkgtype}.png"
  done
}

_package_mindustry() {
  install -Dm755 "desktop/build/libs/Mindustry.jar" "$pkgdir/usr/share/java/$_pkgname/${pkgname%$_pkgtype}.jar"
}

_package_mindustry-server() {
  pkgdesc+=" - server"

  install -Dm755 "server/build/libs/server-release.jar" "$pkgdir/usr/share/java/$_pkgname/${pkgname%$_pkgtype}.jar"
}

_pkgtype=${pkgbase#$_pkgname}
pkgname=("$_pkgname${_pkgtype:-}" "$_pkgname-server${_pkgtype:-}")

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_common" | tail -n +2)
    $(declare -f "_package_${_p%$_pkgtype}" | tail -n +2)
  }"
done
