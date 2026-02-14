# PKGBUILD based on  https://aur.archlinux.org/mindustry-git.git
# Maintainer:
# Contributor: acutenoob <handsome23388@outlook.com>
# Contributor: copygirl <copygirl@mcft.net>

: ${_java_ver:=17}

_pkgname="mindustryx"
pkgbase="$_pkgname-git"
pkgver=2026.02.X27.r7.gabde1c6
pkgrel=1
pkgdesc="Optimized mindustry server&client with more API"
url="https://github.com/TinyLake/MindustryX"
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
source=(
  "$_pkgsrc"::"git+https://github.com/TinyLake/MindustryX.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}
prepare()
{
  cd "$_pkgsrc"


  git submodule update --init --depth=10

  cd work
  git config user.email "build@example.com"
  git config user.name "Build User"
  cd ..

  cd Arc
  git config user.email "build@example.com"
  git config user.name "Build User"
  cd ..

  ./scripts/applyPatches.sh

  # skip android subproject; see settings.gradle
  unset ANDROID_HOME JITPACK
}
build() {
  cd "$_pkgsrc/work"


  ./gradlew clean
    JAVA_HOME="/usr/lib/jvm/java-${_java_ver}-openjdk"\
  ./gradlew  -Pbuildversion="${_build}" --parallel  desktop:dist server:dist

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
  install -Dm644 "assets/icon.png" \
  "$pkgdir/usr/share/icons/hicolor/64x64/apps/${pkgname%$_pkgtype}.png"
}

_package_mindustryx() {
  install -Dm755 "work/desktop/build/libs/Mindustry.jar" "$pkgdir/usr/share/java/$_pkgname/${pkgname%$_pkgtype}.jar"
}

_package_mindustryx-server() {
  pkgdesc+=" - server"

  install -Dm755 "work/server/build/libs/server-release.jar" "$pkgdir/usr/share/java/$_pkgname/${pkgname%$_pkgtype}.jar"
}

_pkgtype=${pkgbase#$_pkgname}
pkgname=("$_pkgname${_pkgtype:-}" "$_pkgname-server${_pkgtype:-}")

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_common" | tail -n +2)
    $(declare -f "_package_${_p%$_pkgtype}" | tail -n +2)
  }"
done
