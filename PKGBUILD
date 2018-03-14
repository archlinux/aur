# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

_version=4.0.3
pkgname=swift-bin
pkgver=${_version//-/.}
pkgrel=5
pkgdesc="Official binary builds of the Swift programming language."
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('icu55' 'ncurses5-compat-libs' 'libedit' 'python2' 'libutil-linux' 'libbsd' 'clang' 'python2-six' 'libxml2' 'libcurl-compat' 'patchelf')
makedepends=('qldv')
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
    target="${pkgdir}/usr/lib/swift"
    mkdir -p "${target}"

    # Copy extracted files
    cp -Ppr "${srcdir}/swift-${_version}-RELEASE"*/usr/* "$target"
    rm -rf "${target}/local"

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Symlink binaries
    mkdir -p "${pkgdir}/usr/bin"
    for file in "${target}/bin/"*; do
        ln -s ../lib/swift/bin/"`basename "$file"`" "${pkgdir}/usr/bin"
    done

    # Yuck! patching libedit and libcurl SONAMEs
    find "${target}/bin" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;
    find "${target}/lib" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;
    sed -i 's/libcurl\.so\.4/libcurl\.so\.3/g' "${target}/lib/swift/linux/libFoundation.so"

    # Patch the ld interpreter to avoid version warnings
    qldv "`qldv -find`" "${target}/lib/ld.so"
    find "${target}/bin" -type f -exec patchelf --set-interpreter '/usr/lib/swift/lib/ld.so' {} \;

    # Hack to override Clang and ensure Swift runs patchelf on output files to fix the libcurl version warnings
    echo '#!/bin/bash' > "${target}/bin/clang++"
    echo '/usr/bin/clang++ "$@" && patchelf --set-interpreter /usr/lib/swift/lib/ld.so "${@: -1}"' >> "${target}/bin/clang++"

    # Patch the module files
    sed -i 's|x86_64-linux-gnu/||' "${target}/lib/swift/linux/x86_64/glibc.modulemap"
    sed -i 's|x86_64-linux-gnu/||' "${target}/lib/swift_static/linux/static-stdlib-args.lnk"

    # Remove the six.py dumped in python's site packages
    rm "${target}/lib/python2.7/site-packages/six.py"
    rm "${target}/lib/python2.7/site-packages/six.pyc"

    # Ensure the items have the right permissions..
    # some tarballs from upstream seem to have the wrong ones
    find "${target}/bin" -type f -exec chmod a+rx {} \;
    find "${target}/lib" -type f -exec chmod a+r {} \;

    # Move license
    install -dm755 ${target}/share/licenses/${pkgname}
    mv ${target}/share/swift/LICENSE.txt ${target}/share/licenses/${pkgname}
}
