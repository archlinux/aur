# Maintainer: Frank Mertens <frank at cyblogic dot de>

pkgbase=corecomponents
pkgname=(
    'corecomponents_core'
    'corecomponents_core_tools'
    'corecomponents_syntax'
    'corecomponents_glob'
    'corecomponents_meta'
    'corecomponents_testing'
    'corecomponents_crypto'
    'corecomponents_crypto_tools'
    'corecomponents_network'
    'corecomponents_network_tools'
    'corecomponents_http'
    'corecomponents_http_plugins'
    'corecomponents_http_tools'
    'corecomponents_toki'
    'corecomponents_toki_tools'
    'corecomponents_ux'
    'corecomponents_ux_plugins'
    'corecomponents_tools'
)
pkgver=2.2.3
pkgrel=1
pkgdesc="Toolkit for C++ application development"
url="https://www.corecomponents.io"
arch=('x86_64')
license=('GPL3')
source=(
    "$pkgbase-$pkgver.tar.gz::https://www.corecomponents.io/download/CoreComponents-$pkgver.tar.gz"
)
md5sums=(
    '60c8e2d342fdb6ae199016357489e15a'
)
sha1sums=(
    'dbc6972d7750d021e90c80d9a8c93ea88e2ddb29'
)

makedepends=(
    'gcc>=10.0.0'
    'readline'
    'gnutls>=3.3.5'
    'cairo'
    'freetype2'
    'libwebp'
    'sdl2>=2.0.10'
)

prepare() {
    ln -sf CoreComponents-$pkgver CoreComponents
    if [ ! -x CoreComponents-$pkgver-bootstrap/ccbuild ]; then
        mkdir -p CoreComponents-$pkgver-bootstrap
        pushd CoreComponents-$pkgver-bootstrap
        ../CoreComponents-$pkgver/bootstrap
        popd
    fi
    if [ ! -x CoreComponents-$pkgver-build/ccbuild ]; then
        mkdir -p CoreComponents-$pkgver-build
        pushd CoreComponents-$pkgver-build
        ln -s ../CoreComponents-$pkgver-bootstrap/ccbuild
        popd
    fi
}

build() {
    cd CoreComponents-$pkgver-build
    ./ccbuild -prefix=/usr -release ../CoreComponents
}

check() {
    cd CoreComponents-$pkgver-build
    ./ccbuild -prefix=/usr -release -test-run ../CoreComponents
}

package_corecomponents_core() {
    pkgdesc="$pkgdesc: system abstraction and language primitives"
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Core/src
}

package_corecomponents_core_tools() {
    pkgdesc="$pkgdesc: misc. command line utilities"
    depends=('corecomponents_core')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Core/tools
}

package_corecomponents_syntax() {
    pkgdesc="$pkgdesc: building blocks for building recursive descent parsers"
    depends=('corecomponents_core')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Syntax/src
}

package_corecomponents_glob() {
    pkgdesc="$pkgdesc: string and file name pattern matching"
    depends=('corecomponents_syntax')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Glob/src
}

package_corecomponents_meta() {
    pkgdesc="$pkgdesc: object serialization, deserialization and validation"
    depends=('corecomponents_syntax')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Meta/src
}

package_corecomponents_testing() {
    pkgdesc="$pkgdesc: unit testing and test automation"
    depends=('corecomponents_testing')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Testing/src
}

package_corecomponents_crypto() {
    pkgdesc="$pkgdesc: cryptographic primitives"
    depends=('corecomponents_core')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Crypto/src
}

package_corecomponents_crypto_tools() {
    pkgdesc="$pkgdesc: cryptographic tools"
    depends=('corecomponents_crypto' 'readline')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Crypto/tools
}

package_corecomponents_network() {
    pkgdesc="$pkgdesc: network sockets, interface status and routing information"
    depends=('corecomponents_glob')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Network/src
}

package_corecomponents_network_tools() {
    pkgdesc="$pkgdesc: networking tools"
    depends=('corecomponents_network')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Network/tools
}

package_corecomponents_http() {
    pkgdesc="$pkgdesc: http(s) client/server classes"
    depends=('corecomponents_meta' 'corecomponents_glob' 'corecomponents_network' 'gnutls>=3.3.5')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/HTTP/src
}

package_corecomponents_http_plugins() {
    pkgdesc="$pkgdesc: http(s) server plugins"
    depends=('corecomponents_http')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/HTTP/plugins
}

package_corecomponents_http_tools() {
    pkgdesc="$pkgdesc: http(s) tools"
    depends=('corecomponents_http_plugins')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/HTTP/tools
}

package_corecomponents_toki() {
    pkgdesc="$pkgdesc: syntax highlighting library"
    depends=('corecomponents_meta' 'corecomponents_glob')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Toki/src
}

package_corecomponents_toki_tools() {
    pkgdesc="$pkgdesc: syntax highlighting tools"
    depends=('corecomponents_toki')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/Toki/tools
}

package_corecomponents_ux() {
    pkgdesc="$pkgdesc: graphical user interfaces"
    depends=('corecomponents_core' 'corecomponents_ux_plugins' 'cairo' 'freetype2' 'libwebp')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/UX/src
}

package_corecomponents_ux_plugins() {
    pkgdesc="$pkgdesc: graphical user interface style and platform plugins"
    depends=('sdl2>=2.0.10')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/UX/plugins
}

package_corecomponents_tools() {
    pkgdesc="$pkgdesc: common developer tools (build system, etc.)"
    depends=('corecomponents_tools')
    cd CoreComponents-$pkgver-build
    ./ccbuild -root="$pkgdir" -install -release ../CoreComponents/tools
}
