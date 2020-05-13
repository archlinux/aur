# Maintainer: Alan Orth <aorth@mjanja.ch>
pkgdesc="Header files and scripts for Clear Linux kernel and modules"
url="https://clearlinux.org/node/15538"
pkgname=linux-clear-headers-bin
# check org.clearlinux.native.X.Y.Z in Manifest
_major=5.6
_minor=12
_clr=950
pkgver=${_major}.${_minor}.${_clr}
pkgrel=1
# use in case we need to update the Arch package without incrementing pkgrel
epoch=0
arch=('x86_64')
license=('GPL2')
conflicts=("linux-clear-headers")
options=('!strip')

# see: https://cdn.download.clearlinux.org/current/latest
_clear_version=33080
_kernel_version="${_major}.${_minor}-${_clr}.native"
# hash of kernel config from Manifest.linux-dev, ie /usr/lib/kernel/config-5.3.1-843.native
# there's no way to do this automatically in the PKGBUILD
_config_hash=583753ef036a61eb1236d1126d6a642a0312df6e3c1a84cc378d57987d2603bb

source=("Manifest.linux-dev.${_clear_version}::https://cdn.download.clearlinux.org/update/${_clear_version}/Manifest.linux-dev"
        "pack-linux-dev-from-0.${_clear_version}.tar::https://cdn.download.clearlinux.org/update/${_clear_version}/pack-linux-dev-from-0.tar"
        "https://cdn.download.clearlinux.org/update/${_clear_version}/files/${_config_hash}.tar"
)
b2sums=('a8c3b21b22628066c9ad063687897529e269482b0261d68e3d47b60176020336ee5b1205ad52c8fd4730cb62b7064cf18a58e1827c1c7c5f7cedc284ffa86726'
        '118ad0841583ccf3851ba8416bf06d6b5cdba4caf54a52601ca437c5f2802b03181d18fc24da86b9b791e109145159e87431cfc262090c3bf831206855f661a0'
        'd41e32abc7299b1f9b683098271215290c257ced53feedb77909c5377832c5fe60d85863ca16981abda61a60e296dec6766172cc10a11fedcd8dfe5a900c7d37')
build() {
    local files=$(sed -n -re "s/^[FL]...[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/(modules.*build.*)$/\1 \2/p" Manifest.linux-dev.${_clear_version})
    local config=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/kernel\/config.*$/\1/p" Manifest.linux-dev.${_clear_version})
    local map=$(sed -n -re "s/^F.b.[[:space:]]+([a-f0-9]+)[[:space:]]+$_clear_version[[:space:]]+\/usr\/lib\/kernel\/System.map.*$/\1/p" Manifest.linux-dev.${_clear_version})

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
b2sums=('81c21018845b0b147629e604783834397cebe03951c908ef0cdd9848ab85497e2af44af9c8af7d0f671ae7a989c39a1f69beecec990d2aa35f58dccccede4965'
        'fa31dfcbc066c845344002b65d09a4ede7c138bdd9efc5d56d634ba3a123e8a95d966bf190f3f9e354dc9f1127048b1a59df0729f56020be42e828a145f6a86c'
        '75993e378b6f46f7b8797e53053af0c94adf0ae9ae6556d4f6daec3a2fd76334eba0c42d3351d85d5a5c2b3e5c91223d5c8a951450f74903ba2dc59a8e81a53d')
b2sums=('497fe4f94955988cfcd566ff2b00770370120aa42e387d08eb15cbe86e4446e386c7bbd2f9e29957730db63669d066638b2742ecb48f1a34d6f9b77298cdc823'
        '015ecb28a8e8c835143c3e8ee69c1e1d3c73c63782e4047ec2cb0328b07b7a069b341c97c155a80a04352f730d7efda523aca9fb7ced0241ec7c90a120ab5e15'
        '02ca1844d54c6738cc7b3df88a5ff9f111f9bdebe63d64adcf8c6c395f1bd4d96c4436543c676c910fe9621c1ae5915a412e97c45b3d3add98b996526087c858')
b2sums=('8e16415c713d7435152abb98b340b97d0e56cf4c0fb4404f9e606187f3bdf5fc095f55aa8d4d3f712c2dfa3665fadf8166a23b7b61797c255fccfe978b1853d8'
        '6ce438e1d5d8eec9ab5fe514546338667eb0e2abc9af4d671b24c9c1eda5d0a02d9e6891d97bf8f4409751ec5bff9a0eb46710ac96dfd127a223b3a93aecedc0'
        '64ae29079aaa14543a1ffc9fdc214e034da6194715a31e910a0ad20faebd517cd8f3c9cb0f37326e5ed841a59ea036bd43ecdcf78a1a7b22dcaf3368664d7624')
b2sums=('897982c2f76a4f2a6b9a51428d534b74d1419310cd85dbd2ffcb95eeabf8c301aa3b22bda9a425fedcc6514f6e86e956e9aa46e7680c81875c122ea431f575ec'
        '550d97b13b2b600206b53798a172d532637b401cc7a20b2c58263132838a863aa00cd20c487df9b35adbadc2c0e7f1546285c8a761c26060b16c68e684997e0a'
        '9758bec1321608934e921c96f2b7c47509e0822951e2e188bda5ffbb5aed6b0b62ded0825d7c5330fedf7200afdb7ac355e82fa72ef3202404e217da8f645703')
