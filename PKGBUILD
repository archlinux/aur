# Maintainer: David Cohen <dacohen@pm.me>

pkgname=efistub-libre
pkgver=261.2
pkgrel=1
pkgdesc="Systemd's EFI stubs collections without systemd"
arch=('x86_64')
url="https://github.com/systemd/systemd"
license=('LGPL2.1')
makedepends=(
    'clang'
    'git'
    'gperf'
    'lld'
    'meson'
    'ninja'
    'python'
    'python-jinja'
    'python-pyelftools'
)
provides=('systemd-efi-stub')
conflicts=('systemd-efi-stub')

source=("git+https://github.com/systemd/systemd.git?shallow=1#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "systemd"

    meson setup build \
        -Defi=true \
        -Dstandalone-binaries=true \
        -Dnss-myhostname=false \
        -Dnss-mymachines=disabled \
        -Dnss-resolve=disabled \
        -Dnss-systemd=false \
        -Dman=disabled \
        -Dhtml=disabled \
        -Dtests=false \
        -Daudit=disabled \
        -Dblkid=disabled \
        -Dkmod=disabled \
        -Dlibcryptsetup=disabled \
        -Dlibcurl=disabled \
        -Dp11kit=disabled \
        -Dpam=disabled \
        -Dmicrohttpd=disabled \
        -Dselinux=disabled \
        -Dxkbcommon=disabled \
        -Dzstd=disabled

    ninja -C build src/boot/linuxx64.efi.stub src/boot/addonx64.elf.stub
}

package() {
    cd "systemd"

    # Install all available EFI stub architectures to /usr/lib/boot/efi/
    for stub in build/src/boot/linux*.efi.stub build/src/boot/addon*.elf.stub; do
        if [ -f "$stub" ]; then
            local stubname=$(basename "$stub")
            install -Dm755 "$stub" "${pkgdir}/usr/lib/boot/efi/${stubname}"
        fi
    done

    install="${pkgbase}.install"
}
