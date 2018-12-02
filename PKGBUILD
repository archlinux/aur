# Maintainer: Mathieu Clabaut <mathieu[at]clabaut.net>

pkgname=grok-exporter-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="Export Prometheus metrics from arbitrary unstructured log data (from
binary release)."

arch=('x86_64')
url="https://github.com/fstab/grok_exporter"
license=('Apache')
depends=()
makedepends=()
backup=('etc/prometheus/grok.yml')
provides=('grok-exporter')
conflicts=('grok-exporter')
source=( 'grok-exporter.service' 'config.yml' )
source_x86_64=("${url}/releases/download/v${pkgver}/grok_exporter-${pkgver}.linux-amd64.zip")

package() {
	case "$CARCH" in
		'x86_64') ARCH='amd64';;
		'arm') ARCH='armv5';;
		'armv6h') ARCH='armv6';;
		'armv7h') ARCH='armv7';;
		'aarch64') ARCH='arm64';;
    esac
    cd "${srcdir}/grok_exporter-${pkgver}.linux-${ARCH}"

    # Install Binary
    install -D -m0755 grok_exporter \
        "${pkgdir}/usr/bin/grok_exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/grok-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/grok-exporter.service"
    #Install example configuration
    install -D -m0644 "${srcdir}/config.yml" \
        "${pkgdir}/etc/prometheus/grok.yml"
    #Install patterns
    install -d   "${pkgdir}/usr/lib/grok-exporter/"
    cp -r "${srcdir}/grok_exporter-${pkgver}.linux-amd64/patterns" \
        "${pkgdir}/usr/lib/grok-exporter/patterns"
    chmod 0644   "${pkgdir}/usr/lib/grok-exporter/patterns/"*
}
sha256sums=('437bba954223ee8cf4a5d2afd458cb4fec15c7d8cb4d62d75112c5a41370e0f2'
            '4ac1bfc24c0dd065883b5b75f811ecf16882fc73f53b5d50389ba29e93f40828')
sha256sums_x86_64=('b3b4e7aaa8363d35ca2fb1c8dcfacfe58d104d8a103055ecbdc51f52edf89a5d')
