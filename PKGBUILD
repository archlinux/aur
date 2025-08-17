# Maintainer: Mohammed Anas <anasmohammed361@gmail.com> 

pkgver=1.12.1
pkgbase=windsurf-latest
pkgname=windsurf-latest
pkgrel=1
arch=('x86_64')
url="https://windsurf.com/"
license=('LicenseRef-Windsurf Editor')
depends=( ripgrep fd xdg-utils #replacements
    'alsa-lib'
    'dbus'
    'gnupg'
    'libnotify'
    'libsecret'
    'libxkbfile'
    'libxss'
)
optdepends=('glib2: Move to trash functionality'
            'org.freedesktop.secrets: Sync settings'
            'libdbusmenu-glib: KDE global menu'
            'lsof: Terminal splitting'
            'vulkan-driver')
options=('!strip') # for sing of ext ?
makedepends=(tar sed desktop-file-utils) # tar is faster than bsdtar.
source=("https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt/pool/main/w/windsurf/Windsurf-linux-x64-${pkgver}.deb"
		"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh")
sha256sums=('6cd44b6121681d91d50b8432b98233fcebff91a77af1dd48dfc68628bbbe7d9b'
            '5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1')
build() {
	tar -xf "data.tar.xz" --exclude 'usr/share/windsurf/[^r]*' --exclude 'usr/share/windsurf/*.pak'
	# Fix path
	mkdir -p usr/share/metainfo
	mv usr/share/appdata/* usr/share/metainfo/
	rmdir usr/share/appdata 2>/dev/null || true

	mkdir -p usr/share/zsh/site-functions
	mv usr/share/zsh/vendor-completions/* usr/share/zsh/site-functions/
	rmdir usr/share/zsh/vendor-completions 2>/dev/null || true
	# Launcher
	_app=/usr/share/windsurf/resources/app
	sed -e "s|code-flags|windsurf-flags|" code.sh \
		-e "s|/usr/lib/code/out/cli.js|${_app}/out/cli.js|" \
		-e "s|/usr/lib/code/code.mjs|--app=${_app}|" > run.sh
	ln -sf /usr/bin/windsurf usr/share/windsurf/windsurf
	# Replacements
	ln -svf /usr/bin/fd usr/share/windsurf/resources/app/extensions/windsurf/bin/fd
	ln -svf /usr/bin/rg usr/share/windsurf/resources/app/node_modules/@vscode/ripgrep/bin/rg
	ln -svf /usr/bin/xdg-open usr/share/windsurf/resources/app/node_modules/open/xdg-open
	# SVG Icon
	install -Dm644 "usr/share/windsurf/resources/app/out/media/code-icon.svg" "usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
	# Hide entry of URL handler
	desktop-file-edit --set-key Hidden --set-value true usr/share/applications/windsurf-url-handler.desktop
}

package_windsurf-latest(){
	pkgdesc="The new purpose-built IDE to harness magic"
	cp -r --reflink=auto usr "${pkgdir}/usr"
	_electron=electron$(rg -o -r '$1' '"electron": *"[^0-9]*([0-9]+)' usr/share/windsurf/resources/app/package.json)
	echo $_electron
	sed "s|name=electron|name=${_electron}|" run.sh > run-safe.sh
	install -Dm755 run-safe.sh "${pkgdir}/usr/bin/windsurf"
	depends+=(${_electron}) # hidden from --printsrcinfo
}