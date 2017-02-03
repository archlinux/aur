# Maintainer : Sebastian Lau <lauseb644 _at_ gmail .dot. com>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Liganic <liganic-aur@gmx.org>
# Contributor: Bernd Amend <berndamend@web.de>
# Contributor: Holodoc <archlinux@bananapro.de>

pkgname=giteye
pkgver=2.0.0
pkgrel=1
pkgdesc="A desktop for Git. It works with TeamForge, CloudForge, GitHub and other Git services."
arch=('i686' 'x86_64')
url="http://www.collab.net/giteyeapp"
license=('custom')
depends=('git' 'java-environment>=8' 'python2')
makedepends=('unzip')
options=('!strip')
source=("LICENSE"
        "${pkgname}.desktop")
md5sums=('a0a7e9e58de4ec20a975b50948b779f0'
         '3144b18d4ddf6ac166afe374872ce4b4')
md5sums_i686=('3755b166120d4512cd25afaf931fa15d')
md5sums_x86_64=('ca6b969ca89d40f6f1cf154c7dbc76e6')

_antver="1.9.6.v201510161327"

source_x86_64=("https://downloads-guests.open.collab.net/files/documents/61/13437/GitEye-${pkgver}-linux.x86_64.zip")
source_i686=("https://downloads-guests.open.collab.net/files/documents/61/13436/GitEye-${pkgver}-linux.x86.zip")

noextract=(*.zip) # extract nothing

package() {
    cd "${srcdir}"

    msg2 "Extracting GitEye from archive..."
    install -Ddm755 "${pkgdir}/opt/${pkgname}/"
    install -Ddm755 "${pkgdir}/usr/bin/"

    if [[ "$CARCH" = "i686" ]]; then
        unzip -q "GitEye-${pkgver}-linux.x86.zip" -d "${pkgdir}/opt/${pkgname}/"
    else
        unzip -q "GitEye-${pkgver}-linux.x86_64.zip" -d "${pkgdir}/opt/${pkgname}/"
    fi

    msg2 "Linking executable..."
    ln -s "/opt/${pkgname}/GitEye" "${pkgdir}/usr/bin/"

    msg2 "Installing LICENSE..."
    if [[ "$CARCH" = "i686" ]]; then
	sed -i 's/64-bit/32-bit/' LICENSE
    fi
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    msg2 "Installing desktop file..."
    install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"

    msg2 "Making apache ant use python2 instead of python..."
    sed -i 's/python/python2/' "${pkgdir}/opt/giteye/plugins/org.apache.ant_${_antver}/bin/runant.py"
}
