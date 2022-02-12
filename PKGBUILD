# Maintainer: Remisa Yousefvand <remisa.yousefvand@gmail.com>

pkgname=secret-service
pkgver=0.2.2
pkgrel=1
pkgdesc="secret service provides secure ways of storing credentials"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/yousefvand/secret-service"
license=('MIT')
makedepends=('git' 'go')
optdepends=('sudo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('57519d26b0be943bff6dbce2218b56314cad3b92d544194c01532e14555ae565')

prepare() {
  export GOPATH="$srcdir"/gopath
  # go clean -modcache
}

build() {
  cd "$pkgname-$pkgver"
  go build -o secretserviced cmd/app/secretserviced/main.go
  go build -o secretservice cmd/app/secretservice/main.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 secretserviced "$pkgdir/usr/local/bin/secretserviced"
  install -Dm755 secretservice "$pkgdir/usr/local/bin/secretservice"
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE

  if [ ! -f "$pkgdir/etc/systemd/user/secretserviced.service" ]; then
  
    password=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 32 ; echo '')
    cat >secretserviced.service <<EOF
[Unit]
Description=Service to keep secrets of applications
Documentation=https://github.com/yousefvand/secret-service

[Install]
WantedBy=default.target

[Service]
Type=simple
RestartSec=30
Restart=always
Environment="MASTERPASSWORD=$password"
WorkingDirectory=%h
ExecStart=/usr/local/bin/secretserviced
EOF

    install -Dm755 secretserviced.service "$pkgdir/etc/systemd/user/secretserviced.service"

  fi
}
