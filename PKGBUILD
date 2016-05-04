pkgname=enpass-bin
_pkgname=enpass
pkgver=5.2.1
_pkgver_x86_x64=5.2.1
_pkgver_i686=5.2.1
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
    'cb813244ecefa073172e09b445b88ff51832fe41f837cdb292153290d97bf8dd'
)
sha256sums_i686=(
    '617b6e4b4e0e26460439f896ab90b18a37869a6312c012ae1918d9eaa40e02a3'
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
