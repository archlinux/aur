# Maintainer: Chris Watson <cawatson1993@gmail.com>

pkgname=windsurf
pkgver=1.9.0
pkgrel=2
pkgdesc="The new purpose-built IDE to harness magic"
arch=('x86_64')
url="https://windsurf.com/"
license=('custom') # should be fixed
_elnum=34
depends=( electron$_elnum ripgrep fd #replacements
    'alsa-lib'
    'dbus'
    'gnupg'
    'libnotify'
    'libsecret'
    'libxkbfile'
    'libxss'
    'libxtst'
    'lsof'
    'shared-mime-info'
    'xdg-utils'
)
optdepends=('glib2: Move to trash functionality'
            'org.freedesktop.secrets: Sync settings'
            'libdbusmenu-glib: KDE global menu'
            'vulkan-driver'
            'electron: /usr/share/windsurf/windsurf-latestron')
options=('!strip') # ~0.49MB
makedepends=('tar' 'sed') # tar is faster than bsdtar.
source=("https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt/pool/main/w/windsurf/Windsurf-linux-x64-${pkgver}.deb"
		"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh")
sha256sums=('8aa8e7e3518f25e361b0665e31e2dcb9b08f4e0241abb010ba4ff8716d7085a4'
            '5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1')
package() {
	tar -xf "data.tar.xz" --exclude 'usr/share/windsurf/[^r]*' --exclude 'usr/share/windsurf/*.pak' \
		--exclude 'usr/share/pixmaps'
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
	# Icon (1024^2 is unusable at KDE)
	install -Dm644 "usr/share/${pkgname}/resources/app/out/media/code-icon.svg" "usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
	_url_handler_f="usr/share/applications/windsurf-url-handler.desktop";
	grep -q '^Hidden=true' "$_url_handler_f" || \
	  grep -q '^Hidden=false' "$_url_handler_f" && sed -i 's/^Hidden=false/Hidden=true/' "$_url_handler_f" || \
	  echo 'Hidden=true' >> "$_url_handler_f"
	mv usr "${pkgdir}"
}
