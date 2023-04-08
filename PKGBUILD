

# Maintainer: Opty <opty@hotmail.fr>

pkgname=jrommanager
_gitname=JRomManager
_gitver=3.0.0-beta.6
pkgver=3.0.0
pkgrel=2
pkgdesc='A Rom Manager entirely written in Java and released under GPL v2'
arch=('any')
license=('GPL2')
url="https://github.com/optyfr/JRomManager"
makedepends=('java-environment=17' 'git')
options=(!strip)
source=("git+https://github.com/optyfr/${_gitname}#tag=${_gitver}"
  "${_gitname}.desktop" 
  "${_gitname}.png"
  "${_gitname}.sh")

prepare() {
  cd $srcdir/$_gitname
  git submodule update --init --recursive
}

build() {
  cd $srcdir/$_gitname
  LC_ALL="$(localectl list-locales | grep -1 utf8)" JAVA_HOME=/usr/lib/jvm/java-17-openjdk sh ./gradlew jlink -xtest
}

package() {
  cd $srcdir/$_gitname/build/image/JRomManager-linux-x64

  mkdir -p "$pkgdir/usr/share/java/$pkgname/"
  cp -dr --preserve=mode {bin,conf,legal,lib} "$pkgdir/usr/share/java/$pkgname/"

  install -Dm755 $srcdir/$_gitname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $srcdir/$_gitname.desktop "$pkgdir/usr/share/applications/$_gitname.desktop"
  install -Dm644 $srcdir/$_gitname.png "$pkgdir/usr/share/pixmaps/$_gitname.png"
}

sha256sums=('SKIP'
            '070fc15f00ba27398e049f7c5753588a9907e3d92e5cbd8158ee66bff3ff7b0d'
            '247df543bd5d6f711952bf2903b074ed89f9b1df2fa4ec318b3e61ad270ae3b5'
            '0245784a0bbf07d9190108282a091564f1aa7dfbdffb8d3b8282760e833d2356')
