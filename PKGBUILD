# Maintainer: tinywrkb <tinywrkb@gmail.com>
_pkgname='code-server'
pkgname="${_pkgname}-git"
pkgver=1.1156.vsc1.33.1.r17.g72d7166
pkgrel=2
pkgdesc='Run VS Code on a remote server'
arch=('x86_64')
url='https://coder.com/'
license=('MIT')
depends=('net-tools')
makedepends=('git' 'npm' 'yarn' 'python2' 'ts-node')
provides=('code-server')
conflicts=('code-server')
source=("${_pkgname}::git+https://github.com/cdr/${_pkgname}.git"
		"${_pkgname}.service"
		"${_pkgname}@.service")
sha256sums=('SKIP'
			'eb300ec83ab6b345669e147a532032755a04f2fd118c0aa740a43f13bdea57d4'
			'ba564da247380f485f9d8cfdacb048cf4bb59947b7ad69d8922e890a7d5e2652')
options=(!strip)

pkgver() {
	cd ${_pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# set build environment

	# yarn
	# yarn fails if it can't access ~/.yarnrc so point HOME to srcdir
	export HOME="${srcdir}"
	#export YARN_USE_YARNRC="${srcdir}"/yarnrc
	export YARN_CACHE_FOLDER="${srcdir}"/yarn-cache
	export YARN_PREFIX="${srcdir}"/yarn

	# npm
	# ignore user npm settings
	unset NPM_CONFIG_USERCONFIG

	export NPM_CONFIG_CACHE="${srcdir}"/npm-cache
	export NPM_CONFIG_DEVDIR="${srcdir}"/node-gyp
	export NPM_CONFIG_PREFIX="${srcdir}"/node

	# get the right nodejs version, without it the terminal is broken
	npm install -g n
	export NODE_PATH="${srcdir}"/node/lib/node_modules:"${NODE_PATH}"
	export PATH="${srcdir}"/node/bin:"${PATH}"
	export N_PREFIX="${srcdir}"/node
	n $(cat "${srcdir}"/${_pkgname}/.node-version)

	# get print-arch
	npm install -g print-arch
}

build() {
	cd ${_pkgname}
	yarn
	npm rebuild
	NODE_ENV=production VERSION=${pkgver} yarn task build:server:binary
	yarn task package ${pkgver}
}

package() {
	# re-export for print-arch
	export NODE_PATH="${srcdir}"/node/lib/node_modules:"${NODE_PATH}"
	export PATH="${srcdir}"/node/bin:"${PATH}"

	cd ${_pkgname}/release/${_pkgname}${pkgver}-linux-$(print-arch|sed -n 's/arch: //p')
	install -Dm755 ${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
	install -Dm644 README.md "${pkgdir}"/usr/share/doc/${_pkgname}/README.md
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
	install -Dm644 "${srcdir}"/${_pkgname}.service "${pkgdir}"/usr/lib/systemd/user/${_pkgname}.service
	install -Dm644 "${srcdir}"/${_pkgname}@.service "${pkgdir}"/usr/lib/systemd/system/${_pkgname}@.service
}
