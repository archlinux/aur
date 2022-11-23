# Maintainer: Alan Orth <aorth@mjanja.ch>
pkgdesc="Header files and scripts for Clear Linux kernel and modules"
url="https://github.com/clearlinux-pkgs/linux"
pkgname=linux-clear-headers-bin
# check org.clearlinux.native.X.Y.Z in Manifest
_major=6.0
_minor=9
_clr=1213
pkgver=${_major}.${_minor}.${_clr}
pkgrel=1
# use in case we need to update the Arch package without incrementing pkgrel
epoch=0
arch=('x86_64')
license=('GPL2')
conflicts=("linux-clear-headers")
options=('!strip')

# see: https://cdn.download.clearlinux.org/current/latest
_clear_version=37650
_kernel_version="${_major}.${_minor}-${_clr}.native"
# hash of kernel config from Manifest.linux-dev, ie /usr/lib/kernel/config-5.3.1-843.native
# there's no way to do this automatically in the PKGBUILD
_config_hash=96b6650ec3c5461461b0b394e236bb7ebd5ce9b99156764755ca7d5ffc60d3fa
_config_hash_clear_version=37650

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
b2sums=('f123cebba65f0cd57da17cfee39e68daa4536849540f92587324768466a3a464e315ce5a653ffce47349c809e305868d3c6ebdfd1f7cbef784951ed60f7b0d72'
        'ab4e4c915f4c97c54a16f5f29a55d5c6a8d4ca51f1b09f3c3ea79201bb05d763e025c23c3332f13df09cd8790924be7bed81287ed17fbfb8de29e4cf4c5d17c2'
        '62c4af85aec2368f09ed66af3e406c856a34124b550f89cab3a8b549ed57f82a8e5256b29c891acb2d0900f61e34a882b13c853b9201ef7d2d0bf4fa6b69a855')
