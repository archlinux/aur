# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: KawaiDesu <zmey1992@ya.ru>

pkgname=victoriametrics
_name=VictoriaMetrics
pkgver=1.127.0
pkgrel=2
pkgdesc='Fast, cost-effective and scalable time series database'
arch=(x86_64)
url='https://victoriametrics.github.io'
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
backup=('etc/default/victoriametrics')
source=("$pkgname-$pkgver.tar.gz::https://github.com/VictoriaMetrics/VictoriaMetrics/archive/refs/tags/v$pkgver.tar.gz"
  'victoriametrics.service'
  'victoriametrics.default')
b2sums=('f4eba0afaac184001dcd40c049a6be8bd2ba361dd75ff99f3c0c1d0739a262fea0f484a75e549c9353816cfa37a9ff4bd9b32160f0349cb2c81fc819a93252e3'
  '82b1c2b55b3c9f3d4deee12753820247ba1f4ac28a94cf16dad31ce091306875d392f7a7a0a56029d88101d7e75f7fefec392ac50d2447276850476f773d147d'
  '4405dc19795d2cbfa515e4750a2cad77c13611293176ff5aeec597f9905494902bd4496c1e90f1efe2d484e383adb39d034167673b9fe7de8b307b8cedf17b7f')

_vmapps=(victoria-metrics vmagent vmalert vmalert-tool vmauth vmbackup vmctl vmrestore)

build() {
  cd $_name-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -X github.com/VictoriaMetrics/VictoriaMetrics/lib/buildinfo.Version=$pkgver" \
    -o bin/ \
    ${_vmapps[@]/#/.\/app\/}
}

check() {
  cd $_name-$pkgver
  go test ${_vmapps[@]/#/.\/app\/}
}

package() {
  for app in ${_vmapps[@]}; do
    install -Dm 755 $_name-$pkgver/bin/$app -t "$pkgdir"/usr/bin/
  done
  install -Dm 644 victoriametrics.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm 644 victoriametrics.default "$pkgdir"/etc/default/victoriametrics
}

# vim:set ts=2 sw=2 et:
