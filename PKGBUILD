# Maintainer: Alan Orth <aorth@mjanja.ch>
pkgdesc="Clear Linux kernel and modules in binary"
url="https://clearlinux.org/node/15538"
pkgname=linux-clear-bin
# check org.clearlinux.native.X.Y.Z in Manifest
_major=5.6
_minor=11
_clr=949
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
_clear_version=33070
_kernel_version="${_major}.${_minor}-${_clr}.native"

source=("Manifest.kernel-native.${_clear_version}::https://cdn.download.clearlinux.org/update/${_clear_version}/Manifest.kernel-native"
        "pack-kernel-native-from-0.${_clear_version}.tar::https://cdn.download.clearlinux.org/update/${_clear_version}/pack-kernel-native-from-0.tar"
)
b2sums=('44dda8765e2651c73cacd47bc144e3de9636a5a8264bfd2f9c62cfa9ae49608d6fbc9cd190a4590c777244022b197735c2ef9f5e96d583fe4f47a60d33738f12'
        'a2f8a246e6b9acf8993587f7f9436ba5adfb9876ad08c14c67baa46401bfecaf4e568fb2ad383e77f2173913e9d94d59037e787b86e5002f530039e333054578')
build() {
    # get kernel's filename (hash) from the Manifest, ie:
    # 4776962fb058c91e89dcefac4740d7a1af37ea12d217d3f8d0f49797553146e7
    local kernel=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/kernel\/org.clearlinux.native.*$/\1/p" Manifest.kernel-native.${_clear_version})
    local cmdline=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/kernel\/cmdline.*$/\1/p" Manifest.kernel-native.${_clear_version})
    local modules=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/(modules.*)$/\1 \2/p" Manifest.kernel-native.${_clear_version})

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
b2sums=('65e59b9507f6e222230e910cadc015e51c7b513bb34bebfdc339de5bdde5516a93ec3b3ca5d41ab0ac79cd5d506d775cd7b330beae3fd3f6d6cfca5af717bde1'
        '4450796a1089bfcf91c60f0add5f41a780fc3ca9cc3a24b4bbb496adfe77cf9ba24fb3171f821c416ad0e14e044dcbc32d98f17a1e465ebc800d939d51f4df7a')
b2sums=('4c6c1a71989869b361452bd2e7bd4491d651c55350a37320b27b1660d613c98c41fcb950222ac56626c152afd8aa81df6133debfc92cf2f67fcf143feb4f63c3'
        '6c29ce260a3e7b25ad55368efd979a84baa61d96bd96a9ceead95f278713a9cee8b66a3531f18c79a423c4c9b14b0dab303bf16420de41f2cafd25aeb71e0853')
b2sums=('5cd898d1d88560395f2039ad641bc6dfa628d349f05a87485b47a85f2340f3a204cf4c8f1d387efb2fa0b14277bb555a018107d09e5e0666246e37089754ca7d'
        'e214782a778025630cdabf7a41ae80cd01f0ecb082a8850914afecf746f47157548be3ee4e0b3f9673e29be1b7de1ca6ac120a05ca750da615ef79a7cac0e081')
