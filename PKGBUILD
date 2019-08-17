# versionurl=https://cdn.download.clearlinux.org/current/latest
contenturl=https://cdn.download.clearlinux.org/update
manifest_file=Manifest.linux-dev
kernel_manifest_file=Manifest.kernel-native
package_file=pack-linux-dev-from-0.tar

pkgname=linux-clear-headers-bin
arch=('x86_64')

version=30800
kernel_version="5.2.8-821.native"

pkgver="5.2.8"
pkgrel="821"

prepare() {
    # version=$(curl $versionurl)
    # echo $version > version
    curl -O $contenturl/$version/$manifest_file
    curl -O $contenturl/$version/$kernel_manifest_file
    # kernel_version=$(cat $kernel_manifest_file | sed -n -re "s/^F.b.[[:space:]]+[a-f0-9]+[[:space:]]+$version[[:space:]]+\/usr\/lib\/kernel\/cmdline-(.*)$/\1/p")
    # echo $kernel_version > kernel_version
}
# pkgver() {
#     cat kernel_version | sed -r "s/\-/\./g"
# }
build() {
    # varsion=$(cat version)
    # kernel_version=$(cat kernel_version)
    files=$(cat $manifest_file | sed -n -re "s/^[FL]...[[:space:]]+([a-f0-9]+)[[:space:]]+$version[[:space:]]+\/usr\/lib\/(modules.*build.*)$/\1 \2/p")
    config=$(cat $kernel_manifest_file | sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$version[[:space:]]+\/usr\/lib\/kernel\/config.*$/\1/p")
    map=$(cat $manifest_file | sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$version[[:space:]]+\/usr\/lib\/kernel\/System.map.*$/\1/p")

    mkdir unpacked
    curl -O $contenturl/$version/$package_file
    tar -xf $package_file -C unpacked

    is_path=0
    filename=''
    for line in $files; do
        if [ $is_path = 0 ]; then
            filename=$line
        else
            mkdir -p $line
            rmdir $line
            cp -P unpacked/staged/$filename $line
        fi
        is_path=$(($is_path ^ 1))
    done

    rm modules/$kernel_version/build/.config
    curl -O $contenturl/$version/files/$config.tar
    tar -xf $config.tar
    mv $config modules/$kernel_version/build/.config
    rm $config.tar

    rm modules/$kernel_version/build/System.map
    mv unpacked/staged/$map modules/$kernel_version/build/System.map

    rm $package_file
    rm -rf unpacked
}
package() {
    pkgdesc="Header files and scripts for clear linux ${pkgver} kernel and modules"
    provides=("linux-headers=${pkgver}" "linux-clear-headers=${pkgver}")
    conflicts=("linux-clear-headers")
    options=('!strip')
    mkdir -p $pkgdir/usr/lib
    cp -Pr modules $pkgdir/usr/lib
}
