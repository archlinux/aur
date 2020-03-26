# Maintainer: @RubenKelevra
# Contributor: Jakub "Kubuxu" Sztandera <kubuxu@protonmail.ch>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

_pkgname=go-ipfs
pkgname=$_pkgname-git
pkgver=0.4.23.r800.g729e0533f
pkgrel=2
pkgdesc='A peer-to-peer hypermedia distribution protocol'
url="https://github.com/ipfs/$_pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=(go-pie git)
optdepends=('fuse2: for mounting/advanced use'
            'bash-completion: bash completion support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git"
        "ipfs.service"
        "ipfs@.service")

sha512sums=('SKIP'
            '1a6bc7fffc3c3640cda3f33c107424edd698c62bd8509731856b8827ea18be1a1845ef0d5ca15325d48d7d871a78daacc011ff9eacea926bc35899850990c1c6'
            'aed168a35228c4f873e0040d1412f3568bfe1ad1e94ffb8b1a2507058daaf75d7346381d299cf9f0b91951b21553170249ff5f45d5fc060e711cf628ab5e5aad')

pkgver() {
  cd "$srcdir/$_pkgname"
  #VERSION=$(grep -E "^const CurrentVersionNumber = " version.go | awk '{ print $4 }' | sed 's/"//g')
  VERSION=$(git tag | grep -vE "floodsub|sharding-pre" | grep -ve "-dev" | sed 's/-/~/g' | sort --version-sort --reverse | sed 's/~/-/g' | head -n1)
  COUNT=$(git rev-list "$VERSION.." --count)
  VERSION=$(echo "$VERSION" | sed 's/^v//')
  CHKSUM=$(git rev-list master | head -n1)
  printf "%s.%s.%s" "$VERSION" "r$COUNT" "g${CHKSUM:0:9}"
}

build() {
  cd "$srcdir/$_pkgname"
  make build
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 cmd/ipfs/ipfs "$pkgdir/usr/bin/ipfs"
  install -Dm 644 "$srcdir"/ipfs.service "$pkgdir/usr/lib/systemd/user/ipfs.service"
  install -Dm 644 "$srcdir"/ipfs@.service "$pkgdir/usr/lib/systemd/system/ipfs@.service"
  install -Dm 644 misc/completion/ipfs-completion.bash "$pkgdir/usr/share/bash-completion/completions/ipfs"
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/MIT" LICENSE-MIT
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/APACHE" LICENSE-APACHE
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
