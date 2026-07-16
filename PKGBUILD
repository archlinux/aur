pkgname=shamela-bin
pkgver=1447.11
pkgrel=5
pkgdesc="المكتبة الشاملة - نسخة غير رسمية مجمعة لأرش جنو لينكس"
arch=('x86_64')
url="https://shamela.ws/"
license=('custom')
depends=('libselinux' 'glibc' 'zlib' 'fontconfig' 'freetype2' 'hicolor-icon-theme')
provides=('shamela')
conflicts=('shamela')
options=('!strip' '!debug')
install=shamela.install

source=("launch.sh"
        "shamela.desktop"
        "shamela.install"
        "shamela_icon.png")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    exec < /dev/tty
    
    echo -n "Do you have the Shamela library archive (shamela-linux.tar.xz) locally? (y/n): "
    read -r has_local
    
    if [[ "$has_local" == "y" || "$has_local" == "Y" ]]; then
        echo -n "Enter the full path to the archive file: "
        read -r local_path
        cp "$local_path" "$srcdir/shamela-linux.tar.xz"
    else
        curl -L -o "$srcdir/shamela-linux.tar.xz" "https://archive.org/download/shamela_download/shamela-linux-1447.11.tar.xz"
    fi
    
    tar -xf "$srcdir/shamela-linux.tar.xz" -C "$srcdir/"
    
    echo -n "Enter the installation path (Press Enter to choose /opt/shamela): "
    read -r custom_path
    
    if [[ -z "$custom_path" ]]; then
        custom_path="/opt/shamela"
    fi
    
    echo "$custom_path" > "$srcdir/install_path.txt"
    
    sed -i "s|/opt/shamela|$custom_path|g" "$srcdir/shamela.desktop"
    sed -i "s|/opt/shamela|$custom_path|g" "$srcdir/launch.sh"
}

package() {
    _install_path=$(cat "$srcdir/install_path.txt")
    
    install -d "${pkgdir}${_install_path}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    cp -r "${srcdir}/shamela/"* "${pkgdir}${_install_path}/"
    
    install -m644 "${srcdir}/shamela_icon.png" "${pkgdir}${_install_path}/shamela_icon.png" 
    install -m644 "${srcdir}/shamela_icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/shamela.png"
    install -m755 "${srcdir}/launch.sh" "${pkgdir}${_install_path}/launch.sh" 
    
    ln -s "${_install_path}/launch.sh" "${pkgdir}/usr/bin/shamela" 
    install -m644 "${srcdir}/shamela.desktop" "${pkgdir}/usr/share/applications/shamela.desktop" 
    
    echo "${_install_path}" > "${pkgdir}/usr/share/shamela-bin.conf"
}