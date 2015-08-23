# Maintainer : Sebastian Lau <lauseb644@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Liganic <liganic-aur@gmx.org>
# Contributor: Bernd Amend <berndamend@web.de>
# Contributor: Holodoc <archlinux@bananapro.de>

pkgname=giteye
pkgver=1.11.0
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
md5sums=('4df23a2c4f45c567feae7665694cd11a'
         '3144b18d4ddf6ac166afe374872ce4b4')
md5sums_x86_64=('a6c3e91d9dee12877a27aafabc77f38e')
md5sums_x86=('2ab57f083344ead599d0f64b811adc36')

_subfolder="61/11867"
_antver="1.9.4.v201504302020"

source_x86_64=("https://downloads-guests.open.collab.net/files/documents/${_subfolder}/GitEye-${pkgver}-linux.x86_64.zip")
source_x86=("https://downloads-guests.open.collab.net/files/documents/${_subfolder}/GitEye-${pkgver}-linux.x86.zip")

noextract=(*.zip) # extract nothing

package() {
    cd "${srcdir}"

    msg2 "Extracting GitEye from archive..."
    install -Ddm755 "${pkgdir}/opt/${pkgname}/"
    install -Ddm755 "${pkgdir}/usr/bin/"
    unzip -q ${noextract} -d "${pkgdir}/opt/${pkgname}/"

    msg2 "Linking executable..."
    ln -s "/opt/${pkgname}/GitEye" "${pkgdir}/usr/bin/"

    msg2 "Installing LICENSE..."
    if [[ "$CARCH" = "x_86_64" ]]; then
	sed -i 's/32-bit/64-bit/' LICENSE
    fi
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    msg2 "Installing desktop file..."
    install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"

    msg2 "Making apache ant use python2 instead of python..."
    sed -i 's/python/python2/' "${pkgdir}/opt/giteye/plugins/org.apache.ant_${_antver}/bin/runant.py"
}
