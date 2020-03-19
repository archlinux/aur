# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Thanks: Peter Cai <peter at typeblog dot net>

_pkgname=shattered-pixel-dungeon
pkgname=$_pkgname-git
pkgver=283v0.7.5f
pkgrel=2
pkgdesc='Shattered fork of the popular rogue-like game'
url='http://shatteredpixel.tumblr.com'
license=('GPL3')
depends=('jre8-openjdk' 'bash')
makedepends=('git' 'gradle' 'jdk8-openjdk')
arch=('any')

source=(
  "$_pkgname::git+https://github.com/00-Evan/$_pkgname-gdx.git"
  "$_pkgname.sh"
  "$_pkgname.desktop"
)

sha512sums=(
  'SKIP'
  '88814d1f33eea6bd5656d3ca731ed5a6cfce10ecdae24012252c5b32c4b194ec75fb0e22cac70897802679086c6a32e210d52933ec45ca94ff350ac4ad7c266e'
  '204a7bcedbbc14bdad6586e4b759b326191a7fd2c344dadc7032495d4caa5fe32edac4118d7294229a6fe24f6684416fff37e260bbc9dde9e50846a03ba77db8'
)

pkgver() {
  cd $_pkgname
  printf '%s' "$(git rev-list --count HEAD)$(git log | grep -e '^v[0-9]' desktop/VersionInfo.txt | head -n 1)"
}

prepare() {
  # Hack to use system gradle (thanks to the shattered-pixel-dungeon package and by proxy @jonathon on AUR)
  sed -i '164c/usr/bin/gradle "$@"' "$_pkgname/gradlew"
}

build() {
  cd $_pkgname
  unset _JAVA_OPTIONS
  # Force the system to build the package using JDK8 (thanks to the shattered-pixel-dungeon package)
  export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
  GRADLE_USER_HOME="$srcdir" ./gradlew desktop:dist
}

package() {
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname/android/res/drawable-xxxhdpi/ic_launcher.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 $_pkgname/desktop/build/libs/desktop-*.jar "$pkgdir/usr/share/$_pkgname/$_pkgname.jar"
}
