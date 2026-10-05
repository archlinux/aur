# Maintainer: EEEntity <eeentity at hotmail dot com>
# Contributor: Neboer <rubinposter at gmail dot com>
# Contributor: DuckSoft <realducksoft at gmail dot com>
# Contributor: ArielAxionL <i at axionl dot me>
# Contributor: Leroy.H.Y <me at lhy0403 dot top>
pkgname=qv2ray
pkgver=2.7.0
pkgrel=2
pkgdesc="Cross-platform V2ray Client written in Qt (Stable Release)"
arch=('x86_64')
url='https://github.com/Qv2ray/Qv2ray'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base>5.11.0' 'grpc>=1.27.0' 'qt5-svg')
optdepends=('v2ray: use system v2ray core.')
makedepends=('git' 'make' 'qt5-tools' 'which' 'gcc' 'qt5-declarative'
             'grpc-cli>=1.27.0' 'cmake' 'ninja')
provides=('qv2ray')
conflicts=('qv2ray')

source=('Qv2ray::git+https://github.com/Qv2ray/Qv2ray'
        'fix-modern-protobuf-abseil-log-conflict.patch')

sha512sums=('SKIP'
            '9f09156eed3d53fe62bd3c3c8ce244e837604657f6fec0b21442c53ababa0f4c5b7f975c37b8da1de5eb90a1e1d2ec47bb943f34295c10102944c4ed09a21e68')

pkgver() {
    printf "%s" $(cat ${srcdir}/Qv2ray/makespec/VERSION)
}

prepare() {
    cd "${srcdir}/Qv2ray"
    git submodule update --recursive --init
    patch -Np1 -i "${srcdir}/fix-modern-protobuf-abseil-log-conflict.patch"
}

build() {
    export _QV2RAY_BUILD_INFO_="Qv2ray from AUR"
    export _QV2RAY_BUILD_EXTRA_INFO_="(Manual Build) $(uname -a | cut -d " " -f3,13)"

    cd "${srcdir}/Qv2ray"
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -DQV2RAY_ZXING_PROVIDER="module" \
        -DQV2RAY_TRANSLATION_PATH="/usr/share/qv2ray/lang" \
        -DQV2RAY_DEFAULT_VASSETS_PATH="/usr/share/v2ray" \
        -DQV2RAY_DEFAULT_VCORE_PATH="/usr/bin/v2ray" \
        -DQV2RAY_DISABLE_AUTO_UPDATE=on \
        -DCMAKE_BUILD_TYPE=Release \
        -GNinja
    ninja
}

package() {
    cd "${srcdir}/Qv2ray"
    ninja -C "build" install
}
