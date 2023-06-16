# Maintainer: honjow
pkgname=sk-holoiso-config
pkgver=r47.3827189
pkgrel=1
pkgdesc="A custom configs tool for sk-holoiso"
arch=('any')
url="https://github.com/honjow/sk-holoiso-config"
license=('MIT')
makedepends=('git')
depends=('python-gobject' 'gtk3')
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
    source_dir="${srcdir}/sk-holoiso-config/src"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"

    # oxp2 fix 
    install -dm755 "${pkgdir}/usr/share/${pkgname}/oxp2Fix"
    install -m644 -t "${pkgdir}/usr/share/${pkgname}/oxp2Fix" "${source_dir}/oxp2Fix"/* 

    # 服务
    install -dm755 "${pkgdir}/etc/systemd/system/"
    install -m644 -t "${pkgdir}/etc/systemd/system/" "${source_dir}/etc/systemd/system"/*

    # 脚本
    install -dm755 "${pkgdir}/usr/bin/"
    install -m755 -t "${pkgdir}/usr/bin/" "${source_dir}/usr/bin"/*

    # 主程序
    install -m755 -t "${pkgdir}/usr/share/${pkgname}" "${source_dir}/main"/* 
    # install -Dm755 "${source_dir}/sk-holoiso-config.py" "${pkgdir}/usr/share/${pkgname}/sk-holoiso-config.py"
    ln -s "/usr/share/${pkgname}/sk-holoiso-config.py" "${pkgdir}/usr/bin/sk-holoiso-config"

    install -Dm644 "${source_dir}/etc/udev/rules.d/99-disable-bluetooth-autosuspend.rules" "${pkgdir}/etc/udev/rules.d/99-disable-bluetooth-autosuspend.rules"
    install -Dm644 "${source_dir}/etc/default/grub" "${pkgdir}/etc/default/grub"
    install -Dm644 "${source_dir}/etc/fonts/conf.d/99-noto-cjk.conf" "${pkgdir}/etc/fonts/conf.d/99-noto-cjk.conf"

    # 程序图标
    install -Dm644 "${source_dir}/sk-config.desktop" "${pkgdir}/usr/share/applications/sk-config.desktop"
}
