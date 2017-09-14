pkgname=enpass-bin
_pkgname=enpass
pkgver=5.6.0
_pkgver_x86_x64=${pkgver}
_pkgver_i686=${pkgver}
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
sha256sums_x86_64=('129ae4b4bfb8e0b4fa9acdfb3aebac3dd894364f2f31e9cd3bd5d3567e3a13b7')
sha256sums_i686=('c456002194c0be08a2c0da68ecf224425e35c46de5292098208e4e2b1f6d88ae')

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
