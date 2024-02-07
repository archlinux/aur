pkgname=companion
pkgver=3.2.0
pkgrel=1
pkgdesc="Control software for the Elgato Streamdeck with a focus on broadcasting."
arch=('x86_64' 'aarch64')
url="https://github.com/bitfocus/companion"
license=('custom')
depends=('gtk3' 'alsa-lib' 'nss' 'hicolor-icon-theme' 'libusb')
makedepends=('nvm' 'git' 'zip' 'python>=3.10.0')
install=companion.install

source=("${pkgname}-${pkgver}::git+https://github.com/bitfocus/companion.git#tag=v${pkgver}"
		"companion_headless.sh"
		"bitfocus-companion.desktop")

sha256sums=('SKIP'
            '56b46d5369bdae8ef83d244b86002a3f2e354e68c6706d884eb09233c4e6df79'
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

	# Init submodules
	git submodule update --init

	nvm install
	npm config set cache "${srcdir}/npm"
	npm install -g node-gyp
	npm install -g yarn
}

build() {
	_ensure_local_nvm

	cd "${srcdir}/${pkgname}-${pkgver}"

	rm -rf electron-output

	CI=1 ./tools/yarn.sh

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

	rm -f "${pkgdir}/usr/lib/bitfocus-companion/resources/node-runtime/bin/npm"
	rm -f "${pkgdir}/usr/lib/bitfocus-companion/resources/node-runtime/bin/npx"

	rm -f "${pkgdir}/usr/lib/bitfocus-companion/companion_headless.sh"
	install -Dm755 companion_headless.sh -t "${pkgdir}/usr/lib/bitfocus-companion/"

	# Install bin symlinks
	install -d "${pkgdir}/usr/bin"

	ln -sv "/usr/lib/bitfocus-companion/companion-launcher" "${pkgdir}/usr/bin/companion"
	ln -sv "/usr/lib/bitfocus-companion/companion_headless.sh" "${pkgdir}/usr/bin/companion-headless"

	# udev rules
	install -Dm644 "${pkgname}-${pkgver}/assets/linux/50-companion-desktop.rules" -t "${pkgdir}/etc/udev/rules.d/"
	install -Dm644 "${pkgname}-${pkgver}/assets/linux/50-companion-headless.rules" -t "${pkgdir}/etc/udev/rules.d/"

	# Desktop file
	install -Dm644 bitfocus-companion.desktop -t "${pkgdir}/usr/share/applications/"

	# Icon
	install -Dm644 "${pkgname}-${pkgver}/launcher/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bitfocus-companion.png"
}
