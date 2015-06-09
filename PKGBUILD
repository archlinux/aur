# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
pkgname=010editor
pkgver=6.0.2
pkgrel=1
pkgdesc="Professional text and hex editing with Binary Templates technology"
arch=('i686' 'x86_64')
url="http://www.sweetscape.com/010editor/"
license=('custom:proprietary')
depends=('qt4')
source=("010editor.desktop")
md5sums=('4cff010c132fdd24399e5dd57834b93b')

if [[ ${CARCH} = x86_64 ]]; then
	source+=("http://www.sweetscape.com/download/010EditorLinux64Installer.tar.gz")
	md5sums+=('ac3cea47802cb21033cca185c7164236')
	_installer="010EditorLinux64Installer"
else
	source+=("http://www.sweetscape.com/download/010EditorLinux32Installer.tar.gz")
	md5sums+=('aa3b511927b7bd81e0d285fec497a274')
	_installer="010EditorLinux32Installer"
fi

build() {
    cd "${srcdir}"
    
    [[ -d prefix ]] && rm -rf prefix
    mkdir prefix
    
    msg2 "Running the installer"
    ./${_installer} --mode silent --prefix ${PWD}/prefix
}

package() {
    cd "${srcdir}/prefix"

    install -dm755 "${pkgdir}/opt/${pkgname}/Data/"
    install -dm755 "${pkgdir}/opt/${pkgname}/ext/"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
    install -dm755 "${pkgdir}/usr/bin"

    install -Dm644 "010Editor.qch" \
                   "010Editor.qhc" \
                   "010_icon_128x128.png" \
                   "010editor.news" \
                   "${pkgdir}/opt/${pkgname}/"
    install -Dm644 Data/*      "${pkgdir}/opt/${pkgname}/Data/"
    install -Dm644 ext/*       "${pkgdir}/opt/${pkgname}/ext/"
    install -Dm755 "010editor" "${pkgdir}/opt/${pkgname}/010editor"
    install -Dm644 "Changes.txt" \
                   "Readme.txt" \
                   "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    ln -s "/usr/bin/assistant-qt4" "${pkgdir}/opt/${pkgname}/assistant"

    install -Dm644 "010_icon_128x128.png" "${pkgdir}/usr/share/pixmaps/010editor.png"
    install -Dm644 "${srcdir}/010editor.desktop" "${pkgdir}/usr/share/applications/010editor.desktop"
    ln -s "/opt/${pkgname}/010editor" "${pkgdir}/usr/bin/010editor"
}
