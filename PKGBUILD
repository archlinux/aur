pkgname=enpass-bin
_pkgname=enpass
pkgver=5.0.2
pkgrel=3
pkgdesc="A multiplatform password manager"
arch=('i686' 'x86_64')
url="http://enpass.io/"
license=('custom')
depends=('libxss' 'lsof' 'libappindicator-gtk2')
install=enpass-bin.install
case $CARCH in
    'x86_64')
        _arch='amd64'
        sha256sums=(
            '774db0dfe6eb3f51c098249952366210944672238d6f3aafced290ac0cee0416'
        )
        ;;
    'i686')
        _arch='i386'
        sha256sums=(
            '672409d840733aceb95f6f20cf6799814546c48f699b4f9efd63b382db1ed3bd'
        )
        ;;
esac

source=(http://repo.sinew.in/pool/main/e/enpass/${_pkgname}_${pkgver}_${_arch}.deb)

package() {
    # Extract data
    tar xfz ${srcdir}/data.tar.gz -C ${pkgdir}/

    # Remove unnecessary files which are included in the .deb
    find ${pkgdir} -name ".DS_Store" -delete
    find ${pkgdir} -name "._.DS_Store" -delete
    find ${pkgdir} -name "._enpass.png" -delete

    # Update permissions to match the default system ones
    chmod 755 ${pkgdir}/opt/
    find ${pkgdir}/usr/ -type d -exec chmod 755 {} \;

    # Symlink "runenpass.sh" to "/usr/bin" so it is accessible via terminal
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/Enpass/bin/runenpass.sh ${pkgdir}/usr/bin/enpass
}
