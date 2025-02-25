# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=fw-fanctrl
pkgver=1.0.0
_gittag="v${pkgver}"
_gitprefix="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="A simple systemd service to better control Framework Laptop's fan(s)"
arch=(any)
url="https://github.com/TamtamHero/${pkgname}"
_giturl="${url}.git"
license=('BSD-3')
groups=()
depends=('python>=3.12' python-watchdog fw-ectool-git)
makedepends=('git' 'python-setuptools>=75.2.0' 'python-build' 'python-installer' 'python-wheel' 'python-jsonschema')
provides=()
conflicts=()
replaces=()
backup=(etc/fw-fanctrl/config.json)
options=()
install=
source=(
	# Source archive
	"${_gitprefix}.tar.gz::https://github.com/TamtamHero/fw-fanctrl/archive/refs/tags/${_gittag}.tar.gz"

	# Patches
	"https://github.com/TamtamHero/fw-fanctrl/commit/ade64de1986184764fcae0c92dc952af107c5c01.patch"
)
noextract=()
sha512sums=('7e45f466ccc6dd0eba75f599a3f3063352def57e754108158b258c141228964566fba8e62e04081d503ffba3abaebcf26098b7f96058ca9dcdf95fc189e2b6d4'
            '941d627e0957fe66836ae0b84cf59c7578d8b7e6e50e36c8d159c4ecbb95ae40e5893cdee3b336acaf213968fbc722af95e6203e9556c69b61e765bf1eba2ee0')
b2sums=('4f23e624d84b526e4b60755fc923396158ee67da787081f114e8bd0ac2c25087bb4af4b2707c7c7a0f9e5e9ffc17d07b664393d3ea14413263a4a7a1e91f305e'
        '9d6747a7d9e11133911e883a560f66a1241d0cbdcf650c26b869b7e474c8affb856f43cef32bdca1a07259100016cd06ac83ee2fbef6ab5f719441da30533118')

prepare() {
	cd "${srcdir}/${_gitprefix}"
	patch -Np1 -i "${srcdir}/ade64de1986184764fcae0c92dc952af107c5c01.patch"
}

build() {
	cd "${srcdir}/${_gitprefix}"

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_gitprefix}"

	# we run this install script just to have config + systemd services in place
	./install.sh \
		--dest-dir "${pkgdir}" \
		--prefix-dir "/usr" \
		--sysconf-dir "/etc" \
		--no-ectool \
		--no-pip-install \
		--no-pre-uninstall \
		--no-post-install

	python -m installer --destdir "${pkgdir}" dist/*.whl

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
