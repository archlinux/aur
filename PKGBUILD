# Maintainer: Lapo Luchini <lapo@lapo.it>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# Contributor: KawaiDesu <zmey1992@ya.ru>

# Based on https://aur.archlinux.org/victoriametrics.git

pkgname=victoriametrics-agent
_name=VictoriaMetrics
pkgver=1.110.2 # don't forget to update _buildinfo
pkgrel=1
pkgdesc='Agent for Victoria Metrics, a fast, cost-effective and scalable time series database'
_buildinfo=bc69d5f
arch=(x86_64)
url='https://victoriametrics.github.io'
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
conflicts=('vmutils')
backup=('etc/default/victoriametrics-agent')
source=("victoriametrics-$pkgver.tar.gz::https://github.com/VictoriaMetrics/VictoriaMetrics/archive/refs/tags/v$pkgver.tar.gz"
        'victoriametrics-agent.service'
        'victoriametrics-agent.default'
        'victoriametrics.sysusers'
        'victoriametrics-agent.tmpfiles')
b2sums=('f5c56a9f7f8f07a36b37db17f030bd0e2203ff9a0f81c0204af162452f6cc926566a6a97dc76e25d6335a0d34fc335728fff4bedf62731cf66ffefe18178bf48'
        '3d6ed6ecd42dd4fc449de5a601b6977dff6c1e802977710a442fbd422b92b484dbd6f0f8703e2ed5cd394c6b69694f7fa3046062d897f5110b19b585a67dad77'
        'e1344542a24c0039b61bf906fb5270d4d82340dcf0afe8d973ce850587093163454436c9e47ba3793d4796de16a7163ab904311e20bd810a9f97ad949bba72c5'
        'ef92fc1e9be0380fb7781d553ac0d967e880bfab33d22842aed23cf88ca247c3f2e1fcddfc1e503f3ec51c0977749b8fa7b01d768dc9a59a679fc80743187e0e'
        '9b2c61b4e5002daafc1f2ea7e75249bed1c8e61e6bbd1a63b4a484a3f0cdd12b5c47da4c79427469c52dc0d0db09473b4ecaa3576ee338a0dcd2f0206ad289d5')
_date=$(date -ur PKGBUILD +'%Y%m%d-%H%M%S')

build() {
  cd $_name-$pkgver
  CGO_ENABLED=1 GOOS=linux GOARCH=amd64 \
    go build -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-w -X github.com/VictoriaMetrics/VictoriaMetrics/lib/buildinfo.Version=vmagent-$_date-tags-v$pkgver-0-g$_buildinfo" \
      -o bin/vmagent \
      ./app/vmagent
}

check() {
  cd $_name-$pkgver
  go test ./app/vmagent
}

package() {
  install -Dm 755 $_name-$pkgver/bin/vmagent -t "$pkgdir"/usr/bin/
  install -Dm 644 victoriametrics-agent.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm 644 victoriametrics-agent.default "$pkgdir"/etc/default/victoriametrics-agent
  install -Dm 644 victoriametrics.sysusers "$pkgdir"/usr/lib/sysusers.d/victoriametrics.conf
  install -Dm 644 victoriametrics-agent.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/victoriametrics-agent.conf
}

# vim:set ts=2 sw=2 et:
