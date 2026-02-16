# Maintainer: Harry Youd <harry at youd dot family>
pkgname=certbot-dns-hetzner-cloud
pkgdesc="Certbot plugin enabling dns-01 challenge on the Hetzner Cloud API"
pkgver=1.0.5
pkgrel=2
arch=("any")
url="https://github.com/rolschewsky/certbot-dns-hetzner-cloud"
license=("MIT")
depends=("certbot" "python-tldextract" "python-hcloud")
checkdepends=("python-pytest" "python-installer")
makedepends=("python-setuptools-scm" "python-wheel" "python-build")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('885482853280751dfbab8dc8fd2914b33fdc27893d8326eba3c72770ea0dd9ca')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	rm -rf test-env
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -P -m pytest -o addopts=""
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
