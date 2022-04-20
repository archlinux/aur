# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=prometheus-nginxlog-exporter
pkgver=1.9.2
pkgrel=2
pkgdesc="Export metrics from Nginx access log files to Prometheus"
url="https://github.com/martin-helmich/prometheus-nginxlog-exporter"
license=('Apache')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('go')
backup=('etc/prometheus-nginxlog-exporter.hcl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/martin-helmich/prometheus-nginxlog-exporter/archive/refs/tags/v$pkgver.tar.gz"
        prometheus-nginxlog-exporter.service
        default-config.hcl)
sha256sums=('94130e24872e3ac0ca66ce31b7b7f740304bd84ce327c64e604ba0677a2fbbe3'
            'ec5d74178cf29f148a9175fa3c6bd93713302ff0612bce1e0f34d6a1126ea206'
            '74c7d2568781d699bddf4d62010d530544f92e5eee18d1da0ecea2eaa7a214b1')
b2sums=('5e67c2c2972776c33e3c08535797cae6874434c3c0af7085d77248c0f37a15d9560a302513d9baed08360051647aa5bdc35f1d9e4ae7498c3a0ab49ffb1bf80d'
        '8e115c173313a545409f7117dcc8627f69310d99702dbba07af6dc5f929fc0236728a24a166053a8211664792712f90ec19dd70c70230f975ed8513975989120'
        'fa0d001b72c43668bdcd3b5a09f3f821249be2f377c0eececbf6ce037f0b9ae9b74c20d4bbbba84145e25f2521e15403a47248acd40991236ac9c5417c11b34b')

build() {
  cd "prometheus-nginxlog-exporter-$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false"

  go build -v -o prometheus-nginxlog-exporter .
}

package() {
  cd "prometheus-nginxlog-exporter-$pkgver"

  install -Dm0755 prometheus-nginxlog-exporter "$pkgdir/usr/bin/prometheus-nginxlog-exporter"

  # install -Dm0644 "$srcdir/snowflake-proxy.service" "$pkgdir/usr/lib/systemd/system/snowflake-proxy.service"
  install -Dm0644 "$srcdir/prometheus-nginxlog-exporter.service" \
    "$pkgdir/usr/lib/systemd/system/prometheus-nginxlog-exporter.service"
  install -Dm0644 "$srcdir/default-config.hcl" "$pkgdir/etc/prometheus-nginxlog-exporter.hcl"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
