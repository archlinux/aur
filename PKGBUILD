# Maintainer: Maykon Marcos Junior <maykon.marcos.junior.dev@gmail.com>
# Based on upwork-appimage package on the AUR
#
# There's no central repository for AppImages, and no convention on
# system-wide AppImage installations, so we're picking /opt/appimages.

pkgname=fbreader-appimage
pkgver=2.1.3
pkgrel=1

pkgdesc="An ebook reader supporting EPUB, with google drive sync (including last read page)"
arch=('x86_64')
depends=('zlib' 'libxcb')
makedepends=('p7zip')
url="https://fbreader.org/"
license=('AGPL3')
_filename="FBReader_Book_Reader-$arch-$pkgver.AppImage"
noextract=("$_filename")
options=('!strip')
install=${pkgname}.install
source=(
    "https://fbreader.org/static/packages/linux/FBReader_Book_Reader-$arch-$pkgver.AppImage"
    "fbreader.desktop"
    "fbreader.png"
    "fbreader-appimage.sh")
sha512sums=('cbe928dc3b8cf38920ed59feeaf92e3666abedd35f796e78d6804cf538a5190633c6a5bf62a8657266bbf6ad5c35be0b98d80e865c868f5be7b6e6d8402c98d8'
            'a66214ad330f96f7025b9bf75fbf72c152758f919bbbb14479aefa341b9f7c1dbcae2ab3b4a9864935f0c739f3f12ef10e6799be69f9be3435b4db7456fce592'
            '7945eebaa491b5212d6a7dff3e4dcea4ab3299ef8379bdb6d48cfe27a8759fb938799494832fdd552b8eb4865a1ad978833b0aacd1c92ece67c1efcf844a1d5d'
            '926bc93f16521fd49272f87285c63d7f01e2c22c1bf63f5bd1cdf2ad4b71678b6392aadda650f5e70ffbd62256db900e60fca23288411296acb2721aa0e3bdbb')

prepare() {
    cd "${srcdir}"
    mv "$_filename" "fbreader.AppImage"
    # 7z x "${srcdir}/fbreader.AppImage" fbreader.png
    # 7z x "${srcdir}/fbreader.AppImage" fbreader.desktop
    mkdir -p usr/share/pixmaps usr/share/applications opt/appimages
    cp fbreader.png usr/share/pixmaps
    # sed -i 's@Exec=.*@Exec=QT_QPA_PLATFORM=xcb /opt/appimages/fbreader.AppImage %u@' fbreader.desktop
    # sed -i 's@Icon=.*@Icon=/usr/share/pixmaps/fbreader.png @' fbreader.desktop
    cp fbreader.desktop usr/share/applications
    cp fbreader.AppImage opt/appimages/
}

#package() {
#    cd "${srcdir}"
#    cp -rp usr "${pkgdir}/usr"
#    cp -rp opt "${pkgdir}/opt"
#    chmod +x "${pkgdir}/opt/appimages/fbreader.AppImage"
#}

package() {
    pkgdesc="FBReader (AppImage packaging)"
    install -d "${pkgdir}/opt/appimages"
    # install the AppImage to /opt/appimages
    install -Dm755 "${srcdir}/fbreader.AppImage" \
        "${pkgdir}/opt/appimages/fbreader.AppImage"

    # install wrapper launcher into /usr/bin
    install -Dm755 "${srcdir}/fbreader-appimage.sh" \
        "${pkgdir}/usr/bin/fbreader-appimage"

    # install .desktop into standard location
    install -Dm644 "${srcdir}/fbreader.desktop" \
        "${pkgdir}/usr/share/applications/fbreader.desktop"

    # install icon into pixmaps so Icon=fbreader will resolve
    install -Dm644 "${srcdir}/fbreader.png" \
        "${pkgdir}/usr/share/pixmaps/fbreader.png"

    # optional: a symlink from /opt/apps to make debugging easier (comment out if unwanted)
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    echo "AppImage located at /opt/appimages/fbreader.AppImage" > "${pkgdir}/usr/share/doc/${pkgname}/README"
}