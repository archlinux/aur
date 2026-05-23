# Maintainer: Richardn <rniu5 at jh dot edu>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Łukasz Mariański <lmarianski at protonmail dot com>

_pkgname=vscodium
_electron=electron41
_nodejs="22.22.1"

pkgname=${_pkgname}-electron
pkgver=1.121.03429
pkgrel=1
pkgdesc="VS Code without MS branding/telemetry/licensing. - System-wide Electron edition"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/VSCodium/vscodium"
license=('MIT')
options=(!strip !debug)
depends=("$_electron" 'libsecret' 'libx11' 'libxkbfile' 'ripgrep' 'nodejs' 'python-fonttools' 'python' 'perl' 'webkit2gtk-4.1' 'util-linux-libs' 'glibc' 'dbus' 'gtk3' 'curl' 'libsoup3' 'openssl' 'glib2' 'libgcc' 'libstdc++' 'bash')
optdepends=(
	'gvfs: For move to trash functionality'
	'libdbusmenu-glib: For KDE global menu'
)
makedepends=('git' 'python' 'nvm' 'jq' 'cargo-nightly')
provides=(
	'codium'
	'vscodium'
)
conflicts=(
	'codium'
	'vscodium'
	'vscodium-bin'
	'vscodium-git'
)
source=(
	"git+https://github.com/VSCodium/vscodium.git#tag=${pkgver}"
	"vscodium-electron.patch"
	"${_pkgname}.sh"
	"${_pkgname}.js"
	"${_pkgname}.desktop"
	"${_pkgname}-uri-handler.desktop"
)
sha256sums=('6dfc0ebb833825ef9594bab70078453623a5c6d978303965dcb81d42fd43c8b0'
            'da6f1b1e668991227584c9a897211cbf098296ea1421ae80b7f67f7e52fb4b6b'
            '617591ac74e2ef1ab30425895a79be5580db3280e7e44cee56a7a809637d438f'
            '28a271ba5b2e50b11259abd794ad2ab083612c78bee2d617bb5a8702932c8f44'
            '3a5bc109974fcf408855c13965f6d6be0997655c5b359de0bfd19a678c00844e'
            '6eef345b65bf2679c928c763529540435ab9c6e1836917319810a7a2d484ae1b')

# Even though we don't officially support other archs, let's
# allow the user to use this PKGBUILD to compile the package
# for his architecture
case "$CARCH" in
  i686)
    _vscode_arch=ia32
    ;;
  x86_64)
    _vscode_arch=x64
    ;;
  armv7h)
    _vscode_arch=arm
    ;;
  *)
    # Needed for mksrcinfo
    _vscode_arch=DUMMY
    ;;
esac

shopt -s extglob

_ensure_local_nvm() {
	# let's be sure we are starting clean
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	# Use non-hidden nvm folder
	export NVM_DIR="${srcdir}/nvm"

	# The init script returns 3 if version specified
	# in ./.nvrc is not (yet) installed in $NVM_DIR
	# but nvm itself still gets loaded ok
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	# Abort early if the user does not have the selected electron version installed
	if ! which $_electron; then
		echo "Selected electron missing from system. Modify PKGBUILD and retry."
		exit 1
	fi

	# Point to system electron in launcher scripts
	# Do not use inplace sed so that user could change electron version in rebuilds
	sed "s/@ELECTRON@/${_electron}/" "$srcdir/vscodium.sh" > "$srcdir/vscodium-electron.sh"
	sed "s/@ELECTRON@/${_electron}/" "$srcdir/vscodium.js" > "$srcdir/vscodium-electron.js"

	cd "$srcdir/vscodium"

	# Remove old build
	if [ -d vscode ]; then
		rm -rf vscode VSCode*
	fi

	# Mangle original vscodium build script to build against system electron
	patch -u build.sh -i $srcdir/vscodium-electron.patch
}

build() {
	export SHOULD_BUILD="yes"
	export SHOULD_BUILD_REH="no"
	export CI_BUILD="no"
	export OS_NAME="linux"
	export VSCODE_ARCH="${_vscode_arch}"
	export VSCODE_QUALITY="stable"
	export RELEASE_VERSION="${pkgver}"
	export DISABLE_UPDATE="yes"
	export HOME="${srcdir}"
	_ensure_local_nvm
	nvm install "${_nodejs}"
	nvm use "${_nodejs}"
	npm install --global node-gyp

	cd "$srcdir/vscodium"

	# the app will be updated with pacman
	export DISABLE_UPDATE="yes"

	# https://github.com/nodejs/node/issues/51555
	export DISABLE_V8_COMPILE_CACHE=1

	rustup default stable
	export CARGO_TARGET_DIR=${srcdir}/${_pkgname}/vscode/cli/target

	. dev/build.sh
}

package() {
	# Reference: https://aur.archlinux.org/packages/vscodium
	install -d -m755 ${pkgdir}/usr/bin
	install -d -m755 ${pkgdir}/usr/share/{${_pkgname},applications,pixmaps}
	install -d -m755 ${pkgdir}/usr/share/licenses/${_pkgname}

	# vscodium-electron modification: put resource files and vscodium.js under /usr/lib/
	install -dm755 "${pkgdir}/usr/lib/${_pkgname}"

	# vscodium-electron modification: Only install licenses, files and shell completions under resources/
	install -Dm644 "${srcdir}/${_pkgname}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
	install -Dm644 "${srcdir}/${_pkgname}/VSCode-linux-${_vscode_arch}/resources/app/ThirdPartyNotices.txt" -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
	cp -r --no-preserve=ownership --preserve=mode "${srcdir}/${_pkgname}"/VSCode-linux-${_vscode_arch}/resources/app/!(LICENSE.txt|ThirdPartyNotices.txt) "$pkgdir/usr/lib/${_pkgname}/"
	cp -r --no-preserve=ownership --preserve=mode "${srcdir}/${_pkgname}"/VSCode-linux-${_vscode_arch}/resources/completions "$pkgdir/usr/lib/${_pkgname}/"

	# vscodium-electron modification: Use custom launcher scripts
	install -Dm755 "${srcdir}/vscodium-electron.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/vscodium-electron.js" "${pkgdir}/usr/lib/${_pkgname}/vscodium.js"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/codium"

	# vscodium-electron modification: We handle Wayland at vscodium.sh level
	install -D -m644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
	install -D -m644 ${_pkgname}-uri-handler.desktop ${pkgdir}/usr/share/applications/${_pkgname}-uri-handler.desktop
	install -D -m644 "${srcdir}/${_pkgname}/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/code.png" ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

	# Symlink shell completions
	install -d -m755 ${pkgdir}/usr/share/zsh/site-functions
	install -d -m755 ${pkgdir}/usr/share/bash-completion/completions
	# vscodium-electrion modification: Shell completion files changed locations
	ln -s /usr/lib/${_pkgname}/completions/zsh/_codium ${pkgdir}/usr/share/zsh/site-functions
	ln -s /usr/lib/${_pkgname}/completions/bash/codium ${pkgdir}/usr/share/bash-completion/completions

	# vscodium-electron modification: Replace bundled ripgrep with system ripgrep
	ln -sf /usr/bin/rg ${pkgdir}/usr/lib/$_pkgname/node_modules/@vscode/ripgrep/bin/rg

	# Install license
	install -Dm644 "$srcdir/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
