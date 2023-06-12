# Maintainer: honjow
pkgname=sk-holoiso-config
pkgver=r26.11901e6
pkgrel=1
pkgdesc="A custom configs for sk-holoiso"
arch=('any')
url="https://github.com/honjow/sk-holoiso-config"
license=('MIT')
makedepends=('git')
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
    source_services=("sk-auto-swap.service" "sk-efi-mount.service" "sk-root-resume.service")

    cd "$srcdir/sk-holoiso-config/src"
    for service_file in "${source_services[@]}"; do
        install -Dm644 "etc/systemd/system/$service_file" "$pkgdir/etc/systemd/system/$service_file"
    done

    exclude_files=("sk-auto-swap" "sk-efi-mount" "sk-resume" "sk-holoiso-config")
    for exclude_file in "${exclude_files[@]}"; do
        install -Dm755 "usr/bin/$exclude_file" "$pkgdir/usr/bin/$exclude_file"
    done

    install -Dm644 "etc/udev/rules.d/99-disable-bluetooth-autosuspend.rules" "$pkgdir/etc/udev/rules.d/99-disable-bluetooth-autosuspend.rules"
    install -Dm644 "etc/default/grub" "$pkgdir/etc/default/grub"
    install -Dm644 "etc/fonts/conf.d/99-noto-cjk.conf" "$pkgdir/etc/fonts/conf.d/99-noto-cjk.conf"

    install -Dm644 "sk-config.desktop" "${pkgdir}/usr/share/applications/sk-config.desktop"
}
