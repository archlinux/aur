# Maintainer: Ashley Towns <mail(at)ashleytowns(dot)id(dot)au>

_version=DEVELOPMENT-SNAPSHOT-2016-04-25-a

pkgname=swift-development-bin
pkgver=${_version//-/.}
pkgrel=1
pkgdesc="The Swift programming language, the development snapshot binary drops from the official website"
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('icu55' 'ncurses5-compat-libs' 'libedit' 'python2' 'libutil-linux' 'libbsd' 'clang' 'libtinfo' 'python2-six' 'libxml2')
conflicts=('lldb' 'swift-language-git' 'swift-bin')
options=('!strip')
validpgpkeys=('7463A81A4B2EEA1B551FFBCFD441C977412B37AD')
provides=('swift-language')
replaces=('swift-language-bin')

source=(
  "https://swift.org/builds/development/ubuntu1510/swift-${_version}/swift-${_version}-ubuntu15.10.tar.gz"
  "https://swift.org/builds/development/ubuntu1510/swift-${_version}/swift-${_version}-ubuntu15.10.tar.gz.sig"
  "swift.conf"
)
sha256sums=('835952d52de5193b20468558523968721f55c19036608f36d3011bcd1be6f0dd'
            'SKIP'
            'c93a77b3a9b2647266a5ccdbe77f47d51cb7051d23ee7cca6258564daf713f35')

package() {
    tar -C "$pkgdir" -xf "swift-${_version}"*.tar.gz --strip 1

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/usr/local"

    # Yuck! patching libedit SONAME
    find "${pkgdir}/usr/bin" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;
    find "${pkgdir}/usr/lib" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;

    # remove the six.py dumped in python's site packages
    rm "${pkgdir}/usr/lib/python2.7/site-packages/six.py"

    # Ensure the items have the right permissions..
    # some tarballs from upstream seem to have the wrong ones
    find "${pkgdir}/usr/bin" -type f -exec chmod a+rx {} \;
    find "${pkgdir}/usr/lib" -type f -exec chmod a+r {} \; 

    # Update glibc map paths
    sed -i 's/\/x86_64-linux-gnu//g' "${pkgdir}/usr/lib/swift/linux/x86_64/glibc.modulemap"

    # Adds swift libs to the ldpath 
    install -Dm644 $srcdir/swift.conf $pkgdir/etc/ld.so.conf.d/swift.conf

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/share/swift/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
