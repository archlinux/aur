# Maintainer: Alan Orth <aorth@mjanja.ch>
pkgdesc="Header files and scripts for Clear Linux kernel and modules"
url="https://github.com/clearlinux-pkgs/linux"
pkgname=linux-clear-headers-bin
# check org.clearlinux.native.X.Y.Z in Manifest
_major=6.2
_minor=0
_clr=1275
pkgver=${_major}.${_minor}.${_clr}
pkgrel=1
# use in case we need to update the Arch package without incrementing pkgrel
epoch=0
arch=('x86_64')
license=('GPL2')
conflicts=("linux-clear-headers")
options=('!strip')

# see: https://cdn.download.clearlinux.org/current/latest
_clear_version=38330
_kernel_version="${_major}.${_minor}-${_clr}.native"
# hash of kernel config from Manifest.linux-dev, ie /usr/lib/kernel/config-5.3.1-843.native
# there's no way to do this automatically in the PKGBUILD
_config_hash=1aca0f13574a71973a6fc529692b9f3f1a3ebb23bc5376a91bdb14c11e0e475c
_config_hash_clear_version=38330

source=("Manifest.linux-dev.${_clear_version}::https://cdn.download.clearlinux.org/update/${_clear_version}/Manifest.linux-dev"
        "pack-linux-dev-from-0.${_clear_version}.tar::https://cdn.download.clearlinux.org/update/${_clear_version}/pack-linux-dev-from-0.tar"
        "https://cdn.download.clearlinux.org/update/${_config_hash_clear_version}/files/${_config_hash}.tar"
)
build() {
    local files=$(sed -n -re "s/^[FL]...[[:space:]]+([a-f0-9]+)[[:space:]]+[[:digit:]]+[[:space:]]+\/usr\/lib\/(modules.*build.*)$/\1 \2/p" Manifest.linux-dev.${_clear_version})
    local config=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+[[:digit:]]+[[:space:]]+\/usr\/lib\/kernel\/config.*$/\1/p" Manifest.linux-dev.${_clear_version})
    local map=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+[[:digit:]]+[[:space:]]+\/usr\/lib\/kernel\/System.map.*$/\1/p" Manifest.linux-dev.${_clear_version})

    is_path=0
    filename=''
    for line in $files; do
        if [ $is_path = 0 ]; then
            filename=$line
        else
            mkdir -p $line
            rmdir $line
            cp -P staged/$filename $line
        fi
        is_path=$(($is_path ^ 1))
    done

    mv $config modules/$_kernel_version/build/.config

    mv staged/${map} modules/$_kernel_version/build/System.map
}
package() {
    mkdir -p $pkgdir/usr/lib
    cp -Pr modules $pkgdir/usr/lib
}
b2sums=('921d6a140325413ab3e8a36a1eb21d5ab65980aca4dd1f02e8316146302092cdc4820c572c9604e3b7354482d65b4ffe97aa1cfb7f4f767851316826e42af7fc'
        '2a1faff0a503da23b5583ad5ee7469daf1cd3e46c6a2f52160898a986f1378128e8f883779bbd132c3e94bc5c4424b80f708c43c723f18c091a61fcca96d55c1'
        '036946744f48eeb6d1f031a0b468fea3cf1bfb7a80765259d737a0e5e8de53907edaa5f4fdbb8615e5680e78f932974cecb71c8691a9e63fa3725c2f4805dd8e')
