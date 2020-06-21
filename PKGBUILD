

# Maintainer: Opty <opty@hotmail.fr>

pkgname=jrommanager
_gitname=JRomManager
pkgver=2.4.1
pkgrel=1
pkgdesc='A Rom Manager entirely written in Java and released under GPL v2'
arch=('any')
license=('GPL2')
url="https://github.com/optyfr/JRomManager"
depends=('java-runtime>=8')
makedepends=('java-environment=8')
options=(!strip)
source=("git+https://github.com/optyfr/${_gitname}#tag=${pkgver}"
  "${_gitname}.desktop" 
  "${_gitname}.png"
  "${_gitname}.sh")
sha256sums=('SKIP'
            '070fc15f00ba27398e049f7c5753588a9907e3d92e5cbd8158ee66bff3ff7b0d'
            '247df543bd5d6f711952bf2903b074ed89f9b1df2fa4ec318b3e61ad270ae3b5'
            '3395aa7b9c51f15d81e4f3795536b45434ace01ba17b60c5207f71ab0436f413')

prepare() {
  cd $srcdir/$_gitname
  git submodule update --init --recursive
}

build() {
  cd $srcdir/$_gitname
  LC_ALL="$(localectl list-locales | grep -1 utf8)" sh ./gradlew build
}

package() {
  cd $srcdir/$_gitname/build/distributions

  mkdir -p $_gitname-ext
  bsdtar -xf $_gitname-$pkgver-install.jar
  bsdtar -xf $_gitname-$pkgver.zip -C $_gitname-ext
  cd $_gitname-ext

  mkdir -p "$pkgdir/usr/share/java/$pkgname/lib/"
  install -Dm755 *.sh "$pkgdir/usr/share/java/$pkgname/"
  install -Dm644 *.jar "$pkgdir/usr/share/java/$pkgname/"
  install -Dm644 lib/*.jar "$pkgdir/usr/share/java/$pkgname/lib/"
  cp -dr --preserve=mode {webclient,wrapper} "$pkgdir/usr/share/java/$pkgname/"
  install -Dm755 $srcdir/$_gitname.sh "$pkgdir/usr/bin/$pkgname"

  install -Dm644 $srcdir/$_gitname.desktop "$pkgdir/usr/share/applications/$_gitname.desktop"
  install -Dm644 $srcdir/$_gitname.png "$pkgdir/usr/share/pixmaps/$_gitname.png"
}
