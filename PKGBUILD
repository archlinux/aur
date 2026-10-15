# Maintainer: ynk
pkgname=wb2api
pkgver=1.9.2
pkgrel=1
pkgdesc="workbuddy2api panel - Go API panel service"
arch=('x86_64' 'aarch64')
url="https://github.com/linguo2625469/workbuddy2api-panel"
license=('MIT')
makedepends=('go')
backup=('etc/wb2api/config.json')
source=("wb2api-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "wb2api.service"
        "wb2api.sysusers"
        "wb2api.tmpfiles")
sha256sums=('fee235713e997289d4c5a5b151e7e9c092da4442aa3afaee893162527428ab56'
            '3701fc1aa5faffb47be3aa938c798b219f407d26e785d0ec15314af5d79bb215'
            '8184df3096f6a37ebf979a4f7c5d98396e3b6335a6cef0d96b2e921995ca380b'
            '9f860b440f762818220aa000caebabaf54bb545a7b500b6ea966fe3016b08d36')

build() {
  cd "workbuddy2api-panel-$pkgver"
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
  install -Dm755 "workbuddy2api-panel-$pkgver/login.sh"  "$pkgdir/usr/share/wb2api/login.sh"
  install -Dm755 "workbuddy2api-panel-$pkgver/signin.sh" "$pkgdir/usr/share/wb2api/signin.sh"
  install -Dm755 "workbuddy2api-panel-$pkgver/credit.sh" "$pkgdir/usr/share/wb2api/credit.sh"
  install -Dm755 "workbuddy2api-panel-$pkgver/scripts/probe_active.py" "$pkgdir/usr/share/wb2api/scripts/probe_active.py"

  # 默认配置（backup= 声明后，升级时用户改动会被保留为 .pacnew）
  # 打包阶段 wb2api 组尚不存在，属组与权限由 post_install 设置
  install -Dm600 -o root -g root "workbuddy2api-panel-$pkgver/config.example.json" "$pkgdir/etc/wb2api/config.json"

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
