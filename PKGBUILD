# Maintainer: Sherlock Holo <sherlockya at gmail.com>

pkgname=void-bin
pkgdesc="The open-source Cursor alternative."
pkgver=1.99.30034
pkgrel=2
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
sha256sums=('aed80c55736d5de9b4473e8e7c7e8fb9d3b2999b45fac5ebfc302c40a13b9d83'
            '5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1')

build() {
        tar -xf data.tar.xz --exclude='usr/share/void/[^r]*' --exclude='usr/share/void/*.pak'
        _electron=electron$(rg -o -r '$1' '"electron": *"[^0-9]*([0-9]+)' usr/share/void/resources/app/package.json)
        _app=/usr/share/void/resources/app
        sed -e "s#code-flags#void-flags#" \
                -e "s#/usr/lib/code/out/cli.js#${_app}/out/cli.js#" \
                -e "s#/usr/lib/code/code.mjs#--app=${_app}#" code.sh > run.sh
        sed "s#name=electron#name=${_electron}#" run.sh > run-safe.sh
        # System-wide tools
        ln -sf /usr/bin/void usr/share/void/void
        cd usr/share/void/resources/app
        ln -svf /usr/bin/rg node_modules/@vscode/ripgrep/bin/rg
        ln -svf /usr/bin/xdg-open node_modules/open/xdg-open
}

package_void-bin() {
        pkgdesc="Cursor alternative AI code editor"
        cp -r --reflink=auto usr "${pkgdir}"/usr
        install -Dm755 run-safe.sh "${pkgdir}/usr/bin/void"
        echo $_electron
        depends+=(${_electron})
}

package_void-electron-latest-bin() {
        pkgdesc="Void editor on latest stable electron"
        mv usr "${pkgdir}"/usr # breaks --repackage
        install -Dm755 run.sh "${pkgdir}/usr/bin/void"
        depends+=(electron)
}
