# Maintainer: Alan Orth <aorth@mjanja.ch>
pkgdesc="Clear Linux kernel and modules in binary"
url="https://clearlinux.org/node/15538"
pkgname=linux-clear-bin
# check org.clearlinux.native.X.Y.Z in Manifest
pkgver="5.3.8"
pkgrel="854"
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
provides=("linux=${pkgver}" "linux-clear=${pkgver}" "WIREGUARD-MODULE")
conflicts=("linux-clear")
options=('!strip')

# see: https://cdn.download.clearlinux.org/current/latest
_clear_version=31450
_kernel_version="${pkgver}-${pkgrel}.native"

source=("https://cdn.download.clearlinux.org/update/${_clear_version}/Manifest.kernel-native"
        "https://cdn.download.clearlinux.org/update/${_clear_version}/pack-kernel-native-from-0.tar"
        "60-linux.hook" # pacman hook for depmod
        "90-linux.hook" # pacman hook for initramfs regeneration
        "99-linux.hook" # pacman hook for remove initramfs
        "linux.preset"  # standard config files for mkinitcpio ramdisk)
)
sha256sums=('3998865a441e4237f6efd713915dff904ad5cc8550dba3e21aa10e6620c038a9'
            '11224695c4428c5559dbfe4d0ee9bfe26e4043678fbb3ef94e9d6e90d886c9d6'
            '60b965278d9b0af897b6a54c847a4ea5adfe6116c19191b2b814c6f8bf92521e'
            '5a1b61d41b4d194d0ff6e1e13f650ee982db403b008cacdc5564e7bd265a81fc'
            'a61b3fdc2ef2f1405b3ffe166e9c6d1666289ab427f2348259f04b5e878376a2'
            '210e075d642b212df990a2a669e88b81547e6c4e0ed37ef289c0e2987f713c92')
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

    local subst="
      s|%PKGNAME%|$pkgname|g
      s|%KERNEL_VERSION%|$_kernel_version|g
      s|%EXTRAMODULES%|$extramodules|g
    "

    mkdir -p $pkgdir/usr/lib
    mkdir -p $extradir
    echo $_kernel_version > $extradir/version
    chmod 644 $extradir/version

    msg2 "Installing boot image..."
    # systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 vmlinuz-${pkgname} "$modulesdir/vmlinuz"
    install -Dm644 "$modulesdir/vmlinuz" "$pkgdir/boot/vmlinuz-$pkgbase"
    install -Dm644 vmlinuz-${pkgname}.cmdline $pkgdir/boot

    msg2 "Installing modules..."
    cp -r modules $pkgdir/usr/lib

    msg2 "Installing hooks..."
    sed "$subst" linux.preset | install -Dm644 /dev/stdin \
        "$pkgdir/etc/mkinitcpio.d/${pkgname}.preset"
    sed "$subst" 60-linux.hook | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/libalpm/hooks/60-${pkgname}.hook"
    sed "$subst" 90-linux.hook | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/libalpm/hooks/90-${pkgname}.hook"
    sed "$subst" 99-linux.hook | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/libalpm/hooks/99-${pkgname}.hook"

    msg2 "Fixing permissions..."
    chmod -Rc u=rwX,go=rX "$pkgdir"
}
