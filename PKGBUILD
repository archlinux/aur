# Maintainer: Léo Sumi <pro.leosumi at gmail dot com>
# Contributor: Tzu-Yu Lee <leejuyuu at gmail dot com>
# Contributor: pu <pu.mb@qq.com>
# Contributor: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>
_pkgname=ltex-ls-plus
pkgname="${_pkgname}-bin"
pkgver=18.5.1
pkgrel=1
pkgdesc="LTeX Language Server: LSP language server for LanguageTool with support for LaTeX, Markdown, and others (fork of ltex-ls)"
arch=('any')
url="https://github.com/ltex-plus/ltex-ls-plus"
license=('MPL2')
depends=('java-runtime>=21' 'bash')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('912b3fd078bd1b997adf6f9dab11a196f3090a2cf328563f76aed4c80af7bacb')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    local _appdir="usr/share/${_pkgname}"
    install -Dm644 "README.md" "LICENSE.md" "ACKNOWLEDGMENTS.md" "changelog.xml" -t "${pkgdir}/${_appdir}/"
    install -Dm644 "lib"/*.jar -t "${pkgdir}/usr/share/java/${_pkgname}/"
    ln -sf "/usr/share/java/${_pkgname}" -T "${pkgdir}/${_appdir}/lib"
    install -Dm644 "bin/.lsp-cli-plus.json" -t "${pkgdir}/${_appdir}/bin/"

    _generate_launcher() {
        local _bin="$1" _class="$2"
        install -Dm755 /dev/null -T "${pkgdir}/${_appdir}/bin/${_bin}"
        cat > "${pkgdir}/${_appdir}/bin/${_bin}" <<EOF
#!/usr/bin/sh
exec /usr/bin/java \
-classpath '/usr/share/java/${_pkgname}/*' \
-Dapp.name='${_pkgname}' \
-Dapp.pid="\$\$" \
-Dapp.repo='/${_appdir}/lib' \
-Dapp.home='/${_appdir}' \
-Dbasedir='/${_appdir}' \
${_class} "\$@"
EOF
        install -d "${pkgdir}/usr/bin/"
        ln -sf "/${_appdir}/bin/${_bin}" -t "${pkgdir}/usr/bin/"
    }

    _generate_launcher ltex-ls-plus  org.bsplines.ltexls.LtexLanguageServerLauncher
    _generate_launcher ltex-cli-plus org.bsplines.lspcli.LspCliLauncher
}
