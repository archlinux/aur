# Maintainer: Vincent Loupmon <vloupmong@gmail.com>

pkgname=slit
pkgver=1.2.0
pkgrel=1
pkgdesc="A modern PAGER for viewing logs, get more than most in less time. Written in Go"
arch=('x86_64' 'i686')
url="https://github.com/tigrawap/slit"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("git+https://github.com/tigrawap/slit#commit=f1d770e")
md5sums=('SKIP')
_gourl=github.com/tigrawap/slit

pkgver() {
  cd slit
  git describe --tags | tr - .
}

build() {
  export GOROOT=/usr/lib/go
  export GOFLAGS='-gcflags "all=-trimpath=${GOPATH}" -asmflags "all=-trimpath=${GOPATH}"'
  [[ -d build ]] && rm -rf build
  mkdir -p build/go
  cd build/go

  for f in "$GOROOT/"*; do
    ln -s "$f"
  done

  rm pkg
  mkdir pkg
  cd pkg

  for f in "$GOROOT/pkg/"*; do
    ln -s "$f"
  done

  platform=`for f in "$GOROOT/pkg/"*; do echo \`basename $f\`; done|grep linux`

  rm -f "$platform"
  mkdir "$platform"
  cd "$platform"

  for f in "$GOROOT/pkg/$platform/"*.h; do
    ln -s "$f"
  done

  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"

  go get -fix "$_gourl"

  # Prepare executable
  if [ -d "$srcdir/build/src" ]; then
    cd "$srcdir/build/src/$_gourl"
    go build -o "$srcdir/build/$pkgname"
  else
    echo 'Old sources for a previous version of this package are already present!'
    echo 'Build in a chroot or uninstall the previous version.'
    return 1
  fi
}

package() {
  export GOROOT="$GOPATH"

 # Package license (if available)
  for f in LICENSE COPYING; do
    if [ -e "$srcdir/build/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/build/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done

  # Package executables
  if [ -e "$srcdir/build/$pkgname" ]; then
    install -Dm755 "$srcdir/build/$pkgname" \
      "$pkgdir/usr/bin/$pkgname"
  fi
}
