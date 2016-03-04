pkgname=enpass-bin
_pkgname=enpass
pkgver=5.0.5
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
            'cd413cb9170fc2d777d30a68103c9758059c4ce00beebd513b0773eadf2f9acc'
        )
        ;;
    'i686')
        _arch='i386'
        sha256sums=(
            'b196897e7dcb7f183bdcf82d0a03f2a97746efb6c51798db03a9587f21fec6db'
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
