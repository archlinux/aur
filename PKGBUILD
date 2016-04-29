pkgname=enpass-bin
_pkgname=enpass
pkgver=5.2.0
_pkgver_x86_x64=5.2.0.1
_pkgver_i686=5.2.0
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
    'f6ca52edf0e6c0a075e93f823b9395a0e8c5a3217231d139b8cd40c2ca5e71f6'
)
sha256sums_i686=(
    '14695d8549d7ca7ff0612d687b49e4ad6e8a41863be94e8cacabc8c21f6069c5'
)

package() {
    # Extract data
    tar xfz ${srcdir}/data.tar.gz -C ${pkgdir}

    # Remove unnecessary files which are included in the .deb
    find ${pkgdir} -name ".DS_Store" -delete
    find ${pkgdir} -name "._.DS_Store" -delete
    find ${pkgdir} -name "._enpass.png" -delete

    # Update permissions to match the default system ones
    chmod 755 ${pkgdir}/opt/
    find ${pkgdir}/usr/ -type d -exec chmod 755 {} \;

    # Symlink libssl and libcrypto
    cd ${pkgdir}/opt/Enpass/lib/
    ln -s ./libssl.so.1.0.0 ./libssl.so
    ln -s ./libcrypto.so.1.0.0 ./libcrypto.so
    cd -

    # Symlink "runenpass.sh" to "/usr/bin" so it is accessible via cli
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/Enpass/bin/runenpass.sh ${pkgdir}/usr/bin/enpass
}
