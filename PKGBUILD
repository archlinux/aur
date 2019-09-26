pkgdesc="Header files and scripts for clear linux ${pkgver} kernel and modules"
url="https://clearlinux.org/node/15538"
pkgname=linux-clear-headers-bin
# check org.clearlinux.native.X.Y.Z in Manifest
pkgver="5.3.1"
pkgrel="838"
# use in case we need to update the Arch package without incrementing pkgrel
epoch=0
arch=('x86_64')
license=('GPL2')
provides=("linux-headers=${pkgver}" "linux-clear-headers=${pkgver}")
conflicts=("linux-clear-headers")
options=('!strip')

# see: https://cdn.download.clearlinux.org/current/latest
_clear_version=31090
_kernel_version="${pkgver}-${pkgrel}.native"
# see: Manifest.linux-dev
_config_hash="f6efca16992c75907569a4707f0556222a23e8bc04bfe3711949dde3b41b55ad"

source=("https://cdn.download.clearlinux.org/update/${_clear_version}/Manifest.linux-dev"
        "https://cdn.download.clearlinux.org/update/${_clear_version}/pack-linux-dev-from-0.tar"
        "https://cdn.download.clearlinux.org/update/${_clear_version}/files/${_config_hash}.tar")
sha256sums=('9755f5c067ac6827d5d45d02a79b0c9b1bf866514fab40dbe79cad9debbdab18'
            '9c9181f28eb528e0231e14d9dee5b2681effdc53f713ab9100da4762c553f7ea'
            'b00d6f2abc046c7e2058a3a0c88c56969e3d628b09e5a32a6e9e9d6399ed7d2d')

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
