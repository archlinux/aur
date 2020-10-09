# Maintainer: Alan Orth <aorth@mjanja.ch>
pkgdesc="Clear Linux kernel and modules in binary"
url="https://github.com/clearlinux-pkgs/linux"
pkgname=linux-clear-bin
# check org.clearlinux.native.X.Y.Z in Manifest
_major=5.8
_minor=14
_clr=991
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
_clear_version=33820
_kernel_version="${_major}.${_minor}-${_clr}.native"

source=("Manifest.kernel-native.${_clear_version}::https://cdn.download.clearlinux.org/update/${_clear_version}/Manifest.kernel-native"
        "pack-kernel-native-from-0.${_clear_version}.tar::https://cdn.download.clearlinux.org/update/${_clear_version}/pack-kernel-native-from-0.tar"
)
build() {
    # get kernel's filename (hash) from the Manifest, ie:
    # 4776962fb058c91e89dcefac4740d7a1af37ea12d217d3f8d0f49797553146e7
    local kernel=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+[[:digit:]]+[[:space:]]+\/usr\/lib\/kernel\/org.clearlinux.native.*$/\1/p" Manifest.kernel-native.${_clear_version})
    local cmdline=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+[[:digit:]]+[[:space:]]+\/usr\/lib\/kernel\/cmdline.*$/\1/p" Manifest.kernel-native.${_clear_version})
    local modules=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+[[:digit:]]+[[:space:]]+\/usr\/lib\/(modules.*)$/\1 \2/p" Manifest.kernel-native.${_clear_version})

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
b2sums=('ff785dba0efaee5806131c0b10392bb4d74dcfe9da1723282f1a2f222123a62a6bc294ff6f23a5fb9b0d4ccc3905612b7e475cf3ab1c530b9503bb32b2d77949'
        'a3155542babc43d730702b58b31f9c2fc20d39843e5d1ee82e9a04c21d582fc5195c7a66069bfb79dc477b768c37301be3c7ccca3ea2f93e62ac6b8509598543')
