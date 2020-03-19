# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=traefik-git
pkgver=2.2.0.rc2.r2.g37fb5298a
pkgrel=1
pkgdesc="The cloud native edge router"
arch=('i686' 'x86_64')
url="https://containo.us/traefik/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go-pie' 'go-bindata')
provides=('traefik')
conflicts=('traefik')
backup=('etc/traefik/traefik.toml'
        'etc/traefik/traefik.yaml'
        'etc/traefik/traefik.yml')
source=("git+https://github.com/containous/traefik.git"
        "traefik.service::https://git.archlinux.org/svntogit/community.git/plain/trunk/traefik.service?h=packages/traefik"
        "traefik.sysusers::https://git.archlinux.org/svntogit/community.git/plain/trunk/traefik.sysusers?h=packages/traefik")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "traefik"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "traefik"

  go generate
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    ./cmd/traefik
}

check() {
  cd "traefik"

  go test ./...
}

package() {
  cd "traefik"

  install -Dm755 "traefik" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/traefik.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/traefik.sysusers" "$pkgdir/usr/lib/sysusers.d/traefik.conf"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/traefik"
}
