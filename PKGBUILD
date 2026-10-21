pkgname=companion
pkgver=5.1.1
pkgrel=1
pkgdesc="Control software for the Elgato Streamdeck with a focus on broadcasting."
arch=('x86_64' 'aarch64')
url="https://github.com/bitfocus/companion"
license=('custom')
depends=('gtk3' 'alsa-lib' 'nss' 'hicolor-icon-theme' 'libusb')
makedepends=('nvm' 'git' 'zip' 'python>=3.10.0')
install=companion.install
_node_version="26"

source=("${pkgname}-${pkgver}::git+https://github.com/bitfocus/companion.git#tag=v${pkgver}"
		"bitfocus-companion.desktop")

sha256sums=('27c79ca63ba1badc7aa8dee24dcc8a162e84d26e20f312bdcd20aaa5ba25adfb'
            '65289895360dae94dd710e6804709c1e3f95e6bc275b1621cb88eb8a7cbd348f')
b2sums=('eb292fc9af781c2c7ad6f2c30c73b52958f33832fc445316a3bb59b067ed06b2277a996b94406eb7423e426a6f1b38a4a304029abac3a0392d2358c0d3f53074'
        '718976c7c24fa0a2a8979a6704b36650ebe71e87edec944c1cc745cfa0e7e5aba7211efb3408b1bf12dc0065f838ed976bea75a818d5abefa23471e2e4354882')

_ensure_local_nvm() {
	# let's be sure we are starting clean
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="${srcdir}/.nvm"

	# The init script returns 3 if version specified
	# in ./.nvrc is not (yet) installed in $NVM_DIR
	# but nvm itself still gets loaded ok
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
	
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

	# Node version
	if [[ -f ".node-version" ]]; then
		_upstream_node_version="$(<.node-version)"
		echo "Found .node_version file, setting node version to ${_upstream_node_version}"
		_node_version="${_upstream_node_version}"
	else
		echo "WARNING: could not locate .node-version file, using fallback version: ${_node_version}" >&2
	fi

	nvm install "${_node_version}"
	npm config set cache "${srcdir}/npm"

	# Enable corepack
	npm install -g corepack
	corepack enable
	corepack prepare "$(node -p 'require("./package.json").packageManager')" --activate

	yarn --immutable
}

build() {
	_ensure_local_nvm

	cd "${srcdir}/${pkgname}-${pkgver}"

	rm -rf electron-output

	yarn run dist
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

	# Desktop file
	install -Dm644 bitfocus-companion.desktop -t "${pkgdir}/usr/share/applications/"

	# Icon
	install -Dm644 "${pkgname}-${pkgver}/launcher/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bitfocus-companion.png"
}
