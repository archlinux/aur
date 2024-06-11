# Maintainer: Richardn <rniu at umich dot edu>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Łukasz Mariański <lmarianski at protonmail dot com>

_pkgname=vscodium
_electron=electron29
_nodejs="20.9.0"

pkgname=${_pkgname}-electron
pkgver=1.90.0.24158
pkgrel=2
pkgdesc="VS Code without MS branding/telemetry/licensing. - System-wide Electron edition"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/VSCodium/vscodium"
license=('MIT')
options=(!strip !debug)
depends=("$_electron" 'libsecret' 'libx11' 'libxkbfile' 'ripgrep')
optdepends=(
	'gvfs: For move to trash functionality'
	'libdbusmenu-glib: For KDE global menu'
)
makedepends=('git' 'python' 'nvm' 'jq' 'python-distutils-extra')
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
source=("git+https://github.com/VSCodium/vscodium.git#tag=${pkgver}"
		"vscodium-electron.patch"
		"${_pkgname}.sh"
		"${_pkgname}.js"
		"${_pkgname}.desktop"
		"${_pkgname}-wayland.desktop"
		"${_pkgname}-uri-handler.desktop")
sha256sums=(SKIP
            'b96a713be2577dd07b727362c77edc7fd0430a5894eead186c1f18f666fc5536'
            'da8fbd6dcafa667e2b3368ae87ed216e7e76f56ce4a3e4ede426dc129e8f8349'
            '7a3dceb7a470f1dd6bc2991c28a4bfc68be6b81252ec7ff8f61f280e2e5b01f8'
            'f76eb3ecf7fa531e0f711938e4e10f82145b5a7bf8b24bda218acb2d47466d60'
            '1841d08fdb512f32433eefa21132bf7ad13e106cb45ca3218d0da7b7be9cfc81'
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
	_ensure_local_nvm
	nvm install "${_nodejs}"
	nvm use "${_nodejs}"
	npm install --global yarn

	# Contain yarn, electron and node
	export HOME=$srcdir
	# Use non-hidden yarn cache folder
	yarn config set cache-folder "$srcdir/yarn-cache"

	cd "$srcdir/vscodium"

	# the app will be updated with pacman
	export DISABLE_UPDATE="yes"

	# https://github.com/nodejs/node/issues/51555
	export DISABLE_V8_COMPILE_CACHE=1

	. build/build.sh
}

package() {
	# Reference: https://aur.archlinux.org/packages/vscodium
	install -d -m755 ${pkgdir}/usr/bin
	install -d -m755 ${pkgdir}/usr/share/{${_pkgname},applications,pixmaps}
	install -d -m755 ${pkgdir}/usr/share/licenses/${_pkgname}

	# vscodium-electron modification: put resource files and vscodium.js under /usr/lib/
	install -dm755 "${pkgdir}/usr/lib/${_pkgname}"

	# vscodium-electron modification: Only install licenses and files under resources/app/
	install -Dm644 ${srcdir}/${_pkgname}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
	install -Dm644 ${srcdir}/${_pkgname}/VSCode-linux-${_vscode_arch}/resources/app/ThirdPartyNotices.txt -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
	cp -r --no-preserve=ownership --preserve=mode ${srcdir}/${_pkgname}/VSCode-linux-${_vscode_arch}/resources/app/!(LICENSE.txt|ThirdPartyNotices.txt) "$pkgdir/usr/lib/${_pkgname}/"

	# vscodium-electron modification: Use custom launcher scripts
	install -Dm755 "${srcdir}/vscodium-electron.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/vscodium-electron.js" "${pkgdir}/usr/lib/${_pkgname}/vscodium.js"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/codium"

	install -D -m644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
	install -D -m644 ${_pkgname}-wayland.desktop ${pkgdir}/usr/share/applications/${_pkgname}-wayland.desktop
	install -D -m644 ${_pkgname}-uri-handler.desktop ${pkgdir}/usr/share/applications/${_pkgname}-uri-handler.desktop
	install -D -m644 ${srcdir}/${_pkgname}/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/code.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

	# Symlink shell completions
	install -d -m755 ${pkgdir}/usr/share/zsh/site-functions
	install -d -m755 ${pkgdir}/usr/share/bash-completion/completions
	ln -s /usr/share/${_pkgname}/resources/completions/zsh/_codium ${pkgdir}/usr/share/zsh/site-functions
	ln -s /usr/share/${_pkgname}/resources/completions/bash/codium ${pkgdir}/usr/share/bash-completion/completions

	# vscodium-electron modification: replace bundled ripgrep with system ripgrep
	ln -sf /usr/bin/rg "$pkgdir/usr/lib/$_pkgname/node_modules.asar.unpacked/@vscode/ripgrep/bin/rg"
}
