# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ptweezy
_gitname=cronstable
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A modern, container-friendly, optionally-distributed, fault-tolerant, highly available, leader-electing, highly configurable, precompiled, multi-architecture, portable, security-hardened, production-ready cron replacement"

pkgver=1.2.23
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
sha256sums=('c68a531484e7e481406f527c180adb2d0b7c0e37ac91bdd9457477ccfffae375')

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
