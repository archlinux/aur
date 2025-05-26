# Maintainer: Patrick Fischer <aur@pathin.me>

pkgname=windsurf-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Windsurf (formerly Codeium) is the world's most advanced AI coding assistant for developers and enterprises. Windsurf Editor — the first AI-native IDE that keeps developers in flow."
arch=('x86_64')
url="https://windsurf.com/"
license=('LicenseRef-Windsurf Editor')
_elnum=34
depends=( electron$_elnum ripgrep fd xdg-utils #replacements
    'alsa-lib'
    'dbus'
    'gnupg'
    'libnotify'
    'libsecret'
    'libxkbfile'
    'libxss'
)
conflicts=('windsurf')
optdepends=('glib2: Move to trash functionality'
            'org.freedesktop.secrets: Sync settings'
            'libdbusmenu-glib: KDE global menu'
	    'lsof: Terminal splitting'
            'vulkan-driver'
            'electron: /usr/share/windsurf/windsurf-latestron')
options=('!strip') # ~0.49MB
makedepends=(tar sed desktop-file-utils) # tar is faster than bsdtar.
source=("https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt/pool/main/w/windsurf/Windsurf-linux-x64-${pkgver}.deb"
		"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh")
sha256sums=('4770e9147420dbac6e83f90bd77711e01745baa3c98f2606b3e030b960d6e04d'
            '5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1')
package() {
	tar -xf "data.tar.xz" --exclude 'usr/share/windsurf/[^r]*' --exclude 'usr/share/windsurf/*.pak'
 	# Check version of electron
 	echo Replacing $(rg -m 1 '"electron":\s*"[0-9]+' usr/share/windsurf/resources/app/package.json) with $(cat /usr/lib/electron${_elnum}/version)
 	echo 'Fix if "major" version is wrong.'
	# Fix path
	mv usr/share/{appdata,metainfo} # metainfo (needed?)
 	mv usr/share/zsh/{vendor-completions,site-functions}
	# Launcheres
	_app=/usr/share/windsurf/resources/app
	sed -e "s|code-flags|windsurf-flags|" code.sh \
		-e "s|/usr/lib/code/out/cli.js|${_app}/out/cli.js|" \
		-e "s|/usr/lib/code/code.mjs|--app=${_app}|" > run.sh
	sed "s|name=electron|name=electron${_elnum}|" run.sh > run-safe.sh
	install -Dm755 run.sh usr/share/windsurf/windsurf-latestron
	install -Dm755 run-safe.sh usr/bin/windsurf
	ln -sf /usr/bin/windsurf usr/share/windsurf/windsurf
	# Replacements
	ln -svf /usr/bin/fd usr/share/windsurf/resources/app/extensions/windsurf/bin/fd
	ln -svf /usr/bin/rg usr/share/windsurf/resources/app/node_modules/@vscode/ripgrep/bin/rg
	ln -svf /usr/bin/xdg-open usr/share/windsurf/resources/app/node_modules/open/xdg-open
	# SVG Icon
	install -Dm644 "usr/share/windsurf/resources/app/out/media/code-icon.svg" "usr/share/icons/hicolor/scalable/apps/windsurf.svg"
	# Hide entry of URL handler
	desktop-file-edit --set-key Hidden --set-value true usr/share/applications/windsurf-url-handler.desktop
	
 	mv usr "${pkgdir}"
}
