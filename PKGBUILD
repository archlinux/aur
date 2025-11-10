# Maintainer  : Yurii Kolesnykov <root@yurikoles.com>
# Contributor : Thaodan          <AUR+me@thaodan.de>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>
#
# Pull requests are welcome here: https://github.com/yurikoles-aur/osc

pkgname=osc
pkgver=1.22.0
pkgrel=1
pkgdesc='Command line client for the openSUSE Build Service'
arch=(any)
url='https://github.com/openSUSE/osc'
license=('GPL-2.0-or-later')
depends=(
	'diffstat'
	'python'
	'python-cryptography'
	'python-urllib3'
	'python-distro'
	'python-ruamel-yaml'
)
makedepends=(
	'python-setuptools'
)
optdepends=(
	'obs-build: required to run local builds'
	'obs-service-format_spec_file: for running the format_spec_file source service'
	'obs-service-download_files: for running the download_files source service'
	'python-keyring: keyring support'
	'python-progressbar: progressbar support for operations like uploading and services'
)
conflicts=(
	'osc-git'
	'osc-bash-completion'
	'zsh-completion-osc'
)
replaces=(
	'osc-bash-completion'
	'zsh-completion-osc'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
sha256sums=('5ffcda4aef9d27bfaccbbbb196ed32d1cb1c7870b940b04dfc8f0fdbd4dde479')

prepare() {
	cd "${pkgname}-${pkgver}"

	local src
	for src in "${source[@]}"; do
		src="${src%%::*}"
		src="${src##*/}"
		[[ $src = *.patch ]] || continue
		echo "Applying patch $src..."
		patch -Np1 < "../$src"
	done

	# Fix version
	sed -e "s/    version = \"%(describe:tags=true)\"/    version = \"${pkgver}\"/"  \
		-i osc/util/git_version.py
}

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

check() {
	cd "${pkgname}-${pkgver}"
	python -m unittest -b
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --prefix=/usr
	install -Dm644 contrib/complete.sh "${pkgdir}/usr/share/bash-completion/completions/osc"
	install -Dm755 contrib/osc.zsh "${pkgdir}/usr/share/zsh/functions/Completion/_osc"
}
