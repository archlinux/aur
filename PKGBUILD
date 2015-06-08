# Maintainer : Sebastian Lau <lauseb644@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Liganic <liganic-aur@gmx.org>
# Contributor: Bernd Amend <berndamend@web.de>
# Contributor: Holodoc <archlinux@bananapro.de>

pkgname=giteye
pkgver=1.10.0
pkgrel=1
pkgdesc="A desktop for Git. It works with TeamForge, CloudForge, GitHub and other Git services."
arch=('i686' 'x86_64')
url="http://www.collab.net/giteyeapp"
license=('custom')
depends=('git' 'java-environment' 'python2')
makedepends=('unzip')
options=('!strip')
source=("https://downloads-guests.open.collab.net/files/documents/61/10458/GitEye-${pkgver}-linux.x86.zip"
        "LICENSE"
        "${pkgname}.desktop")
md5sums=('4ff6ee5c75cc05cd374b32563bd75de1'
	 '4df23a2c4f45c567feae7665694cd11a'
	 '3144b18d4ddf6ac166afe374872ce4b4')

if [ "$CARCH" == "x86_64" ]; then
    source[0]="https://downloads-guests.open.collab.net/files/documents/61/10459/GitEye-${pkgver}-linux.x86_64.zip"
    md5sums[0]='a8fb375b0ae86be9df9dd644e2e0d49f'
fi

noextract=(${source[@]##*/}) # extract nothing

package() {
    cd "${srcdir}"

    msg2 "Extracting GitEye from archive..."
    install -Ddm755 "${pkgdir}/opt/${pkgname}/"
    install -Ddm755 "${pkgdir}/usr/bin/"
    unzip -q ${noextract} -d "${pkgdir}/opt/${pkgname}/"

    msg2 "Linking executable..."
    ln -s "/opt/${pkgname}/GitEye" "${pkgdir}/usr/bin/"

    msg2 "Installing LICENSE..."
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    msg2 "Installing desktop file..."
    install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"

    msg2 "Making apache ant use python2 instead of python..."
    sed -i 's/python/python2/' "${pkgdir}/opt/giteye/plugins/org.apache.ant_1.9.2.v201404171502/bin/runant.py"
}
