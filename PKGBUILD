# Maintainer: Arthurmeade12 <ajmeade at proton dot me>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: ml <>
# Last edited October 24th 2026 @Arthurmeade12

pkgname=alda
pkgver=2.4.8
pkgrel=1
pkgdesc='A music programming language for musicians'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL-2.0')
depends=('java-runtime>=8')
provides=('alda')
conflicts=('alda-bin' 'icedtea-web') 
makedepends=('go')
source=("$pkgname-release-$pkgver.tar.gz::https://codeload.github.com/$pkgname-lang/$pkgname/tar.gz/refs/tags/release-$pkgver"
  alda-player )
b2sums=('dfe1780c6301e097d64e3b19a485ba1aa16c92bdd5a0f4f255377e09925e2797858576eaa3ba409e8168d5093094ad19799b952d77eb65c8bd04273790ce09d1'
  '5d6bdd39c1178fd5504a308d95606a82bae781159128e3c5d79c989a253871b36f92123410479d8734df2dbf335ccab2f194d99503fddb76f9e86bb0ed8acee4')

build() {

  # The build script in the alda repo builds indiscriminately for macos, windows, and linux for several architectures, and caches certain libraries to speed up future builds (not this use case).
  # Unlike the official build script, this build function is arch-specific and avoids building unnecessary binaries.

  cd "$pkgname"-release-"$pkgver"
  ( # Go build for Client
    cd client
    export CGO_ENABLED=0 # The alda repository appears to use go everything afaik, so disabling this should have no effect other than making sure that irrelevant compiler flags for C and C++ are ignored (e.g. CGO_CXXFLAGS)
    export GOPATH="${srcdir}" # Prevents ~/go from being created
    #export GOARCH="${CARCH}" # For TBD support of 3 more arches when I'm not sleepy
    #[[ "${CARCH}" == 'armv7h' ]] && export GOARM='7' # For tbd support of armv7h
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

  # By default, the alda package has a shell script that self-executes and becomes a jar, but, to be more arch-centric, we install the jar separately into its proper place
  # https://wiki.archlinux.org/title/Java_package_guidelines#Java_packaging_on_Arch_Linux

  install -Dv alda-player -t "$pkgdir/usr/bin/"

  cd "$pkgname"-release-"$pkgver"
  install -Dv "client/target/$pkgname" -t "$pkgdir/usr/bin/" # installed as 755

  install -Dvm644 player/build/libs/alda-player-fat.jar -T "$pkgdir/usr/share/java/alda/alda-player.jar"

  mkdir -p "$pkgdir/usr/share/doc/$pkgname/doc_zh_cn"
  install -Dvm644 doc/doc_zh_cn/* "$pkgdir/usr/share/doc/$pkgname/doc_zh_cn/"
  rm -r doc/doc_zh_cn # The chinese translation folder caused me major headaches because `install` couldn't handle a dir within a dir (zh_cn/ within doc/)

  install -Dvm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"

}
