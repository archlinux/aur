# versionurl=https://cdn.download.clearlinux.org/current/latest
contenturl=https://cdn.download.clearlinux.org/update
manifest_file=Manifest.kernel-native
package_file=pack-kernel-native-from-0.tar

pkgname=linux-clear-bin
arch=('x86_64')

version=30770
kernel_version="5.2.8-821.native"

pkgver="5.2.8"
pkgrel="821"

source=('depmod.hook')
md5sums=('ef6f6d2359e9925e78ae643072603028')

prepare() {
    # version=$(curl $versionurl)
    # echo $version > version
    curl -O $contenturl/$version/$manifest_file
    # kernel_version=$(cat $manifest_file | sed -n -re "s/^F.b.[[:space:]]+[a-f0-9]+[[:space:]]+$version[[:space:]]+\/usr\/lib\/kernel\/cmdline-(.*)$/\1/p")
    # echo $kernel_version > kernel_version
}
# pkgver() {
#     cat kernel_version | tee /dev/stderr | sed -r "s/\-/\./g"
# }
build() {
    # varsion=$(cat version)
    kernel=$(cat $manifest_file | sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$version[[:space:]]+\/usr\/lib\/kernel\/org.clearlinux.native.*$/\1/p")
    cmdline=$(cat $manifest_file | sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$version[[:space:]]+\/usr\/lib\/kernel\/cmdline.*$/\1/p")
    modules=$(cat $manifest_file | sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$version[[:space:]]+\/usr\/lib\/(modules.*)$/\1 \2/p")

    mkdir -p unpacked
    curl -O $contenturl/$version/$package_file
    tar -xf $package_file -C unpacked

    cp unpacked/staged/$kernel vmlinuz-linux-clear
    cp unpacked/staged/$cmdline vmlinuz-linux-clear.cmdline
    echo 'module.sig_unenforce' >> vmlinuz-linux-clear.cmdline
    is_path=0
    filename=''
    for line in $modules; do
        if [ $is_path = 0 ]; then
            filename=$line
        else
            mkdir -p $line
            rmdir $line
            cp unpacked/staged/$filename $line
        fi
        is_path=$(($is_path ^ 1))
    done

    rm $package_file
    rm -rf unpacked
}
package() {
    pkgdesc="clear linux kernel and modules in binary"
    depends=('coreutils' 'linux-firmware' 'kmod')
    optdepends=(
        'mkinitcpio>=0.7: to create custom init cpio'
        'intel-ucode-clear: intel cpu and i915 firmware'
        'linux-clear-headers-bin: header files for the kernel'
        'crda: to set the correct wireless channels of your country'
    )
    provides=("linux=${pkgver}" "linux-clear=${pkgver}")
    conflicts=("linux-clear")

    _kernelname=${pkgname#linux}
    extramodules="extramodules$_kernelname"
    modulesdir="$pkgdir/usr/lib/modules/$kernel_version"
    extradir="$pkgdir/usr/lib/modules/$extramodules"

    subst="
      s|%PKGNAME%|$pkgname|g
      s|%KERNEL_VERSION%|$kernel_version|g
      s|%EXTRAMODULES%|$extramodules|g
    "

    mkdir -p $pkgdir/usr/lib
    mkdir -p $pkgdir/boot
    mkdir -p $extradir
    echo $kernel_version > $extradir/version
    chmod 644 $extradir/version
    cp vmlinuz-linux-clear $pkgdir/boot
    cp vmlinuz-linux-clear.cmdline $pkgdir/boot
    cp -r modules $pkgdir/usr/lib

    sed "$subst" ../depmod.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/${pkgname}-depmod.hook"

    chmod -Rc u=rwX,go=rX "$pkgdir"
}
