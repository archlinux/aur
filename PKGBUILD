pkgname=enpass-bin
_pkgname=enpass
pkgver=5.4.0.4
_pkgver_x86_x64=5.4.0-4
_pkgver_i686=5.4.0-4
pkgrel=1
pkgdesc="A multiplatform password manager"
arch=('i686' 'x86_64')
url="http://enpass.io/"
license=('custom')
depends=('libxss' 'lsof')
install=enpass-bin.install
source_x86_64=("http://repo.sinew.in/pool/main/e/enpass/${_pkgname}_${_pkgver_x86_x64}_amd64.deb")
source_i686=("http://repo.sinew.in/pool/main/e/enpass/${_pkgname}_${_pkgver_i686}_i386.deb")
sha256sums_x86_64=(
    '6b460fed2d7d8473e2b5d069dbe60263195b916c8b79a8fc7c2e8cb953134579'
)
sha256sums_i686=(
    '1ec8088d5c3b2906d6820f96e1868c473e78dbe882f04e74a7816d19d43e3692'
)

# Disable strip as otherwise the browser extension will not work
options=('!strip')

package() {
    # Extract data
    tar xfz ${srcdir}/data.tar.gz -C ${pkgdir}

    # Remove unnecessary files which are included in the .deb
    find ${pkgdir} -name ".DS_Store" -delete
    find ${pkgdir} -name "._.DS_Store" -delete
    find ${pkgdir} -name "._enpass.png" -delete
    find ${pkgdir} -name "*.swp" -delete

    # Update permissions to match the default system ones
    chmod 755 ${pkgdir}/opt/
    find ${pkgdir}/usr/ -type d -exec chmod 755 {} \;

    # Symlink "runenpass.sh" to "/usr/bin" so it is accessible via cli
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/Enpass/bin/runenpass.sh ${pkgdir}/usr/bin/enpass
}
