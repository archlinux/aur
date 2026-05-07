# Maintainer:  nathawat <nathawat at noreply dot codeberg dot org>
# Contributor: Mohamed tarek <Mokhamed_tarek@mail.ru>
# Contributor: rotzelbart <tausendkubik@gmail.com>
# Contributor: TechVio <68242352+techvio1@users.noreply.github.com>
# Contributor: chn <g897331845@gmail.com>
# Contributor: Hunter Wittenborn <git@hunterwittenborn.me>
# Contributor: Alfin Bakhtiar Ilhami <alfin at nuclea dot id>
# Contributor: Jan-Tarek Butt <tarek at ring0 dot de>

pkgname=bootstrap-studio
pkgver=8.0.1
pkgrel=1
pkgdesc="Bootstrap Studio is a powerful tool which web developers and designers use to create layouts and fully functional websites using the Bootstrap framework."
arch=("x86_64")
license=("custom")
url="https://bootstrapstudio.io/"
depends=(
    'alsa-lib'
    'gtk3'
    'libcups'
    'nss'
)

source=("https://releases.bootstrapstudio.io/${pkgver}/Bootstrap%20Studio.AppImage"
        "bstudio.desktop")
b2sums=('c7dd0e6493fb6317cf4f6da7f2bd83a0e13de4de44a9f8a2455521de07240a8b86512a6ccfbbc0799ff17c09753502b16a9aaefc34ecefee91874775e448a814'
        '6588d6c99396a05eafa74ca0e4d0c1113ff927f0fc6afc6cf549bf251b1f03a742d0a39d5e1b8bffd0052b49196357daafef371c1ebd49efc16ef353ab3d9daa')
prepare() {
    # Extract AppImage
    echo "Extracting AppImage..."
    mv "Bootstrap%20Studio.AppImage" "Bootstrap Studio.AppImage"
    chmod +x "Bootstrap Studio.AppImage"
    ./"Bootstrap Studio.AppImage" --appimage-extract &> /dev/null
}

package() {
    # Copy package files
    echo "Copying package files..."
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -Lr "${srcdir}/squashfs-root" "${pkgdir}/opt/${pkgname}"

    # Set permissions
    chmod a+rx "${pkgdir}/opt/${pkgname}/" -R

    # Create launcher script
    mkdir -p "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash
if [ \$# -eq 0 ]; then
    /opt/${pkgname}/squashfs-root/AppRun
else
    /opt/${pkgname}/squashfs-root/AppRun "\$@"
fi
EOF
    chmod +x "${pkgdir}/usr/bin/${pkgname}"

    # Copy .desktop file
    mkdir -p "${pkgdir}/usr/share/applications"
    cp -Lr "${srcdir}/bstudio.desktop" "${pkgdir}/usr/share/applications/"

    # Copy icons
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/"{128x128,192x192,256x256,512x512}"/apps/"
    for i in 128x128 192x192 256x256 512x512; do
        cp -Lr "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/bstudio.png" "${pkgdir}/usr/share/icons/hicolor/${i}/apps/"
    done
}
