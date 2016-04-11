# Maintainer : Sebastian Lau <lauseb644 _at_ gmail .dot. com>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Liganic <liganic-aur@gmx.org>
# Contributor: Bernd Amend <berndamend@web.de>
# Contributor: Holodoc <archlinux@bananapro.de>

pkgname=giteye
pkgver=1.12.0
pkgrel=1
pkgdesc="A desktop for Git. It works with TeamForge, CloudForge, GitHub and other Git services."
arch=('i686' 'x86_64')
url="http://www.collab.net/giteyeapp"
license=('custom')
depends=('git' 'java-environment' 'python2')
makedepends=('unzip')
options=('!strip')
source=("LICENSE"
        "${pkgname}.desktop")
md5sums=('29a5e78a36cabce86274d07ea11dd502'
         '3144b18d4ddf6ac166afe374872ce4b4')
md5sums_i686=('02909e014f13dd29127887b02dbad1eb')
md5sums_x86_64=('ecff81dcaee493852ea66a105948af13')

_subfolder="61/12536"
_antver="1.9.4.v201504302020"

source_x86_64=("https://downloads-guests.open.collab.net/files/documents/${_subfolder}/GitEye-${pkgver}-linux.x86_64.zip")
source_i686=("https://downloads-guests.open.collab.net/files/documents/${_subfolder}/GitEye-${pkgver}-linux.x86.zip")

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
