# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ptweezy
_gitname=cronstable
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A modern, container-friendly, optionally-distributed, fault-tolerant, highly available, leader-electing, highly configurable, precompiled, multi-architecture, portable, security-hardened, production-ready cron replacement"

pkgver=1.2.49
pkgrel=1
_gitversion=${pkgver}

arch=('any')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('bash' 'python' 'python-uvloop' 'python-psutil' 'python-strictyaml' 'python-sentry_sdk' 'python-orjson' 'python-aiohttp' 'python-jinja' 'python-aiosmtplib')

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b59a091487f6ce8142ccb6bafb9594ee69c500e96e69e722ccfdfb52da57a14d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -dm755 "${pkgdir}/usr/share/${_appname}/examples/"
	cp -rf ./example/* "${pkgdir}/usr/share/${_appname}/examples/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
