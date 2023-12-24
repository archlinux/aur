# Maintainer: honjow
pkgname=sk-chos-tool
pkgver=r190.22a88dd
pkgrel=1
pkgdesc="A custom configs tool for sk-chimeros"
arch=('any')
url="https://github.com/honjow/sk-holoiso-config"
license=('MIT')
makedepends=('git')
depends=('python-gobject' 'gtk3' 'openssl' 'expect' 'efibootmgr')
provides=(sk-chos-tool)
conflicts=(sk-chos-tool)
source=("git+$url")
sha256sums=('SKIP')
options=(!strip)
install=sk-chos-tool.install
backup=('etc/sk-chos-tool/github_cdn.conf')

pkgver() {
    cd "$srcdir/sk-holoiso-config"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    source_dir="${srcdir}/sk-holoiso-config/src/chimeraos"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"

    # bin
    install -dm755 "${pkgdir}/usr/bin/"
    install -m755 -t "${pkgdir}/usr/bin/" "${source_dir}/bin"/*

    # icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" "${source_dir}/icon"/*.svg

    # conf
    install -dm755 "${pkgdir}/etc/${pkgname}"
    install -m644 -t "${pkgdir}/etc/${pkgname}" "${source_dir}/etc/${pkgname}"/*.conf

    # service
    install -dm755 "${pkgdir}/usr/lib/systemd/system"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system" "${source_dir}/systemd/system"/*

    # user service
    install -dm755 "${pkgdir}/usr/lib/systemd/user"
    install -m644 -t "${pkgdir}/usr/lib/systemd/user" "${source_dir}/systemd/user"/*

    # 主程序
    install -dm755 "${pkgdir}/usr/share/${pkgname}/pages"
    install -m755 -t "${pkgdir}/usr/share/${pkgname}/pages" "${source_dir}/main/pages"/*
    install -m755 -t "${pkgdir}/usr/share/${pkgname}" "${source_dir}/main"/*.*

    # 主程序入口
    ln -s "/usr/share/${pkgname}/sk-chos-tool.py" "${pkgdir}/usr/bin/sk-chos-tool"


    # 程序图标
    install -Dm644 "${source_dir}/sk-chos-tool-command.desktop" "${pkgdir}/usr/share/applications/sk-chos-tool-command.desktop"
    install -Dm644 "${source_dir}/sk-chos-tool.desktop" "${pkgdir}/usr/share/applications/sk-chos-tool.desktop"

}
