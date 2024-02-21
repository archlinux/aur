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
        'd3e760a538be4b8a87c0b00161d8e45e11331280badeae1f0a8bf26cc40f3a4b50237e9851cd73ab82b712a9bf7388c9ce8c71ddb64dc971c7d3dd0aa0612240')
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
	AUTOMX2_CONF=tests/unittest.conf python -m unittest discover -v tests/
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
