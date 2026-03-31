# Maintainer: Default User <default@user.com>
pkgname=vk-turn-proxy-server-git
pkgver=r1.1234567
pkgrel=1
pkgdesc="VK TURN Proxy - Server component (git version)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/cacggghp/vk-turn-proxy"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
provides=('vk-turn-proxy-server')
conflicts=('vk-turn-proxy-server-bin' 'vk-turn-proxy-git')
source=("vk-turn-proxy::git+https://github.com/cacggghp/vk-turn-proxy.git"
        "vk-turn-proxy-server.service"
        "vk-turn-proxy-server.env")
sha256sums=('SKIP'
            '67667fc990fde4084919ef3f94d98c2dc50505140291cd95cdf9659454b72d8d'
            'f6df4f1a25b8a250c60f0dc8e434e03803f3c26d459364f71621905af70b0d2b')

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
  go build -o build/vk-turn-proxy-server ./server
}

package() {
  cd vk-turn-proxy
  install -Dm755 build/vk-turn-proxy-server "$pkgdir/usr/bin/vk-turn-proxy-server"
  install -Dm644 "$srcdir/vk-turn-proxy-server.service" "$pkgdir/usr/lib/systemd/system/vk-turn-proxy-server.service"
  install -Dm644 "$srcdir/vk-turn-proxy-server.env" "$pkgdir/etc/default/vk-turn-proxy-server"
}
