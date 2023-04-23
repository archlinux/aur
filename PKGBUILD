# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=owncast-git
_pkgname=owncast
pkgver=0.0.13.bdd22e2
pkgrel=1
pkgdesc="Take control over your live stream video by running it yourself. Streaming + chat out of the box."
url='https://github.com/owncast/owncast'
arch=('any')
license=('MIT')
makedepends=('git' 'go' 'npm')
depends=('ffmpeg')
conflicts=('owncast')
source=("git+$url"
        "https://raw.githubusercontent.com/owncast/owncast/develop/LICENSE"
        "owncast.service"
        "sysusers.conf"
        "tmpfiles.conf"
        "nginx.conf"
        "apache.conf")
sha256sums=('SKIP'
            '8dc06e06bb8b508eafc95aa410d1e51f8804edeed93598b3ab1b3c0cee8b2022'
            '1d5e040b3bcde36fc8c7c97f229c1b69be488591031ab4fcfae9c8512ae42dbc'
            'e5eca2c4e93e4854c97d5a50883efa8938bb075cae28f5b716267eb1ff94f626'
            '42e440c20560bf4926309e4fcb5637d32c4737f8be2f6bd3b0513d58a5a97e84'
            '7a22f55874c4ea1ec155d3ececb8a7b0f3f9c05a36b5875dfaf6e7cdb39de26c'
            '2c4061176a5fa7cd2bcfca196b0c70ca01923e44b474a452ac03c61c48093917')

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${_pkgname} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}"
}

package() {
  cd "${_pkgname}"
  find web -type f -exec install -Dm 644 "{}" "$pkgdir/usr/share/$_pkgname/{}" \;
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/owncast.service" "$pkgdir/usr/lib/systemd/system/owncast.service"
  install -Dm644 "$srcdir/apache.conf" "$pkgdir/usr/share/$_pkgname/example-apache.conf"
  install -Dm644 "$srcdir/nginx.conf" "$pkgdir/usr/share/$_pkgname/example-nginx.conf"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/owncast.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/owncast.conf"
}
# vim: ft=sh ts=2 sw=2 et
