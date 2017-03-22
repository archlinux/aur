pkgname=enpass-bin
_pkgname=enpass
pkgver=5.5.2
_pkgver_x86_x64=5.5.2
_pkgver_i686=5.5.2
pkgrel=1
pkgdesc="A multiplatform password manager"
arch=('i686' 'x86_64')
url="http://enpass.io/"
license=('custom')
depends=('libxss' 'lsof')
conflicts=('enpass-beta-bin' 'enpass-rc-bin')
provides=("${_pkgname}")
install=enpass-bin.install
source_x86_64=("http://repo.sinew.in/pool/main/e/enpass/${_pkgname}_${_pkgver_x86_x64}_amd64.deb")
source_i686=("http://repo.sinew.in/pool/main/e/enpass/${_pkgname}_${_pkgver_i686}_i386.deb")
sha256sums_x86_64=('54945cd8598d496d911b1fb3299a8d0bb8061c6ff317f703016aae58f69587ce')
sha256sums_i686=('769945f31c3083a3912aee3bdc284f1e30b82e23ed5aa4c13a1b814544dcf8ab')

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
