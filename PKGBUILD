# Maintainer: Alan Orth <aorth@mjanja.ch>
pkgdesc="Clear Linux kernel and modules in binary"
url="https://clearlinux.org/node/15538"
pkgname=linux-clear-bin
# check org.clearlinux.native.X.Y.Z in Manifest
_major=5.7
_minor=4
_clr=964
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
_clear_version=33400
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
b2sums=('14e3b5f151b30488107f1edbbd40b954331d35dcf3afef341e2bcea73430de6323ff7b2edf35ac0cb59dc386ea0aec1ed9a4b446c5ebd89ccc69e20fc7550f4c'
        'c7bc36a4b02d94229698ca482b6504a0f071508fad3263ad5126b84cdb301af4d0fe6e44f96a388b80ee0bf3229ba9454c5a08d6c6b1a0ebd7b8e0469353a5b9')
b2sums=('801430002f22c60448c2c1d31a14bbd75eec489fb9e722aa3b4206a245f2cec6076317bd3ca3a1e082a6d22fe75a51e5c23e514de932433b12c0fbdb21c8b4ed'
        '33665163a6ee6e1c64942b39e24b80ed60b3bbb8f056ae073a6a56bcfbcc42c2d13a1754a856d24e079b1593e51aa8fb8b7a37de36267a5a454a10165cbf9962')
b2sums=('44a83e7b457d22b9ec97bbb62e6b27c4ea58e1f07d7ae95c438b8e40a2932d7dfb47c4b423bddfad2d598814edc1ba99e74884f9cb5c4b18c85f9483a7c1c436'
        '3b5a27f736e7b141ab2ad947644b11bf5357d196c184f2d2f0192e224d8aa768b63094131bc0d7b4d3d2c4aa1d2d8ab2cb4d4d9a0d6af37cdba31327b386b9fa')
b2sums=('ba817b9d3c5acdd69ed0ea9f5d6ea86cbd7c04020af57a6ce5624492538d1c5b4adb19c5e7ef692f84e3e2577f891601ed06cf91426d6b52bf86980a68c0508a'
        'aec095c51189941b815c144db2efc6bf4f2a3e1cbf7232c8c2e4c74924e7b793e787f8ef832ee346709a1bdd3132832958f8070a113488e96a158ea1a3862ccf')
b2sums=('94a2d27df509cd81ca1f0af97c1adb10b183f8f7bb8044123513f4a6c1c77a90727dfec288d23e567ab3eb85e23125d05f27285a8ae17114721143778d4f0996'
        'a8dcdc13e8e5915fed57e8fd5fc76862541dd7cb575324587da4b3df3b6c353b459cc3a7dba51884cfaed5c8f43c8233d77998a97395e7f47aea2c387d1f87b5')
b2sums=('a23668dcf03542234d84d234207fb3c0a8e44abd1c122de370abdb9cbf82e02fe4c74181f3546c038c5b4bb556823e14d6ace766ae61a1bc914e2dff8e15cf90'
        '109da4ad54c7bd83fc921423b2b117d8c944ca806e43829e65e006ba4f52fdb7218a15b32ed1e20fa53688d0ea17ecb69d70795090a9a3b6a6110944f12dca8d')
b2sums=('aadf42f819c981a0b43fbcb504d939d0ada0b17215dc85aea1c136b792e8ee731227228f31e19aff2f4044eca8390ce798ff5b2c8023a40ceba98f4bbad67bdb'
        '5e682731a4af421d6d90a19c2a7f53a4dc8e8cb2b47296405f05299429658e08de57a3ca55b68e42b4fa8e4ed68db28d9562847076040bf33b426d5ce5b4a42d')
b2sums=('0de5d768e14f34a9b76e4849f72d0dc4bd8609f37d1b2f5a84d3dbf5526678d843efc06a9b74ca8e0d594464dadf70f3da9a9ccdf19bd59a08799479524b63d5'
        '649109e43610988263a300f42d8c77706d8f73ed25f8fefbe096bb93cd6ce264f85fc382977bc558abc42e51df23eea79846c5190faebe6a6a9222a62ca14029')
b2sums=('93fe11560d250488fbe482922a40011181790e2d9a25e18928301394bfd771b4a1be858d2506441f05c723d115b3cbbc157d40d82b2a6adcdfb44e656f6f5988'
        '6c41121628c89d4903e99bca2273937ee79829f921f0e889e4cacdb1b7ca367d2b3f82fb9a26557926eb890a376dbe328f44f210f7cf7654298a8c92247a2d9b')
b2sums=('9c54998f99a9977b325e52c8c1e6b1ec657b360049e6b8c69792b26d73260de4d2e40ccdcb76827b8349ab31d27aef3d6d55c6fe1e18a27e208b4593bf1d3778'
        'd260e25fb2552a2c2dbe15953f4c8dbd8deabbe31ef09d53bd1dd4b4e49f817117085980fe41c0ef22b95695a5ad9b1c1e1a80dcdd0d28c659261dd558595fe5')
