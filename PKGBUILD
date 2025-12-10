pkgname=companion
pkgver=4.2.0
pkgrel=2
pkgdesc="Control software for the Elgato Streamdeck with a focus on broadcasting."
arch=('x86_64' 'aarch64')
url="https://github.com/bitfocus/companion"
license=('custom')
depends=('gtk3' 'alsa-lib' 'nss' 'hicolor-icon-theme' 'libusb')
makedepends=('nvm' 'git' 'zip' 'python>=3.10.0')
install=companion.install
_node_version="22"

source=("${pkgname}-${pkgver}::git+https://github.com/bitfocus/companion.git#tag=v${pkgver}"
		"bitfocus-companion.desktop")

sha256sums=('ea9a561a9f5ddf73a57e39ea202c8a9fef53a4869471e455e182872c230b9911'
            '65289895360dae94dd710e6804709c1e3f95e6bc275b1621cb88eb8a7cbd348f')
b2sums=('8f26673ba50539815bf38d2b391c047491cf0fa461f69626ece71b54b25e18168fda2090520e9a1981a88f34ad3f6799b53b81896b8e816cf167a6da1937a49f'
        '718976c7c24fa0a2a8979a6704b36650ebe71e87edec944c1cc745cfa0e7e5aba7211efb3408b1bf12dc0065f838ed976bea75a818d5abefa23471e2e4354882')

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

	nvm install "${_node_version}"
	npm config set cache "${srcdir}/npm"

	# Enable corepack
	corepack enable

	yarn --immutable
}

build() {
	_ensure_local_nvm

	cd "${srcdir}/${pkgname}-${pkgver}"

	rm -rf electron-output

	yarn run dist

	# Fix missing bufferutil prebuild for linux/arm64
	# This is hacky, but fixes the issue until upstream fixes their build scripts
	if [ "${CARCH}" = "aarch64" ]; then
		cd "${srcdir}/${pkgname}-${pkgver}/node_modules/bufferutil"
		npm install
		npm run prebuild
		rm -r build node_modules
		cd ..
		cp -r bufferutil  "${srcdir}/${pkgname}-${pkgver}/electron-output/linux-arm64-unpacked/resources/node_modules/"
	fi
}

package() {
	cd "${srcdir}"

	builddir="${pkgname}-${pkgver}/electron-output/linux-unpacked"
	if [ "${CARCH}" = "aarch64" ]; then
		builddir="${pkgname}-${pkgver}/electron-output/linux-arm64-unpacked"
	fi

	# Licenses
	install -Dm644 "${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${builddir}/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${builddir}/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# Companion
	install -d "${pkgdir}/usr/lib/bitfocus-companion"

	cp -R "${builddir}"/* "${pkgdir}/usr/lib/bitfocus-companion"

	rm -f "${pkgdir}/usr/lib/bitfocus-companion/resources/node-runtime/bin/npm"
	rm -f "${pkgdir}/usr/lib/bitfocus-companion/resources/node-runtime/bin/npx"

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
