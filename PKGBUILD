# Maintainer:
# Contributor: copygirl <copygirl@mcft.net>

: ${_java_ver:=17}

_pkgname="mindustry"
pkgbase="$_pkgname-git"
pkgver=152.r2.gf8d86ac
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
  'git'
  'libicns'
)

_build="${pkgver%%.r*}"
_pkgsrc="$_pkgname"
_pkgsrc_arc="$_pkgname-arc"
source=(
  "$_pkgsrc"::"git+https://github.com/Anuken/Mindustry.git"
  "$_pkgsrc_arc"::"git+https://github.com/Anuken/Arc.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  ln -sf "$_pkgsrc_arc" Arc
}

build() {
  cd "$_pkgsrc"

  # skip android subproject; see settings.gradle
  unset ANDROID_HOME JITPACK

  JAVA_HOME="/usr/lib/jvm/java-${_java_ver}-openjdk" \
    ./gradlew --warning-mode=all --no-daemon dist -Pbuildversion="${_build}" desktop:dist server:dist

  cd core/assets/icons
  icns2png --extract icon.icns
}

_package_common() {
  depends+=(
    'hicolor-icon-theme'
    'java-runtime'
  )

  provides=("${pkgname%$_pkgtype}")
  conflicts=("${pkgname%$_pkgtype}")

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
    install -Dm644 "core/assets/icons/icon_${icon_size}x${icon_size}x32.png" \
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
