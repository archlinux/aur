# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: KawaiDesu <zmey1992@ya.ru>

pkgname=victoriametrics
_name=VictoriaMetrics
pkgver=1.121.0
pkgrel=1
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
b2sums=('0a276f32788a325b0cfbcb6cc40275b1e64687e5c461f6e9c734a333a81c0ad90376473959ffca5713814c322740077c652774e828cb06f80683e3dcbce4a477'
        '82b1c2b55b3c9f3d4deee12753820247ba1f4ac28a94cf16dad31ce091306875d392f7a7a0a56029d88101d7e75f7fefec392ac50d2447276850476f773d147d'
        '4405dc19795d2cbfa515e4750a2cad77c13611293176ff5aeec597f9905494902bd4496c1e90f1efe2d484e383adb39d034167673b9fe7de8b307b8cedf17b7f')

_vmapps=(victoria-logs victoria-metrics vmagent vmalert vmalert-tool vmauth vmbackup vmctl vmrestore)

build() {
  cd $_name-$pkgver
  CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}" \
  
  go build -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X github.com/VictoriaMetrics/VictoriaMetrics/lib/buildinfo.Version=$pkgver" \
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
