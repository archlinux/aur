# Maintainer: Default User <default@user.com>
pkgname=vk-turn-proxy-client-git
pkgver=r1.1234567
pkgrel=1
pkgdesc="VK TURN Proxy - Client component (git version)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/cacggghp/vk-turn-proxy"
license=('GPL3')
depends=('glibc' 'iproute2')
makedepends=('git' 'go')
provides=('vk-turn-proxy-client')
conflicts=('vk-turn-proxy-client-bin' 'vk-turn-proxy-git')
source=("vk-turn-proxy::git+https://github.com/cacggghp/vk-turn-proxy.git"
        "vk-turn-proxy-client.service"
        "vk-turn-proxy-client.env")
sha256sums=('SKIP'
            '37bf69ee1cdde6ec2c172f3b08c993e544bec62a79273d342f3b69715d2c4907'
            '205aa129e0ee2837ffd5b102a5b2c1771bc51d5ffcc1cf4fb31e51110882063c')

pkgver() {
  cd vk-turn-proxy
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd vk-turn-proxy
  mkdir -p build
}

build() {
  cd vk-turn-proxy
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/vk-turn-proxy-client ./client
}

package() {
  cd vk-turn-proxy
  install -Dm755 build/vk-turn-proxy-client "$pkgdir/usr/bin/vk-turn-proxy-client"
  
  install -dm755 "$pkgdir/usr/share/vk-turn-proxy"
  install -m644 routes-macos.sh "$pkgdir/usr/share/vk-turn-proxy/routes-macos.sh"
  install -m644 routes.sh "$pkgdir/usr/share/vk-turn-proxy/routes.sh"
  install -m644 routes.ps1 "$pkgdir/usr/share/vk-turn-proxy/routes.ps1"
  
  install -Dm644 "$srcdir/vk-turn-proxy-client.service" "$pkgdir/usr/lib/systemd/system/vk-turn-proxy-client.service"
  install -Dm644 "$srcdir/vk-turn-proxy-client.env" "$pkgdir/etc/default/vk-turn-proxy-client"
}
