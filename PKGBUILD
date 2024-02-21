# Maintainer: Morbius <archlinux@seichter.de>

pkgname="automx2"
pkgver="2024.1"
pkgrel=1
pkgdesc="Mail User Agent (email client) configuration made easy"
backup=("etc/automx2/automx2.conf")
install="install.sh"
depends=("python" "python-flask" "python-flask-migrate" "python-flask-sqlalchemy" "python-ldap3")
makedepends=("python-build" "python-installer" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "automx2.conf"
        "automx2.service")
b2sums=('9608fc25e2237aedfe1c71ebda981df159713066365712c94b49b83897b73f75fbafe83655b76afe860d9000d8bd1bb2e63c245cca6ba0710bbf391a7f545e81'
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

check() {
	pushd >/dev/null "${pkgname}-${pkgver}" || exit 1
	RUN_LDAP_TESTS=0 AUTOMX2_CONF=tests/unittest.conf python -m unittest discover -v tests/
	popd >/dev/null || exit 1
}

# shellcheck disable=SC2154
package() {
	pushd >/dev/null "${pkgname}-${pkgver}" || exit 1
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m 0644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
	install -D -m 0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	local x
	for x in README* docs/*; do
		install -D -m 0644 "${x}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename "${x}")"
	done
	popd >/dev/null || exit 1
}
