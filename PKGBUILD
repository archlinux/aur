# Maintainer: Morbius <archlinux@seichter.de>
# vim: noet
# shellcheck shell=bash disable=2034

pkgname="automx2"
pkgver="2026.2"
pkgrel=2
pkgdesc="Mail User Agent (email client) configuration made easy"
backup=("etc/automx2/automx2.conf")
depends=("python"
	"python-asgiref"
	"python-flask"
	"python-flask-sqlalchemy-lite"
	"python-ldap3"
	"python-sqlalchemy>=2.0.31")
makedepends=("grep" "python-build" "python-installer")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	"automx2.conf"
	"automx2.service"
	"automx2.sysusers"
	"automx2.tmpfiles")
b2sums=('c79923dae82c5d3c4abc79c71b7be168534027a01e395d72e4854f9123c870a2da64de0dcb9ebe1f059477c7569d6b129f79a92baf534c9fabaebb4599164b3f'
	'e7afbacc9166556323f1c46f7bf65a906725cfce31f774f5bd47a5ab32102dacfd318c65c8524cf963918178097f8643b597c72db9514e131ee35d21e05240ce'
	'b542063ed441dbcfb6c23a8bec997177176d102f9e97bb1d6f97ad84b8f9336ee14556138fc24b24d9ee4a21700b7e4cceb99e53f3cb0201590f489d718f8163'
	'689b5c65aa29b536a8a2097b66e963457e52a2917fc77fee60f81287ba1b271cc2a8cfc6f002085af0fb13370834d9d669c786c219ad14c0d687a4cd5fa6af1f'
	'0446cc3a89e3bd91c9476a564336672edbc3c583e0db1511528f6e82cceff3d5d437620b215dfeba38506ede24cc9379d87810f52763c1dad5d356bbe30c6503')
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
	install -D -m 0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -D -m 0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	local x
	for x in README* docs/*; do
		install -D -m 0644 "${x}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename "${x}")"
	done
	popd >/dev/null || exit 1
}
