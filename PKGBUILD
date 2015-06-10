# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=pixel-dungeon
pkgname=${_pkgname}-git
_pkgver=1.7.2a
pkgver=1.7.2a.125
pkgrel=2
pkgdesc="A rogue-like game inspired by Brogue"
url="http://pixeldungeon.watabou.ru"
license=('GPL3')
depends=('java-runtime' 'bash')
makedepends=('git' 'java-environment')
arch=('any')
source=("$_pkgname::git+https://github.com/Arcnor/pixel-dungeon-gdx.git"
        "$_pkgname.sh"
        "$_pkgname.desktop"
        "no-encryption.patch"
        "level-change-save.patch")
sha512sums=('SKIP'
            'ab43ee17312fbb28daf456f569e9a9ac8c60a22faea500959f8d82794ef3d0a78e21056136742e281f024256bae01e59810c8ced96d9c9fde9abe9ccdb1ed9b6'
            '74c30ef63fec229f199dc9ad1758dab8cdd6484198e143b9defb1a91f52381a8eafd3a2563b3bbc78d97fab306b96fabcfd19ec112616d49c03b5bacc6c3b4a5'
            '93293f1051cdb5860f22c4c952019f04b0ec41e873f9313bd1d0a15a90defce360779ff75d239d0ceb07ce1a2320b2234473ba9cd95f6269e1568bf173b2b0f9'
            '8ad6bf714477e6cc00deb80967ebba332acd4a9ee1a9ba202ef887b07031ec3bd73603a8f7d6584313ac5e4c86da052b94db0e979524c1f8f17f0b49e0a4ea41')

pkgver() {
  cd $_pkgname
  printf '%s' "$_pkgver.$(git rev-list --count HEAD)"
}

prepare() {
  cd $_pkgname
  patch -p1 < ../no-encryption.patch
  patch -p1 < ../level-change-save.patch
}

build() {
  cd $_pkgname
  unset _JAVA_OPTIONS
  GRADLE_USER_HOME="$srcdir" ./gradlew desktop:dist
}

package() {
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname/android/res/drawable-xxxhdpi/ic_launcher.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 $_pkgname/desktop/build/libs/desktop-*.jar "$pkgdir/usr/share/$_pkgname/$_pkgname.jar"
}
