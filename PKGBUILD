# Maintainer: honjow
pkgname=sk-holoiso-config
pkgver=r139.06627a6
pkgrel=1
pkgdesc="A custom configs tool for sk-holoiso"
arch=('any')
url="https://github.com/honjow/sk-holoiso-config"
license=('MIT')
makedepends=('git')
depends=('python-gobject' 'gtk3' 'openssl')
provides=(sk-holoiso-config)
conflicts=(sk-holoiso-config)
source=("git+$url")
sha256sums=('SKIP')
options=(!strip)
install=sk-holoiso-config.install
optdepends=('holo-gs-auto-update: auto update gamescope-session')

pkgver() {
    cd "$srcdir/sk-holoiso-config"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    source_dir="${srcdir}/sk-holoiso-config/src/holoiso"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"

    # oxp2 fix 
    install -dm755 "${pkgdir}/usr/share/${pkgname}/oxp2Fix"
    install -m644 -t "${pkgdir}/usr/share/${pkgname}/oxp2Fix" "${source_dir}/oxp2Fix"/* 

    # 服务
    install -dm755 "${pkgdir}/etc/systemd/system/"
    install -m644 -t "${pkgdir}/etc/systemd/system/" "${source_dir}/etc/systemd/system"/*
    install -m644 -t "${pkgdir}/etc/" "${source_dir}/etc"/*.conf

    # 脚本
    install -dm755 "${pkgdir}/usr/bin/"
    install -m755 -t "${pkgdir}/usr/bin/" "${source_dir}/usr/bin"/*

    # 主程序
    install -dm755 "${pkgdir}/usr/share/${pkgname}/pages"
    install -m755 -t "${pkgdir}/usr/share/${pkgname}/pages" "${source_dir}/main/pages"/*
    install -m755 -t "${pkgdir}/usr/share/${pkgname}" "${source_dir}/main"/*.*


    # 主程序入口
    ln -s "/usr/share/${pkgname}/sk-holoiso-config.py" "${pkgdir}/usr/bin/sk-holoiso-config"

    install -Dm644 -t "${pkgdir}/etc/default/" "${source_dir}/etc/default"/*

    install -dm755 "${pkgdir}/boot"
    install -m644 -t "${pkgdir}/boot/" "${source_dir}/boot"/*_acpi_override

    install -Dm644 "${source_dir}/etc/X11/Xsession.d/50rotate-screen" "${pkgdir}/etc/X11/Xsession.d/50rotate-screen"

    install -dm755 "${pkgdir}/etc/udev/rules.d/"
    install -dm755 "${pkgdir}/etc/udev/hwdb.d/"
    install -m644 -t "${pkgdir}/etc/udev/rules.d/" "${source_dir}/etc/udev/rules.d"/*
    install -m644 -t "${pkgdir}/etc/udev/hwdb.d/" "${source_dir}/etc/udev/hwdb.d"/*

    # install -Dm644 "${source_dir}/etc/udev/rules.d/99-disable-bluetooth-autosuspend.rules" "${pkgdir}/etc/udev/rules.d/99-disable-bluetooth-autosuspend.rules"

    install -Dm644 "${source_dir}/etc/fonts/conf.d/99-noto-cjk.conf" "${pkgdir}/etc/fonts/conf.d/99-noto-cjk.conf"

    # 程序图标
    install -Dm644 "${source_dir}/sk-config-konsole.desktop" "${pkgdir}/usr/share/applications/sk-config-konsole.desktop"
    install -Dm644 "${source_dir}/sk-config.desktop" "${pkgdir}/usr/share/applications/sk-config.desktop"

}
