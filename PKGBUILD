# Maintainer: Thiago Almeida <thiagoalmeidasa@gmail.com>
pkgname=bolbol-git
_pkgname=bolbol
pkgver=20190604.53_3f7a049
pkgrel=1
pkgdesc="Learn languages on terminal, by short and practical sentences."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/mostafa-asg/bolbol"
depends=(
  'glibc'
)
makedepends=(
  'go'
  'git'
)

source=(
  "$_pkgname::git+https://github.com/mostafa-asg/bolbol.git#branch=${BRANCH:-master}"
)

md5sums=('SKIP')

backup=(
)

pkgver() {
  if [[ "$PKGVER" ]]; then
    echo "$PKGVER"
    return
  fi

  cd "$srcdir/$_pkgname"
  local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
  local count=$(git rev-list --count HEAD)
  local commit=$(git rev-parse --short HEAD)
  echo "$date.${count}_$commit"
}

build() {
  cd "$srcdir/$_pkgname"

  if [ -L "$srcdir/$_pkgname" ]; then
    rm "$srcdir/$_pkgname" -rf
    mv "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"
  fi

  rm -rf "$srcdir/go/src"

  mkdir -p "$srcdir/go/src"

  export GOPATH="$srcdir/go"

  mv "$srcdir/$_pkgname" "$srcdir/go/src/"

  cd "$srcdir/go/src/$_pkgname/"
  ln -sf "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"

  echo ":: Updating git submodules"
  git submodule update --init

  echo ":: Building binary"
  go get -v \
    -gcflags "-trimpath $GOPATH/src"
}

package() {
  find "$srcdir/go/bin/" -type f -executable | while read filename; do
    install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
  done
}
