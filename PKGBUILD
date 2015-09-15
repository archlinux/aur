# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=keepass-plugin-ioprotocolext
pkgver=1.10
pkgrel=1
pkgdesc="This plugin adds support for loading/saving files from/to servers using the SCP (Secure CoPy) protocol, SFTP (SSH File Transfer Protocol) and FTPS (FTP over SSH)."
arch=('any')
url="http://keepass.info/plugins.html#ioprotocolext"
license=('GPL')
depends=('keepass')
makedepends=('keepass' 'unzip' 'xorg-server')
provides=('keepass-plugin-ioprotocolext')
_required_keepass_version=2.27
_sourcefile="IOProtocolExt-$pkgver-Source.zip"
source=($_sourcefile)
noextract=($_sourcefile)
sha256sums=('a3a3202462daac07a047e1142efab86d7b048ef4dd7b299c98509b045d1c17c7')


prepare() {
    if [ -z "$DISPLAY" ]; then
        echo "Unfortunately, KeePass needs an active X server" \
             "and the \$DISPLAY variable to be able to compile the plugin."
        return 1
    fi
    unzip -o $_sourcefile -d $pkgname
}

build() {
    echo "Creating KeePass PLGX plugin..."
    keepass \
        --plgx-prereq-kp:$_required_keepass_version \
        --plgx-create $pkgname
}

package() {
    mkdir -p "${pkgdir}/usr/share/keepass/plugins"
    install -m644 "${srcdir}/${pkgname}.plgx" "${pkgdir}/usr/share/keepass/plugins/"
}
