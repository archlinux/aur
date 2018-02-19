# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

_version=4.0.3
pkgname=swift-bin
pkgver=${_version//-/.}
pkgrel=4
pkgdesc="Official binary builds of the Swift programming language."
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('icu55' 'ncurses5-compat-libs' 'libedit' 'python2' 'libutil-linux' 'libbsd' 'clang' 'python2-six' 'libxml2' 'libcurl-compat' 'patchelf' 'bubblewrap')
makedepends=('qldv-git')
conflicts=('lldb' 'swift-language-git')
options=('!strip')
validpgpkeys=('5E4DF843FB065D7F7E24FBA2EF5430F071E1B235')
provides=('swift-language' 'lldb')
replaces=('swift-language-bin')
source=(
"https://swift.org/builds/swift-${_version}-release/ubuntu1604/swift-${_version}-RELEASE/swift-${_version}-RELEASE-ubuntu16.04.tar.gz"
"https://swift.org/builds/swift-${_version}-release/ubuntu1604/swift-${_version}-RELEASE/swift-${_version}-RELEASE-ubuntu16.04.tar.gz.sig"
)
sha256sums=('9adf64cabc7c02ea2d08f150b449b05e46bd42d6e542bf742b3674f5c37f0dbf'
            'SKIP')

package() {
    tar -C "$pkgdir" -xf "swift-${_version}-RELEASE"*.tar.gz --strip 1
    mkdir -p "${pkgdir}/usr/lib/swift/arch"

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/usr/local"

    # Yuck! patching libedit and libcurl SONAMEs
    find "${pkgdir}/usr/bin" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;
    find "${pkgdir}/usr/lib" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;
    sed -i 's/libcurl\.so\.4/libcurl\.so\.3/g' "${pkgdir}/usr/lib/swift/linux/libFoundation.so"

    # Patch the ld interpreter to avoid version warnings
    qldv "`qldv -find`" "${pkgdir}/usr/lib/swift/arch/ld.so"
    find "${pkgdir}/usr/bin" -type f -exec patchelf --set-interpreter '/usr/lib/swift/arch/ld.so' {} \;

    # Hack to ensure Swift runs patchelf on output files to fix the libcurl version warnings
    ln -sf "../../../bin/swift" "${pkgdir}/usr/lib/swift/arch/swiftc"
    rm "${pkgdir}/usr/bin/swiftc"
    echo '#!/bin/bash' > "${pkgdir}/usr/bin/swiftc"
    # bwrap is used to alias the original Clang as cc, then replace Clang with a wrapper script.
    echo 'bwrap --dev-bind / / --bind /usr/bin/clang /usr/bin/cc --bind /usr/lib/swift/arch/clang++ /usr/bin/clang++ /usr/lib/swift/arch/swiftc "$@"' >> "${pkgdir}/usr/bin/swiftc"

    echo '#!/bin/bash' > "${pkgdir}/usr/lib/swift/arch/clang++"
    echo '( exec -a clang++ cc "$@" ) && patchelf --set-interpreter /usr/lib/swift/arch/ld.so "${@: -1}"' >> "${pkgdir}/usr/lib/swift/arch/clang++"

    chmod +x "${pkgdir}/usr/bin/swiftc" "${pkgdir}/usr/lib/swift/arch/clang++"

    # Patch the module files
    sed -i 's|x86_64-linux-gnu/||' "${pkgdir}/usr/lib/swift/linux/x86_64/glibc.modulemap"
    sed -i 's|x86_64-linux-gnu/||' "${pkgdir}/usr/lib/swift_static/linux/static-stdlib-args.lnk"

    # Remove the six.py dumped in python's site packages
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
