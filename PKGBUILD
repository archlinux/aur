# Maintainer: Yishen Miao <mys721tx@gmail.com>

pkgname=headplane
pkgver=0.7.1
pkgrel=1
pkgdesc='A feature-complete web UI for Headscale'
arch=('x86_64' 'aarch64')
url='https://headplane.net'
license=('MIT')
depends=('nodejs-lts-krypton>=24.2')
makedepends=('go>=2:1.26.6' 'npm' 'pnpm' 'patch')
optdepends=('headscale: the coordination server Headplane manages')
backup=('etc/headplane/config.yaml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tale/headplane/archive/refs/tags/v$pkgver.tar.gz"
        'headplane.service'
        'headplane.sh'
        'headplane.sysusers'
        'headplane.tmpfiles')
sha256sums=('d9c963f195e91929bd194d8c9672932fe07b55192c05c4415f3d6900c4d18374'
            '3e22a9a99e12bb2ba873d6ade226933aedcc00b40b2188505667a29a508fdc88'
            '9562f2eb22889deb5694bcba3ecfb0027e498400cbe322b65492b4433b20aaba'
            'dec16ccceb64cda48b4effb35baad87db4960b634fe1bb985011db971289af1e'
            'b1ffab047a92ffd1f68c7ffd8ff3b480fd1cc32e46a33770d0082c11b31f51aa')

_setgoenv() {
  export GOTOOLCHAIN=local
  export GOPATH="$srcdir/gopath"
  export GOMODCACHE="$srcdir/gopath/pkg/mod"
  export GOFLAGS=-modcacherw
}

prepare() {
  cd "$pkgname-$pkgver"

  sed -i 's|/usr/libexec/headplane/agent|/usr/lib/headplane/agent|' \
    app/server/config/config-schema.ts

  cp config.example.yaml config.arch.yaml
  sed -i \
    -e 's|^  url: "http://headscale:5000"|  url: "http://127.0.0.1:8080"|' \
    -e 's|^  config_path: |  # config_path: |' \
    -e 's|^  cookie_secret: .*|  cookie_secret_path: "/etc/headplane/cookie_secret"|' \
    config.arch.yaml

  _setgoenv
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  _setgoenv

  # SSH wasm
  go mod vendor
  patch -d vendor/tailscale.com -p1 < patches/tailscale-netcheck-derp-port.patch
  mkdir -p public
  cp "$(go env GOROOT)/lib/wasm/wasm_exec.js" public/wasm_exec.js
  CGO_ENABLED=0 GOOS=js GOARCH=wasm \
    go build -mod=vendor -trimpath -ldflags '-s -w' \
      -tags "$(cat cmd/hp_ssh/build-tags.txt)" \
      -o public/hp_ssh.wasm ./cmd/hp_ssh
  rm -rf vendor

  # agent
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" \
         CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw' \
    go build -ldflags '-linkmode=external' -o hp_agent ./cmd/hp_agent

  # web app
  pnpm install --frozen-lockfile --store-dir "$srcdir/pnpm-store"
  HEADPLANE_VERSION="$pkgver" pnpm run build

  find build -name '*.map' -delete
  sed -i "s|$srcdir/$pkgname-$pkgver|/usr/share/headplane|g" build/server/index.js
}

package() {
  install -Dm755 headplane.sh "$pkgdir/usr/bin/headplane"
  install -Dm644 headplane.service "$pkgdir/usr/lib/systemd/system/headplane.service"
  install -Dm644 headplane.sysusers "$pkgdir/usr/lib/sysusers.d/headplane.conf"
  install -Dm644 headplane.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/headplane.conf"

  cd "$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/share/headplane"
  cp -r build drizzle "$pkgdir/usr/share/headplane/"

  install -Dm755 hp_agent "$pkgdir/usr/lib/headplane/agent"
  install -Dm644 config.arch.yaml "$pkgdir/etc/headplane/config.yaml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
