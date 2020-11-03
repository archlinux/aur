# Maintainer: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>

_pkgname=lotus
pkgname=$_pkgname-git
pkgver=1.1.2.r193.gd421274dc
pkgrel=1
pkgdesc='Filecoin client in Go'
arch=('x86_64')
url="https://github.com/filecoin-project/$_pkgname"
license=('MIT' 'APACHE')
makedepends=('go' 'gcc' 'git' 'jq' 'pkgconf')
depends=('ocl-icd' 'gcc-libs' 'hwloc')
source=("git+${url}.git")
b2sums=('SKIP')
options=('!strip') # stripping removes information embeded into lotus after build process


pkgver() {
  cd "$srcdir/$_pkgname"
  VERSION=$(git tag | grep -ve "-dev" | sed 's/-/~/g' | sort --version-sort --reverse | sed 's/~/-/g' | head -n1)
  COUNT=$(git rev-list "$VERSION.." --count)
  CHKSUM=$(git rev-list master | head -n1)
  VERSION=$(echo "$VERSION" | sed 's/^v//' | sed 's/-//')
  printf "%s.%s.%s" "$VERSION" "r$COUNT" "g${CHKSUM:0:9}"
}

prepare() {
  cd "$srcdir/$_pkgname"
  mkdir -p "${srcdir}/../go"
  export GOPATH="${srcdir}/../go"
  export PATH="$PATH:$GOPATH/bin"
  chmod u+w -R "$GOPATH"
}

build() {
  cd "$srcdir/$_pkgname"
  export GOPATH="${srcdir}/../go"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  GOFLAGS="-trimpath -buildmode=pie" make build
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm755 $_pkgname-miner "$pkgdir"/usr/bin/$_pkgname-miner
  install -Dm755 $_pkgname-worker "$pkgdir"/usr/bin/$_pkgname-worker

  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

  install -Dm 0644 scripts/lotus-daemon.service "$pkgdir/usr/lib/systemd/system/lotus-daemon.service"
  install -Dm 0644 scripts/lotus-miner.service "$pkgdir/usr/lib/systemd/system/lotus-miner.service"
}

# vim: set expandtab ts=2 sw=2:
