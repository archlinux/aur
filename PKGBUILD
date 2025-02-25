# Maintainer: Morbius <archlinux@seichter.de>
# vim: noet
# shellcheck shell=bash disable=2034

pkgname="automx2"
pkgver="2025.1.1"
pkgrel=2
pkgdesc="Mail User Agent (email client) configuration made easy"
backup=("etc/automx2/automx2.conf")
install="install.sh"
depends=("python"
	"python-flask"
	"python-flask-migrate"
	"python-flask-sqlalchemy>=3.1.1"
	"python-ldap3"
	"python-sqlalchemy>=2.0.31")
makedepends=("python-build" "python-installer" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	"automx2.conf"
	"automx2.service")
b2sums=('d43f25ed9da96b647b6cecaaf279b05238336c938be2e3f1d77e9ac7165bbc8df84548581cbe96f643e1881d2b5b92d55dbb8886a40889a849b7b1c1bb3174eb'
	'e7afbacc9166556323f1c46f7bf65a906725cfce31f774f5bd47a5ab32102dacfd318c65c8524cf963918178097f8643b597c72db9514e131ee35d21e05240ce'
	'b542063ed441dbcfb6c23a8bec997177176d102f9e97bb1d6f97ad84b8f9336ee14556138fc24b24d9ee4a21700b7e4cceb99e53f3cb0201590f489d718f8163')
arch=("any")
license=("GPL-3.0-or-later")
url="https://rseichter.github.io/automx2/"

build() {
	pushd >/dev/null "${pkgname}-${pkgver}" || exit 1
	python -m build --wheel
	popd >/dev/null || exit 1
}

check() {
	pushd >/dev/null "${pkgname}-${pkgver}" || exit 1
	AUTOMX2_CONF=tests/unittest.conf PYTHONPATH=.:src python -m unittest discover tests/
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
