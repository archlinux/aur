# Maintainer: 0x715C

pkgname=alda-git
_pkgname=alda
pkgver=2.1.0.r1.ge0fc6be
pkgrel=1
pkgdesc='A music programming language for musicians. 🎶'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('custom:EPL2')
provides=('alda')
conflicts=('alda')
depends=('java-environment>=8')
makedepends=('fakeroot' 'binutils' 'git' 'go' 'java-environment>=8')
source=('git+https://github.com/alda-lang/alda')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/release.//'
}

build() {
  #Build alda client
  cd "$srcdir/$_pkgname/client"
  go generate
  go build -trimpath -o ../bin/alda alda.io/client
  cd ..

  #Build alda-player
  fat_jar="build/libs/alda-player-fat.jar"
  jvm_opts="-XX:+UseG1GC -XX:MaxGCPauseMillis=100 -Xmx1024m -Xms256m -DlogPath=tmplog"
  cd "player"
  ./gradlew -q -g . build
  cat \
    <(echo -e "#!/bin/sh\n\nexec java $jvm_opts -jar \$0 \"\$@\"\n\n\n") \
    "$fat_jar" \
    > ../bin/alda-player
}

package() {
  cd "${srcdir}/${_pkgname}/bin"
  install -Dm755 alda "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 alda-player "${pkgdir}/usr/bin/${_pkgname}-player"
  cd "${srcdir}/${_pkgname}"
  install -Dm444 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
