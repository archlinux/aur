# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor:  koonix <me at koonix dot org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: zer0def
# Contributor: navigaid <navigaid@gmail.com>

# shellcheck disable=SC2034,SC2154,SC2164

_name=naiveproxy
pkgname=${_name}-bin

pkgver=138.0.7204.35_1
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

sha256sums_aarch64=('e65f5bf76c976023d67c028e0b8b72ab6897208b7925f9392be4c5783e04ee37'
                    '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                    '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                    '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
sha256sums_i686=('5e45d7699db53c9a01fdf5a6f5ec1d2e3b3c258ca9596c66457486a07bd807c9'
                 '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                 '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                 '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
sha256sums_mips64el=('32ac2a1aa74de7a7a0ce5460434e5a8a4e1eef56c9516b9ed6b3cb32aab5bb19'
                     '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                     '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                     '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
sha256sums_mipsel=('570fcef35507a95228962074794f8cb8674b0d368d6f5c4229f2e11707fd2e20'
                   '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                   '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                   '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
sha256sums_x86_64=('493a61ea9f65317efa2760bbcd3feb5aecabc543fe71a3f7d6ca59a620c8ed52'
                   '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                   '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                   '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
sha256sums_armv7h=('161fa624867e90f04b8e77e986d97617b86c06ec8f21477018f8f1bce16e6a7b'
                   '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                   '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                   '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
