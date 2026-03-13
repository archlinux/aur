# Maintainer: Morbius <archlinux@seichter.de>
# vim: noet
# shellcheck shell=bash disable=2034

pkgname="automx2"
pkgver="2026.1"
pkgrel=2
pkgdesc="Mail User Agent (email client) configuration made easy"
backup=("etc/automx2/automx2.conf")
depends=("python"
	"python-flask"
	"python-flask-migrate"
	"python-flask-sqlalchemy>=3.1.1"
	"python-ldap3"
	"python-sqlalchemy>=2.0.31")
makedepends=("grep" "python-build" "python-installer")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	"automx2.conf"
	"automx2.service"
	"automx2.sysusers"
	"automx2.tmpfiles")
b2sums=('fe0a363bfbdddb3ad5cf1b06bdc8c15767d985258728b529dfa6c1df2d47a8f31de2f8eb7d7123dd710d5b73899a03bf206493b93d00d72b37705a8a4fd5950c'
	'e7afbacc9166556323f1c46f7bf65a906725cfce31f774f5bd47a5ab32102dacfd318c65c8524cf963918178097f8643b597c72db9514e131ee35d21e05240ce'
	'b542063ed441dbcfb6c23a8bec997177176d102f9e97bb1d6f97ad84b8f9336ee14556138fc24b24d9ee4a21700b7e4cceb99e53f3cb0201590f489d718f8163'
	'711dfeffbb4f10a323b6cd2a375e00f9b012598a94918baf036373b259ac416833a2a8143107209be5009a7550c40cbf9d3cab98cf89a8a628e112d9fb12dff6'
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
