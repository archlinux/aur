#Maintainer:    HEx_404 < HEx_404x at proton dot me >
#Contributor:  	ZorinArch < zorinarch at protonmail dot com >

pkgname=abdownloadmanager-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="A Download Manager that speeds up your downloads"
arch=('x86_64')
url="https://abdownloadmanager.com/"
license=('Apache-2.0')
depends=(
    'glibc'
    'java-runtime'
    'zlib'
    'alsa-lib'
    'libglvnd'
    'libxi'
    'freetype2'
    'libxtst'
    'libxrender'
    'fontconfig'
    'libx11'
    'libxext'
    )
provides=('abdownloadmanager')
conflicts=('abdownloadmanager')
options=(!debug)
source=("https://github.com/amir1376/${pkgname%-bin}/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux.deb")
sha256sums=('654ca099e7b928ffe93bbbf96f342f2b1dc0a3c76b0bdf6ca3253572d3501669')

prepare() {
	bsdtar -xvf "${srcdir}/data.tar.zst" -C "${srcdir}/"
}

build() {
	sed -e 's|AB Download Manager|Network;|' \
        -e 's|Icon=\/opt\/abdownloadmanager\/lib\/ABDownloadManager.png|Icon=abdownloadmanager|' \
        -e 's|MimeType=|StartupNotify=false|' \
        -e '$aStartupWMClass=com.abdownloadmanager.ABDownloadManager' \
		-e '$aGenericName=Download Manager' \
		-i "${srcdir}/opt/abdownloadmanager/lib/abdownloadmanager-ABDownloadManager.desktop"
}

package() {
    rm -rf "${srcdir}/opt/abdownloadmanager/share/"
    install -dm755 "${pkgdir}/opt"
    cp --preserve=mode -r "${srcdir}/opt" "${pkgdir}/"

    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/abdownloadmanager/lib/abdownloadmanager-ABDownloadManager.desktop" \
       "${pkgdir}/usr/share/applications/abdownloadmanager.desktop"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    cp "${srcdir}/opt/abdownloadmanager/lib/ABDownloadManager.png" \
       "${pkgdir}/usr/share/icons/hicolor/512x512/apps/abdownloadmanager.png"

    rm -f "${pkgdir}/opt/abdownloadmanager/lib/abdownloadmanager-ABDownloadManager.desktop"
    rm -f "${pkgdir}/opt/abdownloadmanager/lib/ABDownloadManager.png"
}

