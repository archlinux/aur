# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=inlets
pkgver=2.7.4
pkgrel=1
pkgdesc='Expose your local endpoints to the Internet'
arch=('any')
url='https://github.com/inlets/inlets'
license=('MIT')
makedepends=('go' 'git')
options=('!strip')

source=('inlets-server.service' 'inlets-client.service' "https://github.com/inlets/inlets/archive/${pkgver}.tar.gz")
sha256sums=('79bad343a925292d0a5cc5164bff28fe95d9512a5dded04568af61d71e1e0a79'
            'f7f85bb083b8839a89f715f882bf0e0f556cf183aa7ed653a1c87c5822762163'
            '55cab0f01b19f653637f4230bdb0ff15e4618a59651f37cad6bc69ff79460e7c')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build .
}

package() {
  cd "$srcdir"
  install -Dm644 inlets-server.service "$pkgdir/usr/lib/systemd/system/inlets-server.service"
  install -Dm644 inlets-client.service "$pkgdir/usr/lib/systemd/system/inlets-client.service"

  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/inlets"
}
