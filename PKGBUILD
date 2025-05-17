# Maintainer:  oech3, Oops
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin at gmail dot com>

_hash="8ea935e79a50a02da912a034bbeda84a6d3d355d" # https://github.com/getcursor/cursor/issues/3119

_Name="Cursor"
_name="${_Name,,}"
_electron=electron34
pkgname="${_name}-electron"
pkgver=0.50.4
pkgrel=4
pkgdesc="The AI Code Editor (system-wide electron)"
arch=('aarch64' 'x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor')
depends=("${_electron}" 'ripgrep' 'xdg-utils' # system-wide replacements
		'bash' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbfile')
provides=("${_name}"{,-bin})
conflicts=("${_name}"{,-bin})
_pkgsrc="${_name}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.img::https://downloads.cursor.com/production/${_hash}/linux/arm64/${_Name}-${pkgver}-aarch64.AppImage")
source_x86_64=("${_pkgsrc}-x86_64.img::https://downloads.cursor.com/production/${_hash}/linux/x64/${_Name}-${pkgver}-x86_64.AppImage")
sha512sums_aarch64=('e336c5b9ec9909b98a660f98bb76ba992345e3691d1983e06caee9cba60ac0ecb8414eac3b989e23699f9b3c0cee7e343054dcb50dcf5a7977f3998a8f39cc2c')
sha512sums_x86_64=('4cd15e7ebc3e5f0aaf7236ab5c6c6bab5b6030b358541ca03062ac26bcbffe5377cceecd786b05c010b6aa66e41e5f2b33d4ed5019a3f81dcb2c4b4c75e21b79')
#options=(!strip)
build() {
	# Launcher, code.mjs suppress warns.
	_app=/usr/share/cursor/resources/app
	sed -e "s|exec /usr|ELECTRON_RUN_AS_NODE=1 exec /usr|" \
		-e "s|flags=()|flags=(${_app}/out/cli.js --app=${_app})|" \
		/usr/bin/${_electron} > run.sh # should be supported by ${_electron} officially.
	chmod +x "${_pkgsrc}-${CARCH}.img"
	rm -rf squashfs-root
	./"${_pkgsrc}-${CARCH}.img" --appimage-extract > /dev/null
 	cd squashfs-root/usr
	mv -v share/zsh/{vendor-completions,site-functions}
	# Licenses
	mkdir -p share/licenses
	mv -v share/cursor/resources/app/LICENSE.txt share/licenses/LICENSE
	mv -v share/cursor/resources/app/ThirdPartyNotices.txt share/licenses/
	# Replace bundled runtimes
	echo Replacing $(rg -m 1 '"electron":\s*"[0-9]+' share/cursor/resources/app/package.json) with $(cat /usr/lib/${_electron}/version)
	ln -sf /usr/bin/cursor share/cursor # Also for desktop entry
	cd share/cursor/resources/app/node_modules
	ln -svf /usr/bin/rg       @vscode/ripgrep/bin/rg
	ln -svf /usr/bin/xdg-open open/xdg-open
}
package(){
	# Launcher
	install -Dm755 "${srcdir}/run.sh" "${pkgdir}/usr/bin/cursor"
	# Skip unused icons and use small one  https://github.com/getcursor/cursor/issues/3120
	install -Dm644 squashfs-root/co.anysphere.cursor.png "${pkgdir}/usr/share/pixmaps/co.anysphere.cursor.png" # Should be SVG
	cd squashfs-root/usr/share
	cp -r --reflink=auto appdata applications bash-completion licenses mime zsh "${pkgdir}/usr/share/"
	install -d "${pkgdir}/usr/share/cursor/resources"
	cp -r --reflink=auto "${_name}/resources/app" "${pkgdir}/usr/share/${_name}/resources/"
}
