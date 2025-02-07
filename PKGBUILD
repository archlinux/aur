# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=wps-zotero
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="A WPS Writer add-on for integrating with Zotero."
arch=("any")
url="https://forums.zotero.org/discussion/107426/wps-integration-on-linux"
license=('GPL-3.0-only')
groups=()
depends=(wps-office zotero python)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/tankwyn/WPS-Zotero.git#tag=${pkgver}" "wps-zotero.service")
noextract=()
sha256sums=('SKIP' 'SKIP')
validpgpkeys=()

package() {
    cd "${srcdir}/${pkgname}"
    export HOME=${srcdir}
    prefix="${HOME}/.local/share/Kingsoft/wps/"
    new_prefix="${pkgdir}/usr/lib/office6/"
    mkdir -p "${prefix}"
    if [ -e /usr/lib/office6/jsaddons ]; then
        cp -r /usr/lib/office6/jsaddons -t "${prefix}"
    fi
    python install.py &> /dev/null
    pushd "${prefix}" &&\
        find . -type f "(" \
            "(" -path "./*/.git*" -o -path "./*/__pycache__*" -o -name "*.bat" ")"\
                -prune\
            -o -name "*.py" -exec\
                install -D "${prefix}/{}" "${new_prefix}/{}" ";"\
            -o -exec \
                install -Dm644 "${prefix}/{}" "${new_prefix}/{}" ";"\
        ")"
    popd
    install -Dm644 "${srcdir}/wps-zotero.service" "${pkgdir}/usr/lib/systemd/user/wps-zotero.service"
    install -Dm644 "${srcdir}/wps-zotero.service" "${pkgdir}/usr/lib/systemd/system/wps-zotero.service"
}

post_install() {
    echo "WPS Zotero Addons 已成功安装到您的系统中"
    echo "要作为 systemd 服务启动，请运行:"
    echo "    systemctl start --user wps-zotero"
    echo "要设置为开机自启，请运行:"
    echo "    systemctl enable --user wps-zotero"
    echo "要检查服务状态，请运行:"
    echo "    systemctl status --user wps-zotero"
    echo "要停止服务，请运行:"
    echo "    systemctl stop --user wps-zotero"
    echo "要禁用开机自启，请运行:"
    echo "    systemctl disable --user wps-zotero"
}
