pkgname=enpass-bin
_pkgname=enpass
pkgver=5.0.4.1
pkgrel=1
pkgdesc="A multiplatform password manager"
arch=('i686' 'x86_64')
url="http://enpass.io/"
license=('custom')
depends=('libxss' 'lsof')
install=enpass-bin.install
case $CARCH in
    'x86_64')
        _arch='amd64'
        sha256sums=(
            '1d5646f86f63ed72568f1a3c2651dd8c5f27a35d7b78b07aea206ea216d67e1a'
        )
        ;;
    'i686')
        _arch='i386'
        sha256sums=(
            'a154c0c77566e57701fea1d91c8041d492fbdf71213226db9fe74ea1ed9147f4'
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
