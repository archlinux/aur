# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailmaster-bin
pkgver=5.0.2.1011
pkgrel=8
pkgdesc="Professional full-platform email client. One email, multiple syncs. All platforms give you a great experience.专业的全平台邮箱客户端。一封邮件，多端同步。所有平台都能给你出色的体验。"
arch=('x86_64')
url="https://dashi.163.com"
_sparkurl="https://mirrors.sdu.edu.cn/spark-store-repository"
_ablrun_url="https://portrait.gitee.com/spark-store-project/additional-base-lib"
_ubuntu_debdl_url="https://mirrors.sdu.edu.cn/ubuntu"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'alsa-lib'
    'libxrandr'
    'nss'
    'at-spi2-core'
    'pango'
    'gconf'
    'libxcomposite'
    'bubblewrap'
    'libxdamage'
    'libsasl'
    'zenity'
)
makedepends=(
    'imagemagick'
)
noextract=()
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_sparkurl}/store//network/mailmaster/${pkgname%-bin}_${pkgver}_amd64.deb"
    "libnss-wrapper-1.1.2.deb::${_ubuntu_debdl_url}/pool/main/n/nss-wrapper/libnss-wrapper_1.1.2-1_amd64.deb"
    "LICENSE.html::https://mail.163.com/html/agreement/doc.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('d7c272d50798b4f0dc5279efba383e8f12decef19e434b144e07c3c26c25c58a'
            'c1c9649b1bbd095a03c648d89b7bfeedcc7c15ae819e2a1a778427908eebb284'
            'c8ddd672f5be8b2986fadf04475da64d7768480bf3ec1d5e94479b1a675b40ff'
            '4bd4e8079ba1d7adb55f7b050e3358a48de09c88093a90a6c46397d54a0030a3')
build() {
    # Clean any leftover extraction state from previous builds
    cd "${srcdir}"
    rm -rf opt usr libnss-wrapper data.tar.*

    # Extract mailmaster .deb package properly
    echo "Extracting main package..."
    bsdtar -xf "${pkgname%-bin}-${pkgver}.deb"

    # Extract data archive
    if [ -f "data.tar.zst" ]; then
        echo "Found data.tar.zst, extracting..."
        bsdtar -xf "data.tar.zst"
    elif [ -f "data.tar.xz" ]; then
        echo "Found data.tar.xz, extracting..."
        bsdtar -xf "data.tar.xz"
    else
        echo "Error: No data archive found in the package"
        return 1
    fi

    # Check if all necessary files are present
    echo "Checking for required files..."
    if [ -d "opt/${pkgname%-bin}" ]; then
        find "opt/${pkgname%-bin}" -type f | head -20
    fi

    # Fix wrapper script
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"

    # Fix desktop file
    if [ -f "usr/share/applications/${pkgname%-bin}.desktop" ]; then
        sed -e "
            s/\/opt\/${pkgname%-bin}\/launch.sh/${pkgname%-bin}/g
            s/\/opt\/${pkgname%-bin}\/logo.ico/${pkgname%-bin}/g
            5i\Categories=Network;
        " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    fi

    # Convert icon
    if [ -f "opt/${pkgname%-bin}/logo.ico" ]; then
        magick "${srcdir}/opt/${pkgname%-bin}/logo.ico" "${srcdir}/${pkgname%-bin}.png"
    fi

    # Extract nss-wrapper
    echo "Extracting nss-wrapper..."
    install -Dm755 -d "${srcdir}/libnss-wrapper"
    bsdtar -xf "libnss-wrapper-1.1.2.deb" -C "${srcdir}/libnss-wrapper"
    if [ -f "${srcdir}/libnss-wrapper/data.tar.xz" ]; then
        bsdtar -xf "${srcdir}/libnss-wrapper/data.tar.xz" -C "${srcdir}/libnss-wrapper"
    fi
    if [ -f "${srcdir}/libnss-wrapper/usr/lib/libnss_wrapper.so" ]; then
        install -Dm644 "${srcdir}/libnss-wrapper/usr/lib/libnss_wrapper.so" -t "${srcdir}/opt/${pkgname%-bin}/lib"
    fi
}
package() {
    # Install wrapper script
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"

    # Copy all files from opt directory recursively
    if [ -d "${srcdir}/opt" ]; then
        cp -r "${srcdir}/opt" "${pkgdir}/"
        echo "Installed files from ${srcdir}/opt"
    fi

    # Install desktop file
    if [ -f "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" ]; then
        install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    fi

    # Install icon
    if [ -f "${srcdir}/${pkgname%-bin}.png" ]; then
        install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    fi

    # Install license
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # Create compatibility symlink for libsasl2
    if [ ! -f "${pkgdir}/opt/${pkgname%-bin}/lib/libsasl2.so.2" ]; then
        ln -s /usr/lib/libsasl2.so.3 "${pkgdir}/opt/${pkgname%-bin}/lib/libsasl2.so.2"
    fi

    # Verify installation
    echo "Verifying installation..."
    if [ -d "${pkgdir}/opt/${pkgname%-bin}" ]; then
        find "${pkgdir}/opt/${pkgname%-bin}" -type f | wc -l
    fi
}