# Maintainer: Chris Watson <cawatson1993@gmail.com>

pkgver=1.12.36
pkgbase=windsurf
pkgname=(windsurf{,-electron-latest})
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
source=("https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt/pool/main/w/windsurf/Windsurf-linux-x64-${pkgver}.deb"
		"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh")
sha256sums=('05b302571a53976b0cdf3d2d3bce67f076b870df966c151accedc2b041dbf388'
            '5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1')
noextract=(Windsurf-linux-x64-${pkgver}.deb) # avoid double tarball
build() {
	bsdtar -xOf ${noextract[0]} data.tar.xz | tar -xJf - --exclude 'usr/share/windsurf/[^r]*' --exclude 'usr/share/windsurf/*.pak'
	# Fix path
	mv usr/share/{appdata,metainfo}
	mv usr/share/zsh/{vendor-completions,site-functions}
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
	install -Dm644 "usr/share/${pkgname}/resources/app/out/media/code-iconsvg.svg" "usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}

package_windsurf(){
	pkgdesc="The new purpose-built IDE to harness magic"
	cp -r --reflink=auto usr "${pkgdir}/usr"
	_electron=electron$(rg -o -r '$1' '"electron": *"[^0-9]*([0-9]+)' usr/share/windsurf/resources/app/package.json)
	echo $_electron
	sed "s|name=electron|name=${_electron}|" run.sh > run-safe.sh
	install -Dm755 run-safe.sh "${pkgdir}/usr/bin/windsurf"
	depends+=(${_electron}) # hidden from --printsrcinfo
}

package_windsurf-electron-latest(){
	pkgdesc="Windsurf Editor on latest stable electron"
	mv usr "${pkgdir}/usr" # breaks --repackage
	install -Dm755 run.sh "${pkgdir}/usr/bin/windsurf"
	depends+=(electron)
	conflicts=(windsurf)
	provides=(windsurf)
}
