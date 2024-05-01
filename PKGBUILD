# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=traefik-git
pkgver=3.0.0.rc5.r27.g05d2c8607
pkgrel=1
pkgdesc="The cloud native edge router"
arch=('i686' 'x86_64')
url="https://traefik.io/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("traefik=$pkgver")
conflicts=('traefik')
backup=('etc/traefik/traefik.toml'
        'etc/traefik/traefik.yaml'
        'etc/traefik/traefik.yml')
source=("git+https://github.com/traefik/traefik.git"
        "traefik.service::https://gitlab.archlinux.org/archlinux/packaging/packages/traefik/-/raw/main/traefik.service"
        "traefik.sysusers::https://gitlab.archlinux.org/archlinux/packaging/packages/traefik/-/raw/main/traefik.sysusers")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "traefik"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-/./g'
}

build() {
  cd "traefik"

  go generate
  go build \
    ./cmd/traefik
}

check() {
  cd "traefik"

  #go test \
  #  ./...
}

package() {
  cd "traefik"

  install -Dm755 "traefik" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/traefik.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/traefik.sysusers" "$pkgdir/usr/lib/sysusers.d/traefik.conf"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/traefik"
  # create empty acme.json file, otherwise the service file will fail
  install -dm755 "$pkgdir/etc/traefik"
  touch "$pkgdir/etc/traefik/acme.json"
}
