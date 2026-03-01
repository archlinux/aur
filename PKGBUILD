# Maintainer:hzyry2046 <hzyry2046@163.com>
# Contributor: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>

: ${_java_ver:=17}

_pkgname="mindustry"
pkgbase="$_pkgname-sdl3"
pkgver=155.4
pkgrel=2
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
  '0001-remove-borderless-fullscreen.patch'::'https://github.com/Anuken/Mindustry/commit/a6b29b854cd58957b5be1e8f2740073efbc9ac19.patch'
  '0002-revert-sdl2.patch'::'https://github.com/Anuken/Mindustry/commit/88e487303de535fc988f5efa54bcb16222963d5f.patch'
  '0003-proper-backend.patch'::'https://github.com/Anuken/Mindustry/commit/48d3fa1c11e97816084d77b0ba15322dbeab4432.patch'
)
sha256sums=('013d2f06b03b762661ee800de2b9ffff0351932ddc55db64cdb718caf99f97c7'
            '28f4681e079307a32bf588041b61793953a54d674c2d640372f2a508b29fc62a'
            '779424366e69ec40a82cd6097f7ed756ecf741d2ef9ce413515e5ac461272bd4'
            'cc7b3ccda6a05b0b459fae4794a60cfa2a66d4aa6b6cda876aa2595ac56eda1c'
            '715f7912d531679fcc046ddba3604d77f062a01dd99a4ad943ec1fc6a9d2fa1e')

prepare() {
  ln -sf "$_pkgsrc_arc" Arc

  cd "$_pkgsrc"
  sed -E -e '/archash/s&archash=.*$&'"archash=v${_build}&" -i gradle.properties

  patch -Np1 < ../0001-remove-borderless-fullscreen.patch
  patch -Np1 < ../0002-revert-sdl2.patch
  patch -Np1 < ../0003-proper-backend.patch
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
    "java-runtime>=$_java_ver"
    'hicolor-icon-theme'
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

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << END
#!/usr/bin/env sh
exec /usr/bin/java -jar /usr/share/java/$pkgbase/$pkgname.jar "\$@"
END

  cd "$_pkgsrc"
  local icon_size
  for icon_size in 256 512 1024; do
    install -Dm644 "icon_${icon_size}x${icon_size}x32.png" \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/$pkgname.png"
  done
}

_package_mindustry() {
  install=mindustry-sdl3.install

  install -Dm755 "desktop/build/libs/Mindustry.jar" "$pkgdir/usr/share/java/$pkgbase/$pkgname.jar"
}

_package_mindustry-server() {
  pkgdesc+=" - server"

  install -Dm755 "server/build/libs/server-release.jar" "$pkgdir/usr/share/java/$pkgbase/$pkgname.jar"
}

_pkgtype=${pkgbase#$_pkgname}
pkgname=("$_pkgname${_pkgtype:-}" "$_pkgname-server${_pkgtype:-}")

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_common" | tail -n +2)
    $(declare -f "_package_${_p%$_pkgtype}" | tail -n +2)
  }"
done
