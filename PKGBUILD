# Maintainer: taotieren <admin@taotieren.com>

pkgbase=magiskboot-git
pkgname=magiskboot-git
pkgver=30200.b4e94014167ca80b7c42de42c011848f0344dee8.r6.ga1fcfbe
pkgrel=1
pkgdesc="Magiskboot_ndk"
arch=($CARCH)
url="https://github.com/xiaoxindada/magiskboot_ndk_on_linux"
license=('GPL-3.0-or-later')
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
depends=()
makedepends=(
    cargo
    git
    python
    python-wget
    tar
)
optdepends=('android-tools: Android platform tools')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^Magiskboot-//g;s/^magisk_bins-//g;s/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git pull --recurse-submodules
}

build() {
    cd "${srcdir}/${pkgname}"

    python3 ./build.py --setup_ndk
    python3 ./build.py --build_binary

}

package() {
    cd "${srcdir}/${pkgname}/native"

    if [ ${CARCH} = "x86_64" ]; then
        install -Dm755 out/x86_64/magiskboot -t ${pkgdir}/usr/bin/
        install -Dm755 out/x86_64/magiskpolicy -t ${pkgdir}/usr/bin/
    elif [ ${CARCH} = "aarch64" ]; then
        install -Dm755 out/arm64-v8a/magiskboot -t ${pkgdir}/usr/bin/
        install -Dm755 out/arm64-v8a/magiskpolicy -t ${pkgdir}/usr/bin/
    elif [ ${CARCH} = "i686" ]; then
        install -Dm755 out/x86/magiskboot -t ${pkgdir}/usr/bin/
        install -Dm755 out/x86/magiskpolicy -t ${pkgdir}/usr/bin/
    elif [ ${CARCH} = "armv7h" ]; then
        install -Dm755 out/armeabi-v7a/magiskboot -t ${pkgdir}/usr/bin/
        install -Dm755 out/armeabi-v7a/magiskpolicy -t ${pkgdir}/usr/bin/
    elif [ ${CARCH} = "riscv64" ]; then
        install -Dm755 out/riscv64/magiskboot -t ${pkgdir}/usr/bin/
        install -Dm755 out/riscv64/magiskpolicy -t ${pkgdir}/usr/bin/
    fi

}
