# Maintainer: @RubenKelevra
# Contributor: Sameer Puri <purisame@spuri.io>

DEBUG=0

_pkgname=git-remote-ipld
pkgname=$_pkgname-git
pkgver=0.0.0.r0.g2f4756ae2
pkgrel=2
epoch=1
pkgdesc='git IPLD remote helper'
url="https://github.com/ipfs-shipyard/$_pkgname"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=(MIT)

depends=(glibc git go-ipfs)
makedepends=(go git)

provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")

b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  #VERSION=$(grep -E "^const CurrentVersionNumber = " version.go | awk '{ print $4 }' | sed 's/"//g')
  VERSION=$(git tag | grep -vE "floodsub|sharding-pre" | grep -ve "-dev" | sed 's/-/~/g' | sort --version-sort --reverse | sed 's/~/-/g' | head -n1)
  if [ -z "$VERSION" ]; then
    VERSION="0.0.0"
    COUNT=0
  else
    COUNT=$(git rev-list "$VERSION.." --count)
  fi
  CHKSUM=$(git rev-list master | head -n1)
  VERSION=$(echo "$VERSION" | sed 's/^v//' | sed 's/-//')
  printf "%s.%s.%s" "$VERSION" "r$COUNT" "g${CHKSUM:0:9}"
}

prepare() {
  cd "$srcdir/.."

  mkdir -p "go"
  export GOPATH="$(pwd)/go"

  # make sure GOPATH is set to writeable
  chmod u+w -R "$GOPATH"

  cd "$srcdir/$_pkgname"

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -modcacherw -trimpath"

  # dirty fix go1.18
  sed -i -r 's,^go 1\.[0-9]+,go 1.18,' go.mod
  go mod tidy
  go mod vendor
}


build() {
  cd "$srcdir/$_pkgname"

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  if [ "$DEBUG" -eq 0 ]; then
    export CGO_ENABLED=0
    # only run detection on x86_64 and if makepkg.conf contains no value
    if [ "$CARCH" == "x86_64" ] && [ -z "$GOAMD64" ]; then
      # detect cpu feature level
      version_4="$(/lib/ld-linux-x86-64.so.2 --help | grep supported | grep x86-64-v4 | wc -l)"
      version_3="$(/lib/ld-linux-x86-64.so.2 --help | grep supported | grep x86-64-v3 | wc -l)"
      version_2="$(/lib/ld-linux-x86-64.so.2 --help | grep supported | grep x86-64-v2 | wc -l)"

      if [ "$version_4" -gt 0 ]; then
        export GOAMD64="v4"
      elif [ "$version_3" -gt 0 ]; then
        export GOAMD64="v3"
      elif [ "$version_2" -gt 0 ]; then
        export GOAMD64="v2"
      else
        export GOAMD64="v1"
      fi
    fi
  fi

  echo "using x86_64 optimization level: $GOAMD64"

  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 cmd/$_pkgname/$_pkgname "${pkgdir}/usr/bin/git-remote-ipld"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
