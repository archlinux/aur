# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=fw-fanctrl
pkgver=1.1.0
_gittag="v${pkgver}"
_gitprefix="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="A simple systemd service to better control Framework Laptop's fan(s)"
arch=(any)
url="https://github.com/TamtamHero/${pkgname}"
_giturl="${url}.git"
license=('BSD-3')
groups=()
depends=('python>=3.12' python-watchdog framework-system python-jsonschema)
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
sha512sums=('1854eff1602d783d584b6859fb8229867ff3a835f21b6b67c75a29ce607dac05f4b8d4ffd014e05a09c9e44cef1c0fdfb3f03fac6a5bfa5b8b15d441e83370dc')
b2sums=('41c724ad097b661a197ebf10f0f088a67c696e51e5362b3293c94b56612103a93dcbbee9c32d8ebfc90413668caee61a12942fee0663d9ab4135d34fc3199f00')

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
		--ignore-tool framework_tool \
		--no-pip-install \
		--no-pre-uninstall \
		--no-post-install \
		--no-sudo

	python -m installer --destdir "${pkgdir}" "${srcdir}"/*.whl
	rm "${srcdir}"/*.whl

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
