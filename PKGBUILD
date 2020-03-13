# Maintainer: Alan Orth <aorth@mjanja.ch>
pkgdesc="Header files and scripts for Clear Linux kernel and modules"
url="https://clearlinux.org/node/15538"
pkgname=linux-clear-headers-bin
# check org.clearlinux.native.X.Y.Z in Manifest
_major=5.5
_minor=9
_clr=918
pkgver=${_major}.${_minor}.${_clr}
pkgrel=1
# use in case we need to update the Arch package without incrementing pkgrel
epoch=0
arch=('x86_64')
license=('GPL2')
conflicts=("linux-clear-headers")
options=('!strip')

# see: https://cdn.download.clearlinux.org/current/latest
_clear_version=32600
_kernel_version="${_major}.${_minor}-${_clr}.native"
# hash of kernel config from Manifest.linux-dev, ie /usr/lib/kernel/config-5.3.1-843.native
# there's no way to do this automatically in the PKGBUILD
_config_hash=efc74b09b31dc69624f3115e41bdf1e5269e02998d6222ecd6bc8848d8dab180

source=("https://cdn.download.clearlinux.org/update/${_clear_version}/Manifest.linux-dev"
        "https://cdn.download.clearlinux.org/update/${_clear_version}/pack-linux-dev-from-0.tar"
        "https://cdn.download.clearlinux.org/update/${_clear_version}/files/${_config_hash}.tar")
b2sums=('fbd8069d1e01a5612c935439303ac3eae6d6603383228bfaf8c49edf9ce0e832a735d401893d4809026d149753474517244afbe5cb75179cd9de56dcb41d0c34'
        '893b332a5eae61c93dcc9ae9b1260ba63277c7c1255714164c889193701a5f0aa095d769e21986845e57b18fec2d5666a83b391fcd61086dae4b9b901999d690'
        'c825ec8f2160b71eecb1c2ccd77f2304c62ad9af30384b26473ac0cb4194a8f1fd70bc49c9fd24e2a732f48bab981aa6e4229cffbc0942a20b2bcf21aff69978')
build() {
    local files=$(sed -n -re "s/^[FL]...[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/(modules.*build.*)$/\1 \2/p" Manifest.linux-dev)
    local config=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/kernel\/config.*$/\1/p" Manifest.linux-dev)
    local map=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/kernel\/System.map.*$/\1/p" Manifest.linux-dev)

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
