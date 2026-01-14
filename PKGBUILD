# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=fw-fanctrl
pkgver=1.0.4
_gittag="v${pkgver}"
_gitprefix="${pkgname}-${pkgver}"
pkgrel=2
pkgdesc="A simple systemd service to better control Framework Laptop's fan(s)"
arch=(any)
url="https://github.com/TamtamHero/${pkgname}"
_giturl="${url}.git"
license=('BSD-3')
groups=()
depends=('python>=3.12' python-watchdog fw-ectool-git python-jsonschema)
makedepends=('git' 'python-setuptools>=75.2.0' 'python-build' 'python-installer' 'python-wheel')
provides=()
conflicts=()
replaces=()
backup=(etc/fw-fanctrl/config.json)
options=()
install=
source=(
  # Source archive
  "${_gitprefix}.tar.gz::https://github.com/TamtamHero/fw-fanctrl/archive/refs/tags/${_gittag}.tar.gz"
)
noextract=()
sha512sums=('ed33709cb7d12e6b89aebbf38b2a2bbcdf4ed23f5f419c4b79eade9b14fecdf1ad9c29cdaabc5e094381cfaf8bb91c8093602a36ae4f927a3568f37a86823b4f')
b2sums=('8628340b752f90214f8903103beed0e411efb67e7830625c130f8fd92e0be86da9cd2c0d3be732fc99dd1c04eb9754e0a0440bff7409fb6b8307a0e7fd813ba1')

build() {
	cd "${srcdir}/${_gitprefix}"

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_gitprefix}"

	cp "${srcdir}/${_gitprefix}/dist"/*.whl "${srcdir}"

	# we run this install script just to have config + systemd services in place
	./install.sh \
		--dest-dir "${pkgdir}" \
		--effective-installation-dir "/usr/bin" \
		--python-prefix-dir "${pkgdir}/usr" \
		--prefix-dir "/usr" \
		--sysconf-dir "/etc" \
		--no-ectool \
		--no-pip-install \
		--no-pre-uninstall \
		--no-post-install \
		--no-sudo

	python -m installer --destdir "${pkgdir}" "${srcdir}"/*.whl
	rm "${srcdir}"/*.whl

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
