# Maintainer: Alan Orth <aorth@mjanja.ch>
pkgdesc="Clear Linux kernel and modules in binary"
url="https://clearlinux.org/node/15538"
pkgname=linux-clear-bin
# check org.clearlinux.native.X.Y.Z in Manifest
_major=5.5
_minor=10
_clr=921
pkgver=${_major}.${_minor}.${_clr}
pkgrel=1
# use in case we need to update the Arch package without incrementing pkgrel
epoch=0
arch=('x86_64')
license=('GPL2')
depends=('coreutils' 'linux-firmware' 'kmod')
optdepends=(
    'mkinitcpio>=0.7: to create custom init cpio'
    'intel-ucode-clear: intel cpu and i915 firmware'
    'linux-clear-headers-bin: header files for the kernel'
    'crda: to set the correct wireless channels of your country'
)
provides=("WIREGUARD-MODULE")
options=('!strip')

# see: https://cdn.download.clearlinux.org/current/latest
_clear_version=32650
_kernel_version="${_major}.${_minor}-${_clr}.native"

source=("https://cdn.download.clearlinux.org/update/${_clear_version}/Manifest.kernel-native"
        "https://cdn.download.clearlinux.org/update/${_clear_version}/pack-kernel-native-from-0.tar"
)
b2sums=('6d891828fbb85408e3e595a91a08933522c497369d344c1665b823ef482403fd617c7c7ea2592901ff12b640dc5d58c248797cdfbd322097aa999eac020e5914'
        'f1eefe9b9f88715d337b1359f5441f6761b43fee66b61b841a80fb7253ea74f6941d252f516f0463dc078d31104d17495ff91f7a55ed11903dbc45157818d683')
build() {
    # get kernel's filename (hash) from the Manifest, ie:
    # 4776962fb058c91e89dcefac4740d7a1af37ea12d217d3f8d0f49797553146e7
    local kernel=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/kernel\/org.clearlinux.native.*$/\1/p" Manifest.kernel-native)
    local cmdline=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/kernel\/cmdline.*$/\1/p" Manifest.kernel-native)
    local modules=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/(modules.*)$/\1 \2/p" Manifest.kernel-native)

    cp staged/$kernel vmlinuz-${pkgname}
    cp staged/$cmdline vmlinuz-${pkgname}.cmdline
    echo 'module.sig_unenforce' >> vmlinuz-${pkgname}.cmdline
    is_path=0
    filename=''
    for line in $modules; do
        if [ $is_path = 0 ]; then
            filename=$line
        else
            mkdir -p $line
            rmdir $line
            cp staged/$filename $line
        fi
        is_path=$(($is_path ^ 1))
    done
}
package() {
    local kernelname=${pkgname#linux}
    local extramodules="extramodules$kernelname"
    local modulesdir="$pkgdir/usr/lib/modules/$_kernel_version"
    local extradir="$pkgdir/usr/lib/modules/$extramodules"

    mkdir -p $pkgdir/usr/lib
    mkdir -p $extradir
    echo $_kernel_version > $extradir/version
    chmod 644 $extradir/version

    msg2 "Installing boot image..."
    # systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 vmlinuz-${pkgname} "$modulesdir/vmlinuz"
    install -Dm644 vmlinuz-${pkgname}.cmdline $pkgdir/boot/vmlinuz-${pkgname}.cmdline

    # Used by mkinitcpio to name the kernel
    echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

    msg2 "Installing modules..."
    cp -r modules $pkgdir/usr/lib

    msg2 "Fixing permissions..."
    chmod -Rc u=rwX,go=rX "$pkgdir"
}
