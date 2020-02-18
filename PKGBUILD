# Maintainer: Adler Neves <adlerosn@gmail.com>

provides=('anime4k')
conflicts=('anime4k')
pkgver=r179.2a7a486
pkgname=anime4k-git
pkgrel=1
pkgdesc="A High-Quality Real Time Upscaler for Anime Video"
arch=('any')
depends=('java-runtime>=12' 'xdg-utils')
makedepends=('java-environment>=12' 'maven' 'go-md2man')
url="https://github.com/bloc97/Anime4K#anime4k"
options=()
license=('MIT')
source=('anime4k::git+https://github.com/bloc97/Anime4K')
sha512sums=('SKIP')

pkgver() {
  cd anime4k
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  mkdir -p script
  echo "#!/bin/bash" > script/anime4k
  echo "/usr/lib/jvm/java-13-openjdk/bin/java -jar /usr/share/java/anime4k/Anime4K.jar \"\$@\"" >> script/anime4k
  echo "#!/bin/bash" > script/anime4k-web
  echo "xdg-open file:///usr/share/webapps/anime4k/index.html" >> script/anime4k-web
  go-md2man -in anime4k/Java_Instructions.md -out java.man
  go-md2man -in anime4k/GLSL_Instructions.md -out glsl.man
  go-md2man -in anime4k/HLSL_Instructions.md -out hlsl.man
}

build() {
  cd "${srcdir}"
  cd anime4k/java
  JAVA_HOME=/usr/lib/jvm/java-13-openjdk bash build.sh
  cd ../..
}

package() {
  cd "${pkgdir}"
  install -d "${pkgdir}"/usr/share/java/anime4k
  install -d "${pkgdir}"/usr/share/webapps/anime4k
  install -d "${pkgdir}"/usr/share/anime4k
  install -d "${pkgdir}"/usr/share/anime4k/glsl
  install -d "${pkgdir}"/usr/share/anime4k/hlsl
  install -d "${pkgdir}"/usr/share/man/man1
  install -d "${pkgdir}"/usr/bin
  install "${srcdir}"/script/anime4k -m 755 "${pkgdir}"/usr/bin
  install "${srcdir}"/script/anime4k-web -m 755 "${pkgdir}"/usr/bin
  install "${srcdir}"/java.man -m 644 "${pkgdir}"/usr/share/man/man1/anime4k.1
  install "${srcdir}"/glsl.man -m 644 "${pkgdir}"/usr/share/man/man1/anime4k-glsl.1
  install "${srcdir}"/hlsl.man -m 644 "${pkgdir}"/usr/share/man/man1/anime4k-hlsl.1
  install "${srcdir}"/anime4k/java/Anime4K.jar -m 755 "${pkgdir}"/usr/share/java/anime4k
  cp -rf "${srcdir}"/anime4k/web/. "${pkgdir}"/usr/share/webapps/anime4k/.
  rm "${pkgdir}"/usr/share/webapps/anime4k/input.png  # removing copyrighted material
  cp -rf "${srcdir}"/anime4k/glsl/. "${pkgdir}"/usr/share/anime4k/.
  cp -rf "${srcdir}"/anime4k/hlsl/. "${pkgdir}"/usr/share/anime4k/.
  cp -rf "${srcdir}"/anime4k/glsl/. "${pkgdir}"/usr/share/anime4k/glsl/.
  cp -rf "${srcdir}"/anime4k/hlsl/. "${pkgdir}"/usr/share/anime4k/hlsl/.
}
