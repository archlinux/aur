pkgname=pndpd-git
pkgver=1.2.7.r1.gdff2f9a
pkgrel=1
pkgdesc='NDP Proxy + Responder daemon'
provides=('pndpd')
conflicts=('pndpd')
arch=('x86_64')
url="https://github.com/Kioubit/pndpd"
license=('GPL3')
makedepends=('go' 'git')
source=("git+https://github.com/Kioubit/pndpd.git")
sha256sums=('SKIP')

pkgver() {
  cd "pndpd"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
  cd "$srcdir/pndpd"
  go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      .
}

package() {
  cd "$srcdir/pndpd"
  install -Dm755 pndpd -t "$pkgdir"/usr/bin/
  install -Dm644 pndpd.conf -t "$pkgdir"/etc/pndpd/
  sed -i "s|/usr/local|/usr|" pndpd.service
  install -Dm644 pndpd.service -t "$pkgdir"/usr/lib/systemd/system/
}
