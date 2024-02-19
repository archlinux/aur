# Maintainer: Morbius <archlinux@seichter.de>

pkgname=automx2
pkgver=2022.1
pkgrel=1
pkgdesc="Mail User Agent (email client) configuration made easy"
backup=("etc/automx2/automx2.conf")
install="install.sh"
depends=("python" "python-flask" "python-flask-migrate" "python-flask-sqlalchemy" "python-ldap3")
# depends=("python" "python-hatchling" "python-flask" "python-flask-migrate" "python-flask-sqlalchemy" "python-ldap3" "python-werkzeug" "python-sqlalchemy" "python-alembic" "python-lxml")
makedepends=("python-build" "python-installer" "python-wheel")
# makedepends=("python-build" "python-installer" "python-wheel" "python-pytest" "python-pytest-flask" "python-coverage")
# optdepends=("python-mysqlclient")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "automx2.conf"
        "automx2.service")
b2sums=('691ff333188d104f93f7cf9ee45d15d99212464a125bb4190341dda6b8165bd564d5b26b1e997ece8139606177e74caf24afe70a06786695c3f7fa21bec74c57'
        'e7afbacc9166556323f1c46f7bf65a906725cfce31f774f5bd47a5ab32102dacfd318c65c8524cf963918178097f8643b597c72db9514e131ee35d21e05240ce'
        'add8bc242881dcb65f44c3d3c88f32818da01b6a1cec4e99f4c7665d9e7a36c59443a5cc6a8a04d70500d232d09be09eeb544c4da9fa70ec40be945ee0257be9')
arch=("any")
license=("GPL3")
url="https://github.com/rseichter/automx2"
documentation="https://rseichter.github.io/automx2/"

build() {
	pushd >/dev/null "${pkgname}-${pkgver}" || exit 1
	python -m build --wheel --no-isolation
	popd >/dev/null || exit 1
}

# shellcheck disable=SC2154
package() {
	pushd >/dev/null "${pkgname}-${pkgver}" || exit 1
	python -m installer --destdir="$pkgdir" dist/*.whl
	mkdir -p "$pkgdir/etc/automx2"
	install -Dm644 "${srcdir}/automx2.conf" "${pkgdir}/etc/automx2/automx2.conf"
	install -Dm644 "${srcdir}/automx2.service" "${pkgdir}/usr/lib/systemd/system/automx2.service"
	popd >/dev/null || exit 1
}
