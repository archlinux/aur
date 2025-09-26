# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor:  koonix <me at koonix dot org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: zer0def
# Contributor: navigaid <navigaid@gmail.com>

# shellcheck disable=SC2034,SC2154,SC2164

_name=naiveproxy
pkgname=${_name}-bin

pkgver=140.0.7339.123_2
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
    ['aarch64']='arm64'
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

sha256sums_aarch64=('1a7c21c647a8b34f3d52c08fb75a4e481bdfbe71f1290dc6237b6fc03f2d8cf8'
                    '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                    '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                    '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
sha256sums_x86_64=('c98d1cd4803a48a4508d08138014a12e3ab8d86991459b7da9561e9b9a261354'
                   '2f4cfc749771104a70b422d4ea6536a2acd38e1124ce37bc0fa46cb1e96e6cca'
                   '8502732d60224d9d46c6f16ad64b59d6c46dd44d283f3b3f52696ce38f3c144c'
                   '8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c')
