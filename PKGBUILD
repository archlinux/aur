# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=prometheus-nginxlog-exporter
pkgver=1.11.0
pkgrel=1
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
sha256sums=('e560a5c4b4eba03c4126b0350cecef09371675a22d0033e3bf7bed754ba15760'
            'ec5d74178cf29f148a9175fa3c6bd93713302ff0612bce1e0f34d6a1126ea206'
            '74c7d2568781d699bddf4d62010d530544f92e5eee18d1da0ecea2eaa7a214b1')
b2sums=('66b09a1753bb9aa7f6269600bd699ff057c5c9849792866b2c771fe27806357e85b6ad8ff7ad306e93a77105789df8ccce9747c56d013db7e189018d992686a9'
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
