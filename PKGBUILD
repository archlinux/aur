# Maintainer: pu <pu.mb@qq.com>
# Contributor: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>
_pkgname=ltex-ls
pkgname="${_pkgname}-bin"
pkgver=15.2.0
pkgrel=2
pkgdesc="LTeX Language Server: LSP language server for LanguageTool with support for LaTeX, Markdown, and others"
arch=('any')
url="https://github.com/valentjn/ltex-ls"
license=('MPL2')
depends=('java-runtime>=11' 'bash')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ca08c216361a3fd2dce412ee3877b9fa5c9a2a97c3862711efcdec924060a3b2')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    local _appdir="usr/share/${_pkgname}"
    install -Dm644 "README.md" "LICENSE.md" "ACKNOWLEDGMENTS.md" "changelog.xml" -t "${pkgdir}/${_appdir}/"
    install -Dm644 "lib"/*.jar -t "${pkgdir}/usr/share/java/${_pkgname}/"
    ln -sf "/usr/share/java/${_pkgname}" -T "${pkgdir}/${_appdir}/lib"
    install -Dm644 "bin/.lsp-cli.json" -t "${pkgdir}/${_appdir}/bin/"

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

    _generate_launcher ltex-ls  org.bsplines.ltexls.LtexLanguageServerLauncher
    _generate_launcher ltex-cli org.bsplines.lspcli.LspCliLauncher
}
