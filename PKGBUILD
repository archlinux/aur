# Maintainer: full-bars <theinspiration17@proton.me>



pkgname=radar-omega

pkgver=5.5.2

pkgrel=1

pkgdesc="Radar Omega - Advanced weather radar application (AppImage)"

arch=('x86_64')

url="https://radaromega.com"

license=('proprietary')

depends=('fuse2' 'hicolor-icon-theme')

options=(!strip !debug)



# Source is fixed to download the AppImage binary from the verified URL.

source=("RadarOmega-${pkgver}-x86_64.AppImage::https://dl.todesktop.com/200402kk4yak2og/linux/appImage/x64")

# SECURE: Verified SHA256 sum for integrity checking.

sha256sums=('C34E05F4A1B37E631A64F6F79AE0595FA56269E4861D39BA754DBB9BD7A2FC42') 



package() {

    local appimage_file="RadarOmega-${pkgver}-x86_64.AppImage"

    local app_dir="${pkgdir}/opt/${pkgname}"

    

    # 1. Install AppImage into /opt/pkgname (standard location for large binaries)

    install -d "${app_dir}"

    install -Dm755 "${srcdir}/${appimage_file}" "${app_dir}/${pkgname}.AppImage"



    # 2. Add execution permission and reliably extract the AppImage content.

    chmod +x "${srcdir}/${appimage_file}"

    # Using the AppImage's internal extractor with chmod is the most robust fix for this specific file.

    "${srcdir}/${appimage_file}" --appimage-extract >/dev/null 2>&1



    # 3. Install all icons (PRESERVED: Your original, working logic)

    find squashfs-root/usr/share/icons/hicolor -type f \( -name "*.png" -o -name "*.svg" \) | while read -r icon; do

        relpath="${icon#*/hicolor/}"

        install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/$relpath"

    done



    # 4. Install and fix .desktop file

    find squashfs-root -name "*.desktop" -exec install -Dm644 {} "${pkgdir}/usr/share/applications/radar-omega.desktop" \;

    

    # Fix Exec line to point to the launcher script

    sed -i "s|^Exec=.*|Exec=${pkgname} %U|" "${pkgdir}/usr/share/applications/radar-omega.desktop"



    # Fix Icon line

    sed -i '/^Icon=/d' "${pkgdir}/usr/share/applications/radar-omega.desktop"

    echo "Icon=RadarOmega" >> "${pkgdir}/usr/share/applications/radar-omega.desktop"



    # 5. FIXED LAUNCHER SCRIPT: Uses the absolute system path /opt/ to avoid the execution error.

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<< "#!/bin/bash

    # This uses the FINAL system path, /opt/radar-omega/radar-omega.AppImage

    exec /opt/${pkgname}/${pkgname}.AppImage \"\$@\"

    "



    # 6. Cleanup extracted files

    rm -rf squashfs-root

}
