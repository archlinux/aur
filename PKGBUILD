# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=tricks-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="The social network for programmers!"
arch=('x86_64')
url="https://tricks.aseman.io/"
license=('GPL3')
conflicts=('tricks')
provides=('tricks')
options=('!emptydirs' '!strip')
source=("https://tricks.aseman.io/tricks/static/downloads/Tricks-${pkgver}_linux.AppImage"
        "https://raw.githubusercontent.com/Aseman-Land/Tricks/main/LICENSE")
sha256sums=('b40ac37ad95179f91a76d4ae65802504df34dfa3f0d64996ab3a6b2092b77162'
						'2ca9503d76d1ffab14f599b4741382eec11face60ad1f0d7a41897809003a286')


_filename="Tricks-${pkgver}_linux.AppImage"
_squashfs_desktop_file="Tricks.desktop"
_desktop_file="/usr/share/applications/tricks.desktop"
_appimage_name=$(echo "${_filename}"|sed -E 's/-[0-9]*.[0-9]*.[0-9]*//')
_install_path="/opt/tricks-bin/${_appimage_name}"

package() {
    chmod +x "${_filename}"
    mkdir -p squashfs-root/usr/share/icons/hicolor/{72x72,16x16}/apps
    ./${_filename} --appimage-extract "tricks.png" > /dev/null 2>&1
    ./${_filename} --appimage-extract ${_squashfs_desktop_file} > /dev/null 2>&1
    echo "Exec=${_install_path} --no-check-desktop-installation" >> "squashfs-root/${_squashfs_desktop_file}"

    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/tricks.png" "${pkgdir}/usr/share/icons/"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "tricks.png" -exec chmod 644 {} \;

    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
    install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
    mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}" "${pkgdir}/usr/bin/tricks"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/tricks-bin/LICENSE"

}
