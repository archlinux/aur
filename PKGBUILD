# Maintainer: Sherlock Holo <sherlockya at gmail.com>

pkgname=void-bin
pkgdesc="The open-source Cursor alternative."
pkgver=1.99.30033
pkgrel=1
arch=('x86_64')
options=('!strip')
url="https://github.com/voideditor/void"
license=('APACHE')
_elnum=34
depends=(electron${_elnum} alsa-lib atk at-spi2-core cairo dbus expat mesa glib2 nspr pango
libx11 libxcb libxcomposite libxdamage libxext libxfixes libxkbcommon libxrandr xdg-utils ripgrep)
optdepends=('electron: /usr/share/void/void-latestron')
source=("https://github.com/voideditor/binaries/releases/download/${pkgver}/void_${pkgver}_amd64.deb"
"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh")
sha256sums=('e6ba1953c0ed0ad71a5d0d22605919126a723835f0c672e7d22d4cd98bf90f4e'
            '5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1')

build() {
	tar -xf data.tar.xz --exclude='usr/share/void/[^r]*' --exclude='usr/share/void/*.pak'
 	_correctron=$(grep -E '"electron": "[0-9]{2}' usr/share/void/resources/app/package.json|awk '{print $2}'|cut -c2-3)
	if [[ $_elnum != $_correctron ]]; then
		echo "Incorrectron! Change electron${_elnum} to electron${_correctron}"
		exit 1
	fi
	_app=/usr/share/void/resources/app
	sed -e "s#code-flags#void-flags#" \
		-e "s#/usr/lib/code/out/cli.js#${_app}/out/cli.js#" \
		-e "s#/usr/lib/code/code.mjs#--app=${_app}#" code.sh > run.sh
	sed "s#name=electron#name=electron${_elnum}#" run.sh > run-safe.sh
}

package() {
	mv usr "${pkgdir}"/usr
	install -Dm755 run-safe.sh "${pkgdir}/usr/bin/void"
	ln -s /usr/bin/void "${pkgdir}/usr/share/void/void"
	install -Dm755 run.sh "${pkgdir}/usr/share/void/void-latestron"

	# use ripgrep to replace bundled rg
	ln -sf /usr/bin/rg "$pkgdir"/usr/share/void/resources/app/node_modules/@vscode/ripgrep/bin/rg
}
