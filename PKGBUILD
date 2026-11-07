# Maintainer:hzyry2046 <hzyry2046@163.com>
# Contributor: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>

: ${_java_ver:=17}

_pkgname="mindustry"
pkgbase="mindustry-sdl3-bin"
pkgname="mindustry-sdl3-bin"
pkgver=160.7
pkgrel=1
pkgdesc="SDL3 backend version of Mindustry."
url="https://github.com/Anuken/Mindustry"
license=('GPL-3.0-only')
arch=('any')
options=(!debug)

depends=(
  'alsa-lib'
)
makedepends=(
  "jdk${_java_ver}-openjdk"
  'libicns'
)

_build="${pkgver%%.r*}"
_pkgsrc="Mindustry-$_build"
_pkgsrc_arc="Arc-$_build"
_pkgext="tar.gz"
source=(
  "$_pkgname-$_build.$_pkgext"::"https://github.com/Anuken/Mindustry/archive/v$_build.$_pkgext"
  "$_pkgname-arc-$_build.$_pkgext"::"https://github.com/Anuken/Arc/archive/refs/tags/v$_build.$_pkgext"
  '0001-mindustry-use-sdl3-backend.patch'
  '0002-arc-sdl3-preserve-wheel-delta.patch'
)
sha256sums=('f86e7af47073a63e338ba53f8aaed1c2431b1e324f6f32c3da2c6e9bb8c03a9e'
            '483888f05cc8bb2790d14029dd77854ee73a5d1636b773f299df8d7754207a07'
            '61959e61bd689970d56ca34d67d44a045bb56a1586fcfafa5f143aed889fa013'
            'bb05ef13b95043139864ee689daa1e3972dd780cde8c23525ba19fb73b0ec215')

prepare() {
  ln -sf "$_pkgsrc_arc" Arc

  cd "$_pkgsrc"
  sed -E -e '/archash/s&archash=.*$&'"archash=v${_build}&" -i gradle.properties

  # LWJGL publishes -SNAPSHOT artifacts only to maven.lwjgl.org (unreachable);
  # use the released 3.4.2, which Maven Central hosts (jars + natives).
  sed -i 's/versions.lwjgl = "3.4.2-SNAPSHOT"/versions.lwjgl = "3.4.2"/' "$srcdir/$_pkgsrc_arc/build.gradle"

  patch -Np1 <../0001-mindustry-use-sdl3-backend.patch

  cd "$srcdir/$_pkgsrc_arc"
  patch -Np1 <../0002-arc-sdl3-preserve-wheel-delta.patch
}

build() {
  cd "$_pkgsrc"

  # skip android subproject; see settings.gradle
  unset ANDROID_HOME JITPACK

  JAVA_HOME="/usr/lib/jvm/java-${_java_ver}-openjdk" \
    ./gradlew --warning-mode=all --no-daemon dist -Pbuildversion="${_build}" desktop:dist

  icns2png --extract core/assets/icons/icon.icns
}

package() {
  depends+=(
    "java-runtime>=$_java_ver"
    'hicolor-icon-theme'
  )

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<END
[Desktop Entry]
Type=Application
Name=$(sed -E -e "s/-/ /g;s/\b(.)/\u\1/g" <<<"$pkgname")
Comment=$pkgdesc
Exec=$pkgname
Icon=$pkgname
Categories=Game;
Terminal=false
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/usr/bin/env sh
exec /usr/bin/java -jar /usr/share/java/$pkgname/$pkgname.jar "\$@"
END

  cd "$_pkgsrc"
  local icon_size
  for icon_size in 256 512 1024; do
    install -Dm644 "icon_${icon_size}x${icon_size}x32.png" \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/$pkgname.png"
  done

  # .install file is a tracked file in the repo root (srcdir/..); makepkg extracts sources into $srcdir
  install -Dm644 "$srcdir/../mindustry-sdl3.install" "$pkgdir/etc/pacman.d/mindustry-sdl3.install"

  install -Dm755 "desktop/build/libs/Mindustry.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
}
