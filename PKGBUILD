# Maintainer: ynk
pkgname=wb2api-git
pkgver=1.13.0.r9.g6b31db6
pkgrel=1
pkgdesc="workbuddy2api panel - Go API panel service (git, auto-follows upstream)"
arch=('x86_64' 'aarch64')
url="https://github.com/linguo2625469/workbuddy2api-panel"
license=('MIT')
makedepends=('git' 'go')
provides=('wb2api')
conflicts=('wb2api')
backup=('etc/wb2api/config.json')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd workbuddy2api-panel
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd workbuddy2api-panel
  export CGO_ENABLED=0 GOFLAGS="-trimpath" GOPATH="$srcdir/gopath" GOCACHE="$srcdir/gocache"
  go build -ldflags="-s -w" -o "$srcdir/wb2api"      ./cmd/server
  go build -ldflags="-s -w" -o "$srcdir/signin_bin"  ./cmd/signin
  go build -ldflags="-s -w" -o "$srcdir/login"       ./cmd/login
  go build -ldflags="-s -w" -o "$srcdir/credit"      ./cmd/credit
}

package() {
  # 二进制
  install -Dm755 "$srcdir/wb2api"     "$pkgdir/usr/bin/wb2api"
  install -Dm755 "$srcdir/signin_bin" "$pkgdir/usr/bin/wb2api-signin"
  install -Dm755 "$srcdir/login"      "$pkgdir/usr/bin/wb2api-login"
  install -Dm755 "$srcdir/credit"     "$pkgdir/usr/bin/wb2api-credit"

  # shell 脚本与辅助脚本
  install -Dm755 workbuddy2api-panel/login.sh  "$pkgdir/usr/share/wb2api/login.sh"
  install -Dm755 workbuddy2api-panel/signin.sh "$pkgdir/usr/share/wb2api/signin.sh"
  install -Dm755 workbuddy2api-panel/credit.sh "$pkgdir/usr/share/wb2api/credit.sh"
  install -Dm755 workbuddy2api-panel/scripts/probe_active.py "$pkgdir/usr/share/wb2api/scripts/probe_active.py"

  # 默认配置（backup= 声明后，升级时用户改动会被保留为 .pacnew）
  install -Dm600 -o root -g root workbuddy2api-panel/config.example.json "$pkgdir/etc/wb2api/config.json"

  # systemd 单元 + 运行用户 + 状态目录
  install -Dm644 "$srcdir/wb2api.service"  "$pkgdir/usr/lib/systemd/system/wb2api.service"
  install -Dm644 "$srcdir/wb2api.sysusers" "$pkgdir/usr/lib/sysusers.d/wb2api.conf"
  install -Dm644 "$srcdir/wb2api.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/wb2api.conf"
}

post_install() {
  chgrp wb2api /etc/wb2api/config.json
  chmod 640 /etc/wb2api/config.json
  chown -R wb2api:wb2api /var/lib/wb2api
}

post_upgrade() {
  chgrp wb2api /etc/wb2api/config.json
  chmod 640 /etc/wb2api/config.json
  chown -R wb2api:wb2api /var/lib/wb2api
}
