pkgname=companion
pkgver=2.4.1
pkgrel=1
pkgdesc="Control software for the Elgato Streamdeck with a focus on broadcasting."
arch=('i386' 'x86_64')
url="https://github.com/bitfocus/companion"
license=('custom')
depends=('gtk3' 'alsa-lib' 'nss')
makedepends=('nvm' 'git' 'zip')
install=companion.install

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitfocus/companion/archive/refs/tags/v${pkgver}.tar.gz"
		"50-bitfocus-companion.rules"
		"bitfocus-companion.desktop")

sha256sums=('004fd0fa5ab44f42fe6f5ed260771f830633cb5a579d635767957cd126122a09'
            'c0e7cd1f730a7b4381e654b53f6fdd1c06911b2593bdfe07bba5e198fc61d5d9'
            '65289895360dae94dd710e6804709c1e3f95e6bc275b1621cb88eb8a7cbd348f')

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    
    export PATH="$(npm bin):${PATH}"
    export SHARP_IGNORE_GLOBAL_LIBVIPS=yes
    export YARN_CACHE_FOLDER="${srcdir}/yarn"
}

prepare() {
	_ensure_local_nvm

	rm -Rf "${srcdir}/npm"
	mkdir "${srcdir}/npm"
	rm -Rf "${srcdir}/yarn"
	mkdir "${srcdir}/yarn"

	cd "${srcdir}/${pkgname}-${pkgver}"

	nvm install
	npm config set cache "${srcdir}/npm"
	npm install -g node-gyp
	npm install -g yarn
}

build() {
	_ensure_local_nvm

	cd "${srcdir}/${pkgname}-${pkgver}"

	rm -rf electron-output

	yarn --frozen-lockfile
	yarn --frozen-lockfile --cwd webui --ignore-engines

	yarn run dist
}


package() {
	cd "${srcdir}"

	builddir="${pkgname}-${pkgver}/electron-output/linux-unpacked"

	# Licenses
	install -Dm644 "${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${builddir}/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${builddir}/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# Companion
	install -d "${pkgdir}/usr/lib/bitfocus-companion"

	cp -R "${builddir}"/* "${pkgdir}/usr/lib/bitfocus-companion"

	# Install bin symlink
	install -d "${pkgdir}/usr/bin"
	ln -sv "/usr/lib/bitfocus-companion/companion" "${pkgdir}/usr/bin/companion"

	# udev rules
	install -Dm644 50-bitfocus-companion.rules -t "${pkgdir}/etc/udev/rules.d/"

	# Desktop file
	install -Dm644 bitfocus-companion.desktop -t "${pkgdir}/usr/share/applications/"

	# Icon
	install -Dm644 "${pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bitfocus-companion.png"
}