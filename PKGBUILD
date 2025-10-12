# Maintainer: Arthurmeade12 <s728c3ilp at relay dot firefox dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: ml <>

pkgname=alda
pkgver=2.3.3
pkgrel=1
pkgdesc='A music programming language for musicians'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL-2.0')
depends=('java-runtime>=8')
provides=('alda')
conflicts=('alda-bin') 
# If it ever appears on the AUR (it was not on the AUR as of 6/25/25), Alda also conflicts with IcedTea (https://openjdk.org/projects/icedtea/). See https://github.com/alda-lang/alda/blob/master/doc/troubleshooting.md#icedtea-related-issues for more.
makedepends=('go')
source=("$pkgname-release-$pkgver.tar.gz::https://codeload.github.com/$pkgname-lang/$pkgname/tar.gz/refs/tags/release-$pkgver"
  alda-player )
b2sums=('e81a2df8192fb94ac620097a42a57a8e77d9d6ea6771e10fb80e26ebea0f4a031cce2f883a164848ced1635d74e300239cca3c3380eddca246a182a65288e4eb'
  '5d6bdd39c1178fd5504a308d95606a82bae781159128e3c5d79c989a253871b36f92123410479d8734df2dbf335ccab2f194d99503fddb76f9e86bb0ed8acee4')

build() {
  cd "$pkgname"-release-"$pkgver"
  ( # Go build for Client
    cd client
    CGO_ENABLED=0 # The alda repository appears to use go everything afaik, so disabling this should have no effect other than making sure that irrelevant compiler flags for C and C++ are ignored (e.g. CGO_CXXFLAGS)

    export GOFLAGS="-buildmode=pie -modcacherw -trimpath -ldflags=-w"
    go generate
    go build -o "target/$pkgname" # main.go
  )
  ( # Gradle (Java) build for player (server)
    cd player
    # I have used `gradle` from the system in the past, but that gradle is too new
    ./gradlew --no-daemon --parallel --no-build-cache build
  )
}

package() {
  install -Dv alda-player -t "$pkgdir/usr/bin/"

  cd "$pkgname"-release-"$pkgver"
  install -Dv "client/target/$pkgname" -t "$pkgdir/usr/bin/" # installed as 755
  # By default, the alda package has a shell script that self-executes and becomes a jar, but, to be more arch-centric, we install the jar separately into its proper place
  install -Dvm644 player/build/libs/alda-player-fat.jar -T "$pkgdir/usr/share/java/alda/alda-player.jar"

  mkdir -p "$pkgdir/usr/share/doc/$pkgname/doc_zh_cn"
  install -Dvm644 doc/doc_zh_cn/* "$pkgdir/usr/share/doc/$pkgname/doc_zh_cn/"
  rm -r doc/doc_zh_cn # The chinese translation folder gave me major headaches because `install` couldn't handle a dir

  install -Dvm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"

}
