pkgname=go-cross
pkgver=1.6
pkgrel=1
pkgdesc='Compiler and tools for the Go programming language from Google (with cgo support for Windows, Android, Mac OS  X and Linux)'
arch=('x86_64')
url='http://golang.org/doc/install/source#environment'
license=('BSD')
makedepends=('inetutils' 'git' 'go>=1.4')
options=('!strip' 'staticlibs')
depends=('mingw-w64-gcc' 'gcc-multilib' 'android-ndk')
conflicts=(go)
provides=(go=1.6)
source=("$pkgname::git+https://github.com/golang/go.git" "osxcross::git+https://github.com/tpoechtrager/osxcross.git" "https://www.dropbox.com/s/yfbesd249w10lpc/MacOSX10.10.sdk.tar.xz" "gowrapper.sh")
noextract=("MacOSX10.10.sdk.tar.xz")
sha256sums=('SKIP' 'SKIP' '631b4144c6bf75bf7a4d480d685a9b5bda10ee8d03dbf0db829391e2ef858789' 'e56410af1a149b4d102399a32ecf68ce1118cd06f21d1d22bc11e0c3ca987627')

build() {
  cd "$srcdir/osxcross"
  ln -sf $srcdir/MacOSX10.10.sdk.tar.xz tarballs/
  yes "" | SDK_VERSION="10.10" OSX_VERSION_MIN=10.6 ./build.sh 
  mv target osx
  
  cd "$srcdir/$pkgname/src"

  export GOROOT="$srcdir/$pkgname"
  export GOBIN="$GOROOT/bin"
  export GOPATH="$srcdir/"
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go
  export CGO_ENABLED=1
  export NDK=/opt/android-ndk
  NDK_PLATFORM=android-21

  $NDK/build/tools/make-standalone-toolchain.sh --toolchain=x86-4.9 --platform=$NDK_PLATFORM --install-dir=$srcdir/ndk-x86
  $NDK/build/tools/make-standalone-toolchain.sh --toolchain=aarch64-linux-android-4.9 --platform=$NDK_PLATFORM --install-dir=$srcdir/ndk-arm64
  $NDK/build/tools/make-standalone-toolchain.sh --toolchain=arm-linux-androideabi-4.9 --platform=$NDK_PLATFORM --install-dir=$srcdir/ndk-arm

  export PATH=$srcdir/osxcross/osx/bin:$srcdir/ndk-x86/bin:$srcdir/ndk-arm64/bin:$srcdir/ndk-arm/bin:/usr/local/sbin:/usr/local/bin:/usr/bin
  export GOOS=darwin
  CC_FOR_TARGET=o64-clang CXX_FOR_TARGET=o64-clang++ GOARCH=amd64 bash make.bash --no-clean
  CC_FOR_TARGET=o32-clang CXX_FOR_TARGET=o32-clang++ GOARCH=386 bash make.bash --no-clea
  export GOOS=android
  CC_FOR_TARGET=i686-linux-android-gcc CXX_FOR_TARGET=i686-linux-android-gcc++ GOARCH=386 bash make.bash --no-clean
  CC_FOR_TARGET=aarch64-linux-android-gcc CXX_FOR_TARGET=aarch64-linux-android-gcc++ GOARCH=arm64 bash make.bash --no-clean
  CC_FOR_TARGET=arm-linux-androideabi-gcc iCXX_FOR_TARGET=arm-linux-androideabi-gcc++ GOARCH=arm GOARM=7 bash make.bash --no-clean
  export GOOS=windows
  CC_FOR_TARGET=i686-w64-mingw32-gcc CXX_FOR_TARGET=i686-w64-mingw32-g++ GOARCH=386 bash make.bash --no-clean  
  CC_FOR_TARGET=x86_64-w64-mingw32-gcc CXX_FOR_TARGET=x86_64-w64-mingw32-g++ GOARCH=amd64 bash make.bash --no-clean
  export GOOS=linux  
  CC_FOR_TARGET="x86_64-unknown-linux-gnu-gcc -m32 -march=i686" CXX_FOR_TARGET="x86_64-unknown-linux-gnu-g++ -m32 -march=i686" GOARCH=386 bash make.bash --no-clean
  CC_FOR_TARGET="x86_64-unknown-linux-gnu-gcc" CXX_FOR_TARGET=x86_64-unknown-linux-gnu-g++ GOOS=linux GOARCH=amd64 bash make.bash --no-clean

  export GOARCH=amd64
  $GOROOT/bin/go get -d golang.org/x/tools/cmd/godoc
  $GOROOT/bin/go build -o $srcdir/godoc golang.org/x/tools/cmd/godoc
  for tool in vet cover callgraph; do
    $GOROOT/bin/go get -d golang.org/x/tools/cmd/${tool}
    $GOROOT/bin/go build -o $GOROOT/pkg/tool/${GOOS}_${GOARCH}/${tool} golang.org/x/tools/cmd/${tool}
  done
}

package() {
  cd "$pkgname"

  export GOROOT="$srcdir/$pkgname"
  export GOBIN="$GOROOT/bin"

  install -Dm755 "$srcdir/godoc" "$pkgdir/usr/bin/godoc"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/go/LICENSE"

  mkdir -p \
    "$pkgdir/"{etc/profile.d,usr/{share/go,lib/go,lib/go/src,lib/go/site/src},/opt/go-cross}

  cp -r $srcdir/ndk-x86 $srcdir/ndk-arm64 $srcdir/ndk-arm $srcdir/osxcross/osx -t $pkgdir/opt/go-cross

  cp -r doc misc -t "$pkgdir/usr/share/go"
  ln -s /usr/share/go/doc "$pkgdir/usr/lib/go/doc"
  cp -a bin "$pkgdir/usr"
  mv "$pkgdir/usr/bin/go" "$pkgdir/usr/bin/real-go"
  cp "$srcdir/gowrapper.sh" "$pkgdir/usr/bin/go"
  chmod +x "$pkgdir/usr/bin/go"
  cp -a pkg "$pkgdir/usr/lib/go"
  cp -a "$GOROOT/src" "$pkgdir/usr/lib/go/"
  cp -a "$GOROOT/src/cmd" "$pkgdir/usr/lib/go/src/cmd"
  cp -a "$GOROOT/lib" "$pkgdir/usr/lib/go/"

  ln -sf /usr/bin "$pkgdir/usr/lib/go/bin"

  cp -r misc/ "$pkgdir/usr/lib/go/"

  install -Dm644 favicon.ico "$pkgdir/usr/lib/go/favicon.ico"
}

# vim:set ts=2 sw=2 et:
