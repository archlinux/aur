# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Anatol Pomozov
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

DEBUG=0

_pkgname=kubo
_old_pkgname=go-ipfs
pkgname=$_pkgname-git
pkgver=0.13.0rc1.r18.ga72753bad
pkgrel=2
epoch=0

pkgdesc='A client for the ipfs peer-to-peer hypermedia distribution protocol'
url="https://github.com/ipfs/$_pkgname"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=(MIT)

depends=(glibc)
makedepends=(go git)
optdepends=('bash-completion: bash completion support')

provides=("$_pkgname" "ipfs")
conflicts=("$_pkgname" "$_old_pkgname" "${_old_pkgname}-git")
replaces=("${_old_pkgname}-git")
install="$pkgname.install"
source=("git+$url.git"
        # https://github.com/ipfs/kubo/pull/8213#issuecomment-881866789
        rb.patch
	strip.patch)

b2sums=('SKIP'
        'e806cac9fbfa396bdfad6e236bbfe4141b41b81da0a4c92b045b82c5c7237af7048bc16db4d9078c7351dbc4d82e658bb78f07bbc48b603c0589bca59c63f02d'
        'f1cffb528e6481aa67de09779ed141dd3aa41f5190de55d60e0fe5db14bddc092a1e90bb235fe8db607f2f0c6ffc04e73416e8923a601d4b8e8b1bc8c9560c4e')


prepare() {

  cd "$srcdir/$_pkgname"
  patch -Np1 -i ../rb.patch

  if [ "$DEBUG" -eq 0 ]; then
    patch -Np1 -i ../strip.patch
  fi

  cd "$srcdir/.."

  # check if it was wiped due to enabled optimizations
  if [ ! -f "./go/wiped" ] && [ -d "./go" ]; then
    chmod u+w -R "./go" 2>/dev/null || true
    rm -fdR ./go 2>/dev/null || true
  fi

  mkdir -p "go"
  touch go/wiped
  export GOPATH="$(pwd)/go" 

  # make sure GOPATH is set to writeable
  chmod u+w -R "$GOPATH"
  
  cd "$srcdir/$_pkgname"

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -modcacherw"

  # dirty fix go1.18
  sed -i -r 's,^go 1\.[0-9]+,go 1.18,' go.mod
  go mod tidy
  go mod vendor

  # go get -d -v ./... # old fetch
  
}

pkgver() {
  EXCLUDE_TAGS="floodsub|sharding-pre|-dev"

  cd "$srcdir/$_pkgname"
  VERSION=$(git tag | grep -vE "$EXCLUDE_TAGS" | sed 's/-/~/g' | sort --version-sort --reverse | sed 's/~/-/g' | head -n1)
  COUNT=$(git rev-list "$VERSION.." --count)
  CHKSUM="$(git rev-parse --short HEAD)"
  VERSION=$(echo "$VERSION" | sed 's/^v//' | sed 's/-//')
  printf "%s.%s.%s" "$VERSION" "r$COUNT" "g$CHKSUM"
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
  
  make nofuse
  cmd/kubo/kubo commands completion bash > "$srcdir"/kubo-completion.bash

  ### Patch service file ###

  # set KUBO_PATH if not set by upstream already
  sed -i  '/StateDirectory=kubo/,/ExecStart=\/usr\/bin\/kubo daemon --init --migrate/c StateDirectory=kubo\nEnvironment=KUBO_PATH=\~\nExecStart=\/usr\/bin\/kubo daemon --init --migrate' "misc/systemd/kubo-hardened.service"
  # remove --init (handled by install file)
  sed -i 's/ExecStart=\/usr\/bin\/kubo daemon --init --migrate/ExecStart=\/usr\/bin\/kubo daemon --migrate/g' "misc/systemd/kubo-hardened.service"
  # enable gc and pubsub by default (sane defaults)
  sed -i 's/ExecStart=\/usr\/bin\/kubo daemon/ExecStart=\/usr\/bin\/kubo daemon --enable-gc --enable-pubsub-experiment --enable-namesys-pubsub/g' "misc/systemd/kubo-hardened.service"
  # increase timeouts (see #7283)
  sed -i 's/MemorySwapMax=0/MemorySwapMax=0\n\nTimeoutStartSec=15min\nTimeoutStopSec=15min\nTimeoutAbortSec=15min/' "misc/systemd/kubo-hardened.service"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 cmd/kubo/kubo "$pkgdir/usr/bin/kubo"
  install -Dm 644 misc/systemd/kubo-api.socket "$pkgdir/usr/lib/systemd/system/kubo-api.socket"
  install -Dm 644 misc/systemd/kubo-gateway.socket "$pkgdir/usr/lib/systemd/system/kubo-gateway.socket"
  # use the hardened service file
  install -Dm 644 misc/systemd/kubo-hardened.service "$pkgdir/usr/lib/systemd/system/kubo.service"

  install -Dm 644 "$srcdir"/kubo-completion.bash "$pkgdir/usr/share/bash-completion/completions/kubo"
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/MIT" LICENSE-MIT
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/APACHE" LICENSE-APACHE
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
