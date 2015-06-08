# Maintainer: wicast <wicastchen at hotmail>
# Contributor: Schala <schalaalexiazeal at gmail.com>
# Contributor: Vesa Kaihlavirta <vegai at iki.fi>
# Contributor: Alexander Rødseth <rodseth at gmail.com>
# Contributor: Rémy Oudompheng  <remy at archlinux.org>
# Contributor: Andres Perera <andres87p gmail>
# Contributor: Matthew Bauer <mjbauer95 at gmail.com>
# Contributor: Christian Himpel <chressie at gmail.com>
# Contributor: Mike Rosset <mike.rosset at gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail.com>
# Contributor: John Luebs <jkluebs at gmail.com>

pkgname=go-cross-major-platforms
_gitname=go
epoch=2
pkgver=1.4.2
pkgrel=2
pkgdesc='Compiler and tools for the Go programming language from Google (Windows,OSX and Linux with arm)'
arch=('x86_64' 'i686')
url='http://golang.org/doc/install/source#environment'
license=('BSD')
makedepends=('inetutils' 'git' 'mercurial')
options=('!strip' 'staticlibs')
optdepends=('mercurial: for fetching sources from mercurial repositories'
            'git: for fetching sources from git repositories'
            'bzr: for fetching sources from bazaar repositories'
            'subversion: for fetching sources from subversion repositories')
conflicts=(go)
provides=(go)
install="$pkgname.install"
source=("$pkgname-$pkgver::git+https://go.googlesource.com/go#tag=$_gitname$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver/src"

  export GOROOT="$srcdir/$pkgname-$pkgver"
  export GOBIN="$GOROOT/bin"
  export GOPATH="$srcdir/"
  export GOROOT_FINAL=/usr/lib/go

  #
  # Arch Linux normally does not enable SSE2 for i686 because of older CPUs.
  #
  # However, exceptions are made for:
  #  * Chromium, which is not expected to be used on older i686 CPUs
  #  * Julia, which requires SSE2
  #
  # Go is so slow that it is unusable on i686 when SSE2 is not enabled,
  # so I am also making an exception for Go.
  #
  # If you really want to build Go without SSE2 support, just uncomment the
  # following export and rebuild:
  #
  # export GO386=387
  #

  # Crosscompilation for various platforms without arm
  for os in darwin windows; do #darwin windows dragonfly openbsd plan9; do
    for arch in amd64 386; do
      export GOOS="$os"
      export GOARCH="$arch"
      bash make.bash --no-clean
    done
  done

  # Crosscompilation for various platforms with arm (including linux)
  for os in linux; do #freebsd netbsd linux; do
    for arch in amd64 386 arm; do
      export GOOS="$os"
      export GOARCH="$arch"
      # export GOARM=7
      bash make.bash --no-clean
    done
  done

  ## Crosscompilation for solaris only on amd64
  #export GOOS=solaris
  #export GOARCH=amd64
  #
  #bash make.bash --no-clean


  GOOS=linux
  case "$CARCH" in
    x86_64) GOARCH=amd64 ;;
    i686) GOARCH=386 ;;
  esac

  $GOROOT/bin/go get -d golang.org/x/tools/cmd/godoc
  $GOROOT/bin/go build -o $srcdir/godoc golang.org/x/tools/cmd/godoc
  for tool in vet cover callgraph; do
    $GOROOT/bin/go get -d golang.org/x/tools/cmd/${tool}
    $GOROOT/bin/go build -o $GOROOT/pkg/tool/${GOOS}_${GOARCH}/${tool} golang.org/x/tools/cmd/${tool}
  done
}

check() {
  cd "$pkgname-$pkgver"

  #export GO386=387

  export GOOS=linux
  if [ "$CARCH" == 'x86_64' ]; then
    export GOARCH=amd64
  elif [ "$CARCH" == 'i686' ]; then
    export GOARCH=386
  fi

  export GOROOT="$srcdir/$pkgname-$pkgver"
  export GOBIN="$GOROOT/bin"
  export PATH="$srcdir/$pkgname-$pkgver/bin:$PATH"

  # TestSimpleMulticastListener will fail in standard chroot
  cd src && bash run.bash --no-rebuild || true
}

package() {
  cd "$pkgname-$pkgver"

  export GOROOT="$srcdir/$pkgname-$pkgver"
  export GOBIN="$GOROOT/bin"

  install -Dm755 "$srcdir/godoc" "$pkgdir/usr/bin/godoc"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/go/LICENSE"

  mkdir -p \
    "$pkgdir/"{etc/profile.d,usr/{share/go,lib/go,lib/go/src,lib/go/site/src}}

  cp -r doc misc -t "$pkgdir/usr/share/go"
  ln -s /usr/share/go/doc "$pkgdir/usr/lib/go/doc"
  cp -a bin "$pkgdir/usr"
  cp -a pkg "$pkgdir/usr/lib/go"
  cp -a "$GOROOT/src" "$pkgdir/usr/lib/go/"
  cp -a "$GOROOT/src/cmd" "$pkgdir/usr/lib/go/src/cmd"
  cp -a "$GOROOT/src/lib9" "$pkgdir/usr/lib/go/src/"
  cp -a "$GOROOT/lib" "$pkgdir/usr/lib/go/"
  cp -a "$GOROOT/include" "$pkgdir/usr/lib/go/"

  install -Dm644 src/Make.* "$pkgdir/usr/lib/go/src"

  # Remove object files from target src dir
  find "$pkgdir/usr/lib/go/src/" -type f -name '*.[ao]' -delete

  # Fix for FS#32813
  find "$pkgdir" -type f -name sql.go -exec chmod -x {} \;
  
  # Remove all executable source files
  find "$pkgdir/usr/lib/go/src" -type f -executable -delete

  # Headers for C modules
  install -Dm644 src/runtime/runtime.h \
    "$pkgdir/usr/lib/go/src/runtime/runtime.h"
  install -Dm644 src/runtime/cgocall.h \
    "$pkgdir/usr/lib/go/src/runtime/cgocall.h"

  # This is to make go get code.google.com/p/go-tour/gotour and
  # then running the gotour executable work out of the box.
  ln -sf /usr/bin "$pkgdir/usr/lib/go/bin"

  # For FS#42660 / FS#42661 / gox
  install -Dm755 src/make.bash "$pkgdir/usr/lib/go/src/make.bash"
  install -Dm755 src/run.bash "$pkgdir/usr/lib/go/src/run.bash"
  cp -r misc/ "$pkgdir/usr/lib/go/"

  # For godoc
  install -Dm644 favicon.ico "$pkgdir/usr/lib/go/favicon.ico"

  rm -f "$pkgdir/usr/share/go/doc/articles/wiki/get.bin"

  install -Dm644 VERSION "$pkgdir/usr/lib/go/VERSION"

  find "$pkgdir/usr/"{lib/go/pkg,bin} -type f -exec touch '{}' +
}

# vim:set ts=2 sw=2 et:
