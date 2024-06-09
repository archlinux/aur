# Maintainer:
# Contributor: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>

_pkgname="mindustry"
pkgbase="$_pkgname"
pkgver="7.0.146"
pkgrel=3
pkgdesc="A sandbox tower defense game"
url="https://github.com/Anuken/Mindustry"
license=('GPL-3.0-only')
arch=('any')

makedepends=(
  'alsa-lib'
  'archlinux-java-run'
  'java-environment=17'
  'libicns'
)

_build="${pkgver##*.}"
_pkgsrc="Mindustry-$_build"
_pkgsrc_arc="Arc-$_build"
_pkgext="tar.gz"
source=(
  "$_pkgname-$_build.$_pkgext"::"$url/archive/v$_build.$_pkgext"
  "$_pkgname-arc-$_build.$_pkgext"::"https://github.com/Anuken/Arc/archive/refs/tags/v$_build.$_pkgext"
)
sha256sums=(
  'aa1684d87d9f3e1d1a2da415b5e055ea6493fe31398748447927bd903019adbd'
  '30cc1b00968aaec8dbb76a2dad6439c7d7418970fafe24c350b2be4e68c3e5d6'
)

prepare() {
  cp -rl "$_pkgsrc_arc" Arc
  cd "$_pkgsrc"
  sed -E -e '/archash/s&archash=.*$&archash=8d5651a6adebd8c04be146d9a4a95f237ecf57b2&' -i gradle.properties
}

build() {
  cd "$_pkgsrc"

  # skip android subproject
  # <https://github.com/Anuken/Mindustry/blob/00e3a59463f41bdce5b12cf5b4715a253f7af306/settings.gradle#L14>
  unset ANDROID_HOME

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

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=$(sed -E -e "s/-/ /g;s/\b(.)/\u\1/g" <<< "$pkgname")
Comment=$pkgdesc
Exec=$pkgname
Icon=$pkgname
Categories=Game;
Terminal=false
END

  cd "Mindustry-${_build}"
  local icon_size
  for icon_size in 256 512 1024; do
    install -Dm644 "core/assets/icons/icon_${icon_size}x${icon_size}x32.png" \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/$pkgname.png"
  done
}

_package_mindustry() {
  install -Dm755 "desktop/build/libs/Mindustry.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << END
#!/usr/bin/env sh
exec /usr/bin/java -jar /usr/share/java/$_pkgname/$_pkgname.jar "\$@"
END
}

_package_mindustry-server() {
  pkgdesc+=" - server"

  install -Dm755 "server/build/libs/server-release.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname-server.jar"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << END
#!/usr/bin/env sh
exec /usr/bin/java -jar /usr/share/java/$_pkgname/$_pkgname-server.jar "\$@"
END
}

pkgname=("$_pkgname" "$_pkgname-server")

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_common")
    $(declare -f "_package_$_p")

    _package_common
    _package_$_p
  }"
done
