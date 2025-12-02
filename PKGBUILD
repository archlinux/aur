# Maintainer: Benjamin Schneider <ben at bens dot haus>

_srcname=alloy
pkgname=grafana-${_srcname}
pkgver=1.12.0
pkgrel=1
pkgdesc='OpenTelemetry Collector distribution with programmable pipelines'
arch=('x86_64' 'aarch64')
url='https://grafana.com/oss/alloy-opentelemetry-collector/'
license=('Apache-2.0')
depends=('glibc')
makedepends=('inetutils' 'git' 'go' 'npm' 'systemd' 'yarn')
backup=("etc/default/${pkgname}" "etc/${pkgname}/config.alloy")
options=('!lto')
source=(git+https://github.com/grafana/alloy.git#tag=v${pkgver}
        ${pkgname}.service ${pkgname}.sysusers ${pkgname}.tmpfiles)
b2sums=('a9709e8e41601c513296a11c3c2d134dd2efbfbcd551fe18895ba9325bb1e4fc5e419272018f1197b313bd187443290b7b2ba9ecf923187a87d756a6578a140c'
        '5a7e4d4f327b56a35e699b6066224b90fb128d108d51753e36259a4bc2f28e12275375f16035d1f3de437bc9da9c44769a4ad60e6d9505b61d0e0f253e1928f0'
        '1a943cf16681e71201eb381d5adc6f8360f8b0a6a8d45cfe54d27199e2ec3a1018274ccac04bc057d2c9c8095ded063eb6a5fd0cdc19953221fba2e15e9f124b'
        'a7219797bedadc3669ec21e12693e366d440720e6cc9c9ae9cf7ed019d0c93858e1fa605455977f0fc210d3228b2419fc22931c9d2af7dc9836ecdd65a8a7b13')

build() {
  # build static assets used by Alloy UI
  # https://github.com/grafana/alloy/tree/main/internal/web/ui
  cd ${_srcname}/internal/web/ui
  go generate -tags builtinassets

  cd ${srcdir}/${_srcname}
  export GOPATH="${srcdir}"
  export GO_TAGS="promtail_journal_enabled,builtinassets"
  make alloy
}

check() {
  cd ${_srcname}
  ./build/alloy --version
}

package() {
  cd ${_srcname}

  install -Dm755 -T build/alloy "$pkgdir/usr/bin/${pkgname}"
  install -Dm755 -d "$pkgdir/etc/${pkgname}"
  install -Dm644 packaging/config.alloy "$pkgdir/etc/${pkgname}"
  sed "s|^CONFIG_FILE=.*$|CONFIG_FILE=\"/etc/${pkgname}\"|g" packaging/environment-file |
    install -Dm644 -T /dev/stdin "$pkgdir/etc/default/${pkgname}"

  install -Dm644 "$srcdir/${pkgname}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "$srcdir/${pkgname}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "$srcdir/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
}
