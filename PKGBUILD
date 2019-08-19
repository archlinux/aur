# Maintainer: Daniel Lublin <daniel@lublin.se>

_pkgname=ntsclient
pkgname=$_pkgname-git
pkgver=r27.671e778
pkgrel=1
pkgdesc='Small Network Time Security Client (NTP with NTS). Alpha software.'
arch=('i686' 'x86_64')
url="https://gitlab.com/hacklunch/$_pkgname"
license=('ISC')
makedepends=('git' 'go-pie')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  go build \
     -gcflags "all=-trimpath=$PWD" \
     -asmflags "all=-trimpath=$PWD" \
     -ldflags "-extldflags $LDFLAGS" \
     -o $_pkgname .
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 ntsclient.toml "$pkgdir/etc/ntsclient.toml"
  install -Dm644 contrib/ntsclient.service "$pkgdir/usr/lib/systemd/system/ntsclient.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
