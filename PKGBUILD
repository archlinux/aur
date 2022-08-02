# Maintainer: RubenKelevra <cyrond@gmail.com>
# Contributor: Francesco Masala <mail@francescomasala.me>

_pkgname=bottles
pkgname=${_pkgname}-fixed
_pkgver_main=2022.7.14
_release_name=brescia
_pkgver_sub=3
pkgver="$_pkgver_main.$_pkgver_sub"
pkgrel=1
pkgdesc='Run Windows software on Linux with Bottles!'
arch=(any)
changelog=changelog.md
url="https://github.com/bottlesdevs/$_pkgname"
license=(GPL3)
depends=(
	# from dependency list
	'python>=3.9'
	'python-yaml>=5.0'
	'python-requests>=2.25'
	'python-urllib3>=1.22'
	'python-chardet>=3.0'
	'python-certifi>=2019.11.28'
	'python-idna>=2.6'
	'python-markdown>=3.1'
	'python-pefile>=2021.9.3'
	'patool>=1.12'

	# not listed as dependency but needed
	python-gobject
	python-orjson
	python-pillow


	# from dependency list
	gtk4
	gtksourceview5
	libadwaita-git

	# unknown
	libportal-gtk4

	# from dependency list
	'cabextract>=1.9.0'
	'p7zip>=16.02'
	xorg-xdpyinfo
	icoextract
	imagemagick

	# runner compabilities
	'libpcap>=1.8'
	'libcapi>=3.2.3'
	lib32-libusb
	libusb
	lib32-faudio
	faudio
	lib32-vkd3d
	vkd3d
	lib32-vulkan-icd-loader
	vulkan-icd-loader
	openldap

	dconf # needed for glib schemas
	hicolor-icon-theme # needed for hicolor theme hierarchy
)
optdepends=(
	'gamemode>=1.6: Support gamemode'
	'gamescope>=3.10: Support gamescope'
	'wine: as runtime alternative'
)
makedepends=(
	'meson'
	'ninja'
)
conflicts=('bottles' 'bottles-git')
provides=('bottles')
source=("${_pkgname}-${_pkgver_main}-${_release_name}-${_pkgver_sub}.tar.gz::$url/archive/refs/tags/${_pkgver_main}-${_release_name}-${_pkgver_sub}.tar.gz")
#source=("${_pkgname}-${_pkgver_main}-${_release_name}-${_pkgver_sub}.tar.gz::$url/archive/refs/tags/${_pkgver_main}-${_release_name}.tar.gz")
b2sums=('d165a18b10484804d6ea89715dc060cd46b07d1fee9f2e31c193cdc2d06509d762c6b5494e1b8a7ac54fe14742a99d2b217297f48eb45e2e316a44717e2baf1e')

build() {
	if [[ -d Bottles ]]; then
		rm -rf Bottles
	fi;
	mv Bottles*/ Bottles/
	cd "Bottles"
	meson --prefix='/usr' build
	ninja -C build
}

package() {
	cd "Bottles"
	DESTDIR="${pkgdir}" ninja -C build install
}
