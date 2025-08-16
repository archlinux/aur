# Maintainer: Toby Vincent <tobyv@tobyvin.dev>

pkgname=scraparr
pkgver=2.2.3
pkgrel=2
pkgdesc='Prometheus Exporter for *Arr Suite'
arch=('any')
url='https://github.com/thecfu/scraparr'
license=('GPL-3.0-only')
depends=('python>=3.12'
         'python-prometheus_client'
         'python-requests'
         'python-werkzeug'
         'python-dateutil'
         'python-yaml'
         'python-dotenv')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools')
backup=('etc/scraparr/config.yaml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha256sums=('0d835ff1bd1d0114c62be5015f5c5294e14eb999a0112fb29111b469f072b5fa'
            '729ccee390f75e399757cdab5f7eb6ccb88f2430360381a91bc741cecc8d9497'
            '67dd3e2e2f7f75bcfe3d2fc3f54117bb604af2ec968c91cfb96a2b79faf0a774'
            'fa637aa2345cb15a6deb8db11001454c97ccb56198581a4b226cd8fcf8cab479')

prepare() {
	cd "$pkgname-$pkgver"
	sed 's%/scraparr/config/config.yaml%/etc/scraparr/config.yaml%' \
		-i src/scraparr/scraparr.py
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 config.yaml "${pkgdir}/etc/scraparr/config.yaml"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/scraparr/README.md"
	install -Dm644 "${srcdir}/$pkgname.service" "${pkgdir}/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "${srcdir}/$pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "${srcdir}/$pkgname.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
}
