# Maintainer: Richardn <rniu at umich dot edu>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Łukasz Mariański <lmarianski at protonmail dot com>

_pkgname=vscodium
_electron=electron25
_nodejs="18.16.1"

pkgname=${_pkgname}-electron
pkgver=1.85.2.24019
pkgrel=1
pkgdesc="VS Code without MS branding/telemetry/licensing. - System-wide Electron edition"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/VSCodium/vscodium"
license=('MIT')
depends=("$_electron" 'libsecret' 'libx11' 'libxkbfile' 'ripgrep')
optdepends=('x11-ssh-askpass: SSH authentication'
	    'gvfs: For move to trash functionality'
	    'libdbusmenu-glib: For KDE global menu')
makedepends=('git' 'python' 'nvm' 'jq')
conflicts=('vscodium')
source=("git+https://github.com/VSCodium/vscodium.git#tag=${pkgver}"
		"vscodium-electron.patch"
		"${_pkgname}.sh"
		"${_pkgname}.js"
		"${_pkgname}.desktop"
		"${_pkgname}-uri-handler.desktop")
sha256sums=('SKIP'
            'SKIP'
            '75e5411d6f68f015ef0d1970a47b60e2d5ce765446c00ebead5f988550f823eb'
            '7a3dceb7a470f1dd6bc2991c28a4bfc68be6b81252ec7ff8f61f280e2e5b01f8'
            '204ed8761e4f57e095833aee800f5fe662667aa06c2a213ef8b733929c639237'
            '765db91bf3eb97936d85c53f108d739a5c95d806ff5d4808a05d2c2d9e5f8453')

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
	patch -u build.sh -i ../../vscodium-electron.patch
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

	. build/build.sh
}

package() {
	cd "$srcdir/vscodium/VSCode-linux-$_vscode_arch"

	install -Dm644 resources/app/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 resources/app/ThirdPartyNotices.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

	install -Dm755 "$srcdir/vscodium-electron.sh" "$pkgdir/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/codium"

	install -Dm755 "$srcdir/vscodium-electron.js" "$pkgdir/usr/lib/${_pkgname}/vscodium.js"

	install -dm755 "$pkgdir/usr/lib/${_pkgname}"
	cp -r --no-preserve=ownership --preserve=mode resources/app/!(LICENSE.txt|ThirdPartyNotices.txt) "$pkgdir/usr/lib/${_pkgname}/"
	ln -sf /usr/bin/rg "$pkgdir/usr/lib/$_pkgname/node_modules.asar.unpacked/@vscode/ripgrep/bin/rg"

	install -Dm644 "$srcdir/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "$srcdir/${_pkgname}-uri-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-uri-handler.desktop"

	install -Dm 644 "resources/completions/bash/codium" "$pkgdir/usr/share/bash-completion/completions/codium"
	install -Dm 644 "resources/completions/zsh/_codium" "$pkgdir/usr/share/zsh/site-functions/_codium"

	install -Dm644 "resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
