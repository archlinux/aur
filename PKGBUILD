# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Łukasz Mariański <lmarianski at protonmail dot com>

_pkgname=vscodium
_electron=electron19
# _nodejs="16.14"

pkgname=${_pkgname}-electron
pkgver=1.77.3.23102
pkgrel=1
pkgdesc="VS Code without MS branding/telemetry/licensing. - System-wide Electron edition"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/VSCodium/vscodium"
license=('MIT')
depends=("$_electron" 'libsecret' 'libx11' 'libxkbfile' 'ripgrep')
optdepends=('x11-ssh-askpass: SSH authentication'
	    'gvfs: For move to trash functionality'
	    'libdbusmenu-glib: For KDE global menu')
makedepends=('git' 'gulp' 'python' 'yarn' 'nvm' 'imagemagick' 'jq')
conflicts=('vscodium')
source=("git+https://github.com/VSCodium/vscodium.git#tag=${pkgver}"
        "git+https://github.com/microsoft/vscode.git#tag=${pkgver%.*}"
		"${_pkgname}.sh"
		"${_pkgname}.js"
		"${_pkgname}.desktop"
		"${_pkgname}-uri-handler.desktop")
sha256sums=('SKIP'
            'SKIP'
            'ea8ea35d3926dc21da3d00da3430de4a4c3efd1042478c3b9c39bcddaf9f1832'
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
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	cd "$srcdir/$_pkgname"
	ln -sf ../vscode vscode

	sed -i "s:\.\./:../vscodium/:" "prepare_vscode.sh" "update_settings.sh"
	sed -i -e "s:\.\./:../vscodium/:" -e 's:\grep -rl --exclude-dir=\.git -E "${TELEMETRY_URLS}" \.:rg --no-ignore --iglob "!*.map" -l "${TELEMETRY_URLS}" .:' "undo_telemetry.sh"

	sed -i "s/@ELECTRON@/${_electron}/" "$srcdir/$_pkgname.sh" "$srcdir/$_pkgname.js"

	_ensure_local_nvm
	nvm install "${_nodejs}"

	# Build native modules for system electron
	local _target=$(</usr/lib/$_electron/version)
	sed -i "s/^target .*/target \"${_target//v/}\"/" "$srcdir/vscode/.yarnrc"
}

build() {
	cd "$srcdir/$_pkgname"

	# Increase JS heap size to avoid OOM issues
	export NODE_OPTIONS=--max-old-space-size=8192

	_ensure_local_nvm
	nvm use "${_nodejs}"

	export OS_NAME=linux
	export RELEASE_VERSION="${pkgver}"
	HOME="$srcdir" ./prepare_vscode.sh

	cd "$srcdir/vscode"
	HOME="$srcdir" CHILD_CONCURRENCY=1 yarn install --cache-folder "$srcdir/yarn-cache" --arch="$_vscode_arch"

	gulp compile-build
	gulp compile-extension-media
	gulp compile-extensions-build
	gulp minify-vscode
	gulp "vscode-linux-$_vscode_arch-min"
}

package() {
	cd "$srcdir/VSCode-linux-$_vscode_arch"

	install -Dm644 resources/app/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 resources/app/ThirdPartyNotices.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

	install -Dm755 "$srcdir/${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
  	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/codium"

	install -Dm 755 "$srcdir/${_pkgname}.js" -t "$pkgdir/usr/lib/${_pkgname}/"

	install -dm755 "$pkgdir/usr/lib/${_pkgname}"
	cp -r --no-preserve=ownership --preserve=mode resources/app/!(LICENSE.txt|ThirdPartyNotices.txt) "$pkgdir/usr/lib/${_pkgname}/"
	ln -sf /usr/bin/rg "$pkgdir/usr/lib/$_pkgname/node_modules.asar.unpacked/@vscode/ripgrep/bin/rg"

  	install -Dm644 "$srcdir/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "$srcdir/${_pkgname}-uri-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-uri-handler.desktop"

	install -Dm 644 "resources/completions/bash/codium" "$pkgdir/usr/share/bash-completion/completions/codium"
	install -Dm 644 "resources/completions/zsh/_codium" "$pkgdir/usr/share/zsh/site-functions/_codium"

	install -Dm644 "resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
