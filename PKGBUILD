# Maintainer: youngunix <>


_version=3.1
pkgname=swift-bin
pkgver=${_version//-/.}
pkgrel=1
pkgdesc="Official binary builds of the Swift programming language."
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('icu55' 'ncurses5-compat-libs' 'libedit' 'python2' 'libutil-linux' 'libbsd' 'clang' 'python2-six' 'libxml2')
conflicts=('lldb' 'swift-language-git')
options=('!strip')
validpgpkeys=('A3BAFD3556A59079C06894BD63BC1CFE91D306C6')
provides=('swift-language')
replaces=('swift-language-bin')

source=(
  "https://swift.org/builds/swift-${_version}-release/ubuntu1604/swift-${_version}-RELEASE/swift-${_version}-RELEASE-ubuntu16.04.tar.gz"
  "https://swift.org/builds/swift-${_version}-release/ubuntu1604/swift-${_version}-RELEASE/swift-${_version}-RELEASE-ubuntu16.04.tar.gz.sig"
)
sha256sums=('ed70045a3b5afd89353eeedda26711e04dd7c6fc26dc47b3189a12bbdabc3308'
            '22c3ab87a0468778c5d74e267f741568d708d43ac48c08f8aa96f8f421ace3db')

package() {
    tar -C "$pkgdir" -xf "swift-${_version}-RELEASE"*.tar.gz --strip 1

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/usr/local"

    # Yuck! patching libedit SONAME
    find "${pkgdir}/usr/bin" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;
    find "${pkgdir}/usr/lib" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;

    # remove the six.py dumped in python's site packages
    rm "${pkgdir}/usr/lib/python2.7/site-packages/six.py"
    rm "${pkgdir}/usr/lib/python2.7/site-packages/six.pyc"

    # Ensure the items have the right permissions..
    # some tarballs from upstream seem to have the wrong ones
    find "${pkgdir}/usr/bin" -type f -exec chmod a+rx {} \;
    find "${pkgdir}/usr/lib" -type f -exec chmod a+r {} \;     

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/share/swift/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
