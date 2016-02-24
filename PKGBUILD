pkgname=enpass-bin
_pkgname=enpass
pkgver=5.0.4
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
            '6431c07ddfbc08ef7c49fa3593055eca4908b41e149c8b3130d37a597f6fccb1'
        )
        ;;
    'i686')
        _arch='i386'
        sha256sums=(
            'd3c23d9a5f2ac280ec51c45731d89812bf0af425ea31c5e6f34a1e7e9d0995ee'
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
