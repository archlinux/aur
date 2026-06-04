# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=fw-fanctrl
pkgver=1.0.5
_gittag="v${pkgver}"
_gitprefix="${pkgname}-${pkgver}"
pkgrel=1
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
sha512sums=('6ad9e83e5737b0ad4e8e6d67c00151c4a0d3e889d7aa2975ffd92e46881976529279dc01084b5b3299561e5ed8b25abc02f5051f26a558b0ed317ada038d5af1')
b2sums=('54373fc9c01a810d6acb69920789ba551bd2797650f9ed030ab206f06ba26f647b0a111e6d4eb617e18fa47724db1e47149442ade60016911753ae0267f05ab0')

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
