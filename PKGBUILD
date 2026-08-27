# Maintainer: Shurjo <mail@shurjo.me>
pkgname=viisan-vf3240-sane-driver
pkgver=1.0.2.0
pkgrel=2
pkgdesc="SANE driver for the Viisan VF3240 A3 Flatbed scanner"
arch=('x86_64')
url="https://www.viisan.com/en/product/VF3240.html"
license=('proprietary')
depends=('sane' 'libusb' 'opencv')
options=('!debug' '!strip')
source=("viisan-vf3240-${pkgver}.zip::https://viisan.oss-us-west-1.aliyuncs.com/en/file/t91/VF3240%20Linux%20sane%20driver%20${pkgver}.zip")
sha256sums=('680d4c583400f935a2671f1c9a3be9425b9d0becb5b6beebf4918558aa369edc')

prepare() {
    cd "${srcdir}"/VF3240*
    
    msg2 "Extracting inner Debian package..."
    bsdtar -xf "viisan-vf3240-sane_${pkgver}_amd64.deb"
    
    msg2 "Unpacking data payload..."
    bsdtar -xf data.tar.*
}

package() {
    cd "${srcdir}"/VF3240*
    
    # 1. Base Installation Loop
    msg2 "Installing files to package root..."
    for dir in etc usr lib; do
        if [[ -d "$dir" ]]; then
            cp -dr --no-preserve=ownership "$dir" "${pkgdir}/"
        fi
    done

    if [[ -d "${pkgdir}/lib" ]]; then
        msg2 "Moving /lib to /usr/lib..."
        install -dm755 "${pkgdir}/usr/lib"
        cp -dr --no-preserve=ownership "${pkgdir}/lib/"* "${pkgdir}/usr/lib/"
        rm -rf "${pkgdir}/lib"
    fi

    # 2. Extract and Map Precompiled Files from /usr/local Target Paths
    if [[ -d "${pkgdir}/usr/local" ]]; then
        msg2 "Normalizing /usr/local to /usr..."
        if [[ -d "${pkgdir}/usr/local/lib64" ]]; then
            install -dm755 "${pkgdir}/usr/lib"
            cp -dr --no-preserve=ownership "${pkgdir}/usr/local/lib64/"* "${pkgdir}/usr/lib/"
        fi
        if [[ -d "${pkgdir}/usr/local/lib" ]]; then
            install -dm755 "${pkgdir}/usr/lib"
            cp -dr --no-preserve=ownership "${pkgdir}/usr/local/lib/"* "${pkgdir}/usr/lib/"
        fi
        rm -rf "${pkgdir}/usr/local"
    fi
    
    # 3. Handle Modern Udev System Policies
    if [[ -d "${pkgdir}/etc/udev/rules.d" ]]; then
        msg2 "Moving udev rules to /usr/lib/udev/rules.d..."
        install -dm755 "${pkgdir}/usr/lib/udev/rules.d"
        mv "${pkgdir}/etc/udev/rules.d/"* "${pkgdir}/usr/lib/udev/rules.d/"
        rm -rf "${pkgdir}/etc/udev/rules.d"
        rmdir --ignore-fail-on-non-empty "${pkgdir}/etc/udev"
    fi

    # 4. Configure SANE Drop-ins and Main Device Driver Maps
    msg2 "Adding SANE dll.d drop-in configuration..."
    install -dm755 "${pkgdir}/etc/sane.d/dll.d"
    echo "aviisandrvf3240" > "${pkgdir}/etc/sane.d/dll.d/${pkgname}"

    msg2 "Generating main standalone backend configuration map..."
    install -dm755 "${pkgdir}/etc/sane.d"
    cat <<EOF > "${pkgdir}/etc/sane.d/aviisandrvf3240.conf"
# Viisan VF3240 Configuration File
usb 0x2e5a 0xd011
EOF

    # 5. Fix Hardcoded Hardcoded Binary Directory Lookups
    msg2 "Re-building structural /usr/local paths to pass hardcoded validations..."
    
    # Satisfy the /usr/local/etc configuration lookups
    install -dm755 "${pkgdir}/usr/local/etc"
    ln -sf /etc/sane.d/aviisandrvf3240.conf "${pkgdir}/usr/local/etc/aviisandrvf3240.conf"
    
    # Satisfy the hardcoded /usr/local/lib64 library check seen in strace
    install -dm755 "${pkgdir}/usr/local/lib64/sane/aviisandr-adv"
    ln -sf /usr/lib/sane/aviisandr-adv/VF3240 "${pkgdir}/usr/local/lib64/sane/aviisandr-adv/VF3240"

    # 6. Build Direct System Symlinks for standard environment tracking
    msg2 "Linking nested aviisandr-adv libraries out to standard library paths..."
    local adv_dir="/usr/lib/sane/aviisandr-adv/VF3240"
    ln -sf "${adv_dir}/libviisanvf3240dr.so" "${pkgdir}/usr/lib/libviisanvf3240dr.so"
    ln -sf "${adv_dir}/libopencv_core.so.2.4" "${pkgdir}/usr/lib/libopencv_core.so.2.4"
    ln -sf "${adv_dir}/libopencv_core.so.2.4.11" "${pkgdir}/usr/lib/libopencv_core.so.2.4.11"

    # 7. Package Permission Tree Pass Overrides
    msg2 "Fixing tree file permissions..."
    find "${pkgdir}" -type d -exec chmod 755 {} +
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}/usr/lib" -type f \( -name "*.so*" -o -name "*.so" \) -exec chmod 755 {} + 2>/dev/null || true
}

