# Maintainer: @RubenKelevra
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Anatol Pomozov
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

_pkgname=go-ipfs
pkgname=$_pkgname-git
pkgver=0.13.0rc1.r18.ga72753bad
pkgrel=1

pkgdesc='A peer-to-peer hypermedia distribution protocol'
url="https://github.com/ipfs/$_pkgname"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=(MIT)

depends=(glibc)
makedepends=("go>=1.18" git)
optdepends=('bash-completion: bash completion support')

provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("git+$url.git"
        # https://github.com/ipfs/go-ipfs/pull/8213#issuecomment-881866789
        rb.patch)

sha512sums=('SKIP'
            '5591bb5b309ccf6464723650831e7ed1bf6ffc7e18645c3563452df965091b94d265b079db92ae0b359aa964540b2ee1c1b60b3000102168bfd32730b640f12c')
b2sums=('SKIP'
        'e806cac9fbfa396bdfad6e236bbfe4141b41b81da0a4c92b045b82c5c7237af7048bc16db4d9078c7351dbc4d82e658bb78f07bbc48b603c0589bca59c63f02d')


prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i ../rb.patch

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
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

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
  make nofuse
  cmd/ipfs/ipfs commands completion bash > "$srcdir"/ipfs-completion.bash

  ### Patch service file ###

  # set IPFS_PATH if not set by upstream already
  sed -i  '/StateDirectory=ipfs/,/ExecStart=\/usr\/bin\/ipfs daemon --init --migrate/c StateDirectory=ipfs\nEnvironment=IPFS_PATH=\~\nExecStart=\/usr\/bin\/ipfs daemon --init --migrate' "misc/systemd/ipfs-hardened.service"
  # remove --init (handled by install file)
  sed -i 's/ExecStart=\/usr\/bin\/ipfs daemon --init --migrate/ExecStart=\/usr\/bin\/ipfs daemon --migrate/g' "misc/systemd/ipfs-hardened.service"
  # enable gc and pubsub by default (sane defaults)
  sed -i 's/ExecStart=\/usr\/bin\/ipfs daemon/ExecStart=\/usr\/bin\/ipfs daemon --enable-gc --enable-pubsub-experiment --enable-namesys-pubsub/g' "misc/systemd/ipfs-hardened.service"
  # increase timeouts (see #7283)
  sed -i 's/MemorySwapMax=0/MemorySwapMax=0\n\nTimeoutStartSec=15min\nTimeoutStopSec=15min\nTimeoutAbortSec=15min/' "misc/systemd/ipfs-hardened.service"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 cmd/ipfs/ipfs "$pkgdir/usr/bin/ipfs"
  install -Dm 644 misc/systemd/ipfs-api.socket "$pkgdir/usr/lib/systemd/system/ipfs-api.socket"
  install -Dm 644 misc/systemd/ipfs-gateway.socket "$pkgdir/usr/lib/systemd/system/ipfs-gateway.socket"
  # use the hardened service file
  install -Dm 644 misc/systemd/ipfs-hardened.service "$pkgdir/usr/lib/systemd/system/ipfs.service"

  install -Dm 644 "$srcdir"/ipfs-completion.bash "$pkgdir/usr/share/bash-completion/completions/ipfs"
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/MIT" LICENSE-MIT
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/APACHE" LICENSE-APACHE
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
