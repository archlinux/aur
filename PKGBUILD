#Maintainer: friddle@qq.com

pkgname=aic8800-6.12
pkgver=1.0.0
pkgrel=1
pkgdesc="AIC8800 WiFi driver and firmware"
arch=('x86_64')
url="https://github.com/friddle/arch-aic8800-6.12"
license=('GPL2')
depends=('linux-headers')
makedepends=('linux-headers' 'git')
source=("git+${url}.git")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}"
    # No need to extract since git clone handles it
}

build() {
    cd "${srcdir}/arch-aic8800-6.12/drivers/aic8800"
    make
    cd "${srcdir}/arch-aic8800-6.12/aicrf_test"
    make
}

package() {
    # Install udev rules
    install -Dm644 "${srcdir}/arch-aic8800-6.12/aic.rules" "${pkgdir}/etc/udev/rules.d/99-aic.rules"

    # Install firmware
    install -dm755 "${pkgdir}/lib/firmware/aic8800DC"
    cp -r "${srcdir}/arch-aic8800-6.12/fw/aic8800DC/"* "${pkgdir}/lib/firmware/aic8800DC/"

    # Install kernel modules
    cd "${srcdir}/arch-aic8800-6.12/drivers/aic8800"
    make DESTDIR="${pkgdir}" install

    # Install test tools
    cd "${srcdir}/arch-aic8800-6.12/aicrf_test"
    make DESTDIR="${pkgdir}" install

    # Create post-install script
    install -Dm755 /dev/null "${pkgdir}/usr/lib/aic8800/post-install.sh"
    cat > "${pkgdir}/usr/lib/aic8800/post-install.sh" << 'EOF'
#!/bin/bash
udevadm trigger
udevadm control --reload
if [ -L /dev/aicudisk ]; then
    eject /dev/aicudisk
fi
modprobe cfg80211
modprobe aic_load_fw
modprobe aic8800_fdrv
EOF
    chmod +x "${pkgdir}/usr/lib/aic8800/post-install.sh"
} 
