pkgname=enpass-bin
_pkgname=enpass
pkgver=5.5.6
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
sha256sums_x86_64=('2fbfa341fb98f4ffbb9f39f25a3564849fa5447fa9b12277084c49d0d0e5f5e3')
sha256sums_i686=('38a690dae4eeef2c2a21662dd575f6fedc7c63f26f4061e78d41a121e316b275')

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
