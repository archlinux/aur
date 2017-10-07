# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=skicka
pkgver=r272.70827bf
pkgrel=1
pkgdesc="CLI utility for working with files and folders stored on Google Drive/Photos"
arch=('i686' 'x86_64')
url="https://github.com/google/skicka"
license=('GPL')
makedepends=('go' 'git')
source=("skicka::git+https://github.com/google/skicka#branch=${BRANCH:-master}")
md5sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  if [ -L "$srcdir/$pkgname" ]; then
    rm "$srcdir/$pkgname" -rf
    mv "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"
  fi

  rm -rf "$srcdir/.go/src"

  mkdir -p "$srcdir/.go/src"

  export GOPATH="$srcdir/.go"

  mv "$srcdir/$pkgname" "$srcdir/.go/src/"

  cd "$srcdir/.go/src/$pkgname/"
  ln -sf "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"

  git submodule update --init

  go get -v \
    -gcflags "-trimpath $GOPATH/src"
}

package() {
  find "$srcdir/.go/bin/" -type f -executable | while read filename; do
    install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
  done
}
