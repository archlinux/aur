# Maintainer: Sandwich <sandwich dot archworks dot co>

pkgname=mautrix-slack
pkgver=0.2.3
pkgrel=0
pkgdesc="A Matrix-Slack puppeting bridge"
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later')
# mautrix-slack can be build without encription support.
# For that libolm has to be removed from the makedepends and depends
makedepends=(go git)
depends=('libolm')
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/slack"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  sysusers-mautrix-slack.conf
  mautrix-slack.tmpfiles
  mautrix-slack.service
)
backup=("etc/${pkgname}/mautrix-slack.yaml")
sha256sums=('e5bd8e42da628a6e4142ca8f8e5ef8c2b53f274fa3d33f9b6cb4f49ce24caa93'
            'c1e3d2d9a65fa9ced4b35fdad98ec69a21dfee5da9e22e8c76e7821cebc0fa1e'
            'dc52d374b0af0af85aa44bc2679edf48e41c2631f684b8df7d2cc591fbadbf96'
            '58bed71d40735df20c01176eafea2e85aa98e2e24c26d2d0adc76652c5b25003')

build() {
  cd "$srcdir/slack-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  ./build.sh
  ./mautrix-slack -e
}

package() {
  cd "$srcdir/slack-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/sysusers-mautrix-slack.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-slack.conf"
  install -Dm644 "$srcdir/mautrix-slack.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-slack.conf"

  install -Dm640 "config.yaml" "$pkgdir/etc/$pkgname/mautrix-slack.yaml"
  install -Dm644 "$srcdir/mautrix-slack.service" "$pkgdir/usr/lib/systemd/system/mautrix-slack.service"
  install -Dm644 LICENSE{,.exceptions} -t "$pkgdir/usr/share/licenses/$pkgname"
}
