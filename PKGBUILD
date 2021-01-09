## TODO Looks like, AUR bug - need to rename to docker-registry-git: name busy, hidden+abandoned pkgbuild.
pkgname=docker-registry2-git
__gitroot=github.com/docker/distribution
pkgver=r2845.35f1369d
pkgrel=2
pkgdesc="Docker Registry 2.0 implementation to pack, ship, store, and deliver docker images (git version)."
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://${__gitroot}"
license=('apache')
depends=( )
makedepends=('git' 'go')
install='docker-registry-git.install'
provides=('docker-registry')
backup=('etc/docker-registry/config.yml')
conflicts=('docker-registry')
_gourl="$__gitroot/cmd/registry"
source=("$pkgname::git+https://${__gitroot}"
        'docker-registry.conf'
        'docker-registry.service'
        'docker-registry.sysusers'
        )
sha256sums=('SKIP'
            'ef9c4f3dbde6a60d07a0be2553a5ca0717132fb3dbdd541284f671c2f4e34cdf'
            'b75e03e96dd90bb05e22d31fb5ee8fa159db21652995fbb7069bf3ac823c57f5'
            '4aada981fb0bc3f4b7eb04790178e17fa2820a7d423474a3dad808ae1607ed39'
            )

build() {
  GOPATH="$srcdir" go get -v -x ${_gourl}
}

package() {
  install -Dm644 "$srcdir/$pkgname/cmd/registry/config-example.yml" "$pkgdir/etc/docker-registry/config.yml"
  sed -e "s@/var/lib/registry@/var/lib/docker-registry@g" \
      -e "s@/etc/registry@/etc/docker-registry/.htpasswd@" \
      -i "$pkgdir/etc/docker-registry/config.yml"

  install -Dm755 "$srcdir/bin/registry" "$pkgdir/usr/bin/docker-registry"
  install -Dm644 docker-registry.conf "$pkgdir/etc/conf.d/docker-registry"
  install -Dm644 docker-registry.service "$pkgdir/usr/lib/systemd/system/docker-registry.service"
  install -Dm644 docker-registry.sysusers "$pkgdir/usr/lib/sysusers.d/docker-registry.conf"
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
