# Maintainer: jmattheis <contact AT jmattheis DOT de>
# Contributor: ml <ml@visu.li>
pkgname=gotify-server
pkgver=2.0.14
_commit=e56f7bc4c7efdb61fea88a0b65d501277604cefa
pkgrel=4
pkgdesc='A simple server for sending and receiving messages in real-time per WebSocket.'
arch=('x86_64' 'i686' 'aarch64' 'armv7')
url='https://gotify.net/'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'yarn')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gotify/server/archive/v${pkgver}.tar.gz"
  'sysusers.d'
  'tmpfiles.d'
  'gotify-server.service'
  'config.patch'
)
sha256sums=('986125b92192e404a2f3af5db510d2d651c6301d218cbb66edd6013f8e8153b0'
            '2052ac82ceb607701bd505c9df4170bb65c14601a4c8dda3c4ee36fd399c3dfa'
            '181258b6ee9ee9b52b37c9dbf0c17faa786a90a3ea45299819173d5df32f95b0'
            '05b3edff049ad5600c2515279a6e1167dd8e62c2525e3916d807aba35a33362f'
            '6bc218da0fbcf06819f9635b91ae19674d31e9cbf6aafb62c0327d68bdd0dcd3')

prepare() {
  patch -N -p1 -d "server-$pkgver" <config.patch
}

build() {
  cd "server-$pkgver"
  (
    cd ui
    yarn --non-interactive --frozen-lockfile
    yarn --non-interactive --frozen-lockfile build
  )
  go run github.com/gobuffalo/packr/packr
  local build_date=$(date "+%F-%T" -d "@${SOURCE_DATE_EPOCH}")
  go build \
    -o "$pkgname" \
    -trimpath \
    -buildmode=pie \
    -ldflags "-X 'main.Version=${pkgver}' \
              -X 'main.Commit=${_commit}' \
              -X 'main.BuildDate=${build_date}' \
              -X 'main.Mode=prod' \
              -extldflags=${LDFLAGS}"
}

check() {
  cd "server-$pkgver"
  go test -v ./...
}

package() {
  install -Dm644 sysusers.d "$pkgdir/usr/lib/sysusers.d/gotify.conf"
  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/gotify.conf"
  install -Dm644 gotify-server.service "$pkgdir/usr/lib/systemd/system/gotify-server.service"

  cd "server-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm640 config.example.yml "$pkgdir/etc/gotify/config.yml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
