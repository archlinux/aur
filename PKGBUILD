# Maintainer: Vladimir Stoiakin <VStoiakin at lavabit dot com>

pkgbase=linux-librem5
pkgname=(
    "$pkgbase"
    "$pkgbase-docs"
)
pkgver=6.6.83
pkgrel=1
pkgdesc='The Linux kernel for Purism Librem 5'
url='https://source.puri.sm/Librem5/linux'
arch=('aarch64')
license=(GPL-2.0-only)
makedepends=(
    bc
    cpio
    gettext
    libelf
    pahole
    perl
    python
    tar
    xz

    # htmldocs
    graphviz
    imagemagick
    python-sphinx
    python-yaml
    texlive-latexextra
)
options=(
    !debug
    !strip
)

_purismver=6.6.83pureos1
source=(
    https://source.puri.sm/Librem5/linux/-/archive/pureos/$_purismver/linux-pureos-$_purismver.tar.gz
    config
)
sha256sums=(
    '89a64b009f0b615966821639543b4d22d7814c11dd7a309ce0b43c60f18becff'
    'SKIP'
)
b2sums=(
    '0d0a1c31ea942529b58f17ff9be7bed064297076ed8b5eea145e9b6558e1f1f37295e7aceb495d8ad57b7f42b419278516759e0e155036bbe97a1caf276b0e1f'
    'SKIP'
)

export ARCH=arm64
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
if [[ $(uname -m) != 'aarch64' ]]; then
    makedepends+=( aarch64-linux-gnu-gcc )
    export CARCH=aarch64
    export CROSS_COMPILE=aarch64-linux-gnu-
fi
export KCFLAGS="-mtune=cortex-a53"

prepare() {
    cd linux-pureos-$_purismver

    echo "Setting version..."
    echo "-$pkgrel" > localversion.10-pkgrel

    echo "Setting config..."
    diff -u ../config arch/arm64/configs/librem5_defconfig || :
    cp ../config arch/arm64/configs/librem5_defconfig
    make librem5_defconfig

    make -s kernelrelease > version
    echo "Prepared $pkgbase version $(<version)"
}

build() {
    cd linux-pureos-$_purismver
    make all
    make htmldocs
}

package_linux-librem5() {
    depends=(
        coreutils
        initramfs
        kmod
    )
    optdepends=(
        'wireless-regdb: to set the correct wireless channels of your country'
        'linux-firmware: firmware images needed for some devices'
    )

    cd linux-pureos-$_purismver
    local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

    echo "Installing boot image..."
    # systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

    # Used by mkinitcpio to name the kernel
    echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

    echo "Installing modules..."
    ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
      DEPMOD=/doesnt/exist modules_install  # Suppress depmod

    echo "Installing DTBs..."
    install -Dm644 -t "$pkgdir/boot" "arch/arm64/boot/dts/freescale/imx8mq-librem5-r"*".dtb"

    # remove build link
    rm "$modulesdir"/build
}

package_linux-librem5-docs() {
    pkgdesc="$pkgdesc (documentation)"

    cd linux-pureos-$_purismver
    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    echo "Installing documentation..."
    local src dst
    while read -rd '' src; do
        dst="${src#Documentation/}"
        dst="$builddir/Documentation/${dst#output/}"
        install -Dm644 "$src" "$dst"
    done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

    echo "Adding symlink..."
    mkdir -p "$pkgdir/usr/share/doc"
    ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}
