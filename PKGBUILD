# Maintainer: Mathieu Clabaut <mathieu[at]clabaut.net>

pkgname=grok-exporter
_pkgname=grok_exporter
pkgver=0.2.6
pkgrel=1
pkgdesc="Export Prometheus metrics from arbitrary unstructured log data (from
binary release)."

arch=('x86_64' 'arm' 'armv7h' 'armv6h')
url="https://github.com/fstab/grok_exporter"
license=('Apache')
depends=('oniguruma>=6.1.1')
makedepends=('go' 'git')
backup=('etc/prometheus/grok.yml')
provides=('grok-exporter')
conflicts=('grok-exporter')
source=( 'grok-exporter.service' 'config.yml'
"$_pkgname-$pkgver::git+${url}#tag=v${pkgver}")

prepare() {
   cd "$srcdir/$_pkgname-$pkgver" || exit 1
   git submodule update --init --recursive
   export GOPATH="$srcdir/gopath"
   mkdir -p "$GOPATH/src/github.com/fstab"
   rm -f "$GOPATH/src/github.com/fstab/$_pkgname"
   ln -sr "$srcdir/$_pkgname-$pkgver" "$GOPATH/src/github.com/fstab/$_pkgname"
}

build() {
    export GOPATH="$srcdir/gopath"
    export GOBIN="$GOPATH/bin"
    cd "$GOPATH/src/github.com/fstab/$_pkgname" || exit 1
    go install
 }

check() {
   export GOPATH="$srcdir/gopath"
   export GOBIN="$GOPATH/bin"
   cd "$GOPATH/src/github.com/fstab/$_pkgname" || exit 1
   go test
}

package() {
    cd "${srcdir}/$_pkgname-${pkgver}"

    # Install Binary
    install -D -m0755 "$srcdir/gopath/bin/$_pkgname" \
        "${pkgdir}/usr/bin/grok_exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/grok-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/grok-exporter.service"
    #Install example configuration
    install -D -m0644 "${srcdir}/config.yml" \
        "${pkgdir}/etc/prometheus/grok.yml"
    #Install patterns
    install -d   "${pkgdir}/usr/lib/grok-exporter/"
    cp -r "${srcdir}/grok_exporter-${pkgver}/logstash-patterns-core/patterns" \
        "${pkgdir}/usr/lib/grok-exporter/patterns"
    chmod 0644   "${pkgdir}/usr/lib/grok-exporter/patterns/"*
}
md5sums=('f092982797ca0f1128382a712c1db0da'
         '39ae997b03a1a35490c74eb3fcd8c3a4'
         'SKIP')
