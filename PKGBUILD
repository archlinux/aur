# Maintainer: Ashley Towns <mail(at)ashleytowns(dot)id(dot)au>

pkgname=swift-language-bin
pkgver=2.2.2015.12.01
pkgrel=1
pkgdesc="The Swift programming language, the binary drops from the official website"
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('icu55' 'ncurses5-compat-libs' 'libedit' 'python2' 'readline' 'libutil-linux' 'libbsd')
conflicts=('lldb')
options=('!strip')

_version=2.2
_snapshot=SNAPSHOT-2015-12-01-b

source=("https://swift.org/builds/ubuntu1510/swift-${_version}-${_snapshot}/swift-${_version}-${_snapshot}-ubuntu15.10.tar.gz")
sha256sums=('04d62c13a50bb6c3003676fe7521c9e28bc7bc38e42524330595e80a6df24806')

package() {
    tar -C "$pkgdir" -xf "swift-${_version}"*.tar.gz --strip 1

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/usr/local"

    # Yuck! patching libedit SONAME
    find "${pkgdir}/usr/bin" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;
    find "${pkgdir}/usr/lib" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;

    # Update glibc map paths
    sed -i 's/\/x86_64-linux-gnu//g' "${pkgdir}/usr/lib/swift/glibc/module.map"

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/share/swift/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
