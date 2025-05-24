# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor:  koonix <me at koonix dot org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: zer0def
# Contributor: navigaid <navigaid@gmail.com>

# shellcheck disable=SC2034,SC2154,SC2164

_name=naiveproxy
pkgname=${_name}-bin

pkgver=136.0.7103.44_2
pkgrel=1
_pkgver=${pkgver//_/-}

pkgdesc="A Proxy using Chrome's network stack to camouflage traffic with strong censorship resistence and low detectablility."
url='https://github.com/klzgrad/naiveproxy'
license=('BSD-3-Clause')

provides=("${_name}")
conflicts=("${_name}")
depends=('gcc-libs' 'glibc')
options=('!strip' '!debug') # don't modify prebuilt binaries

# source array template
# @ARCH@ and @SRCARCH@ will be substituted per the _archmap array below
_source=(
    "${_name}-${_pkgver}-@ARCH@.tar.xz::${url}/releases/download/v${_pkgver}/naiveproxy-v${_pkgver}-linux-@SRCARCH@.tar.xz"
    "naiveproxy.service"
    "naiveproxy@.service"
    "naiveproxy-sysusers.conf"
)

# architectures and their counterparts used in the source URL
declare -Ag _archmap=(
#   [ARCH]=SRCARCH
    ['x86_64']='x64'
    ['i686']='x86'
    ['aarch64']='arm64'
    ['armv7h']='arm'
    ['mips64el']='mips64el'
    ['mipsel']='mipsel'
)

backup=('etc/naiveproxy/config.json')

package() {
    cd "${srcdir}"
    install -Dm644 naiveproxy.service "${pkgdir}/usr/lib/systemd/system/naiveproxy.service"
    install -Dm644 naiveproxy@.service "${pkgdir}/usr/lib/systemd/system/naiveproxy@.service"
    install -Dm644 naiveproxy-sysusers.conf "${pkgdir}/usr/lib/sysusers.d/naiveproxy.conf"

    cd "naiveproxy-v${_pkgver}-linux-${_archmap[$CARCH]}"
    install -Dm644 config.json "${pkgdir}/etc/naiveproxy/config.json"
    install -Dm755 naive "${pkgdir}/usr/bin/naiveproxy"
    install -Dm644 USAGE.txt "${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/naiveproxy/LICENSE"

}

# boilerplate for generating the "arch=()" and "source_<arch>=()" arrays
arch=("${!_archmap[@]}")
for _a in "${!_archmap[@]}"; do
    _sa=${_archmap[$_a]}
    _s=("${_source[@]//@ARCH@/$_a}")
    _s=("${_s[@]//@SRCARCH@/$_sa}")
    declare -ag "source_${_a}="'("${_s[@]}")'
done

# wrapper function for envsubst
sha256sums_aarch64=('85769eef5b716aca5893b0e4693c149c76e486a11ed1f5c43d9d894b1397fa3d'
                    '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                    '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                    '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
sha256sums_i686=('a209927b65ea05c146fd361a90449dfe48fe5ebe11493b0dd066fc57e55242e8'
                 '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                 '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                 '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
sha256sums_mips64el=('b38e7ac4235c1f1e4129ed4a635ea8ee094aa9e1b1ea04ea3cf729cb82c1c2a1'
                     '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                     '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                     '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
sha256sums_mipsel=('6eb840902b01e5ac01d3c9311d66c9e23fdabaaee3bbb71e973f7b813fec8b6d'
                   '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                   '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                   '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
sha256sums_x86_64=('9cdc7e02b0c22c89d8a7f2cabaa082aabf8150f3da8c42ade303d2f5bc46fb5e'
                   '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                   '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                   '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
sha256sums_armv7h=('7801ae621d9f9e389193115eb33342f725b0c316369c7896baf9293f52cd0e15'
                   '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                   '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                   '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
