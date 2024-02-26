# Maintainer: Yun Dou <dixyes@gmail.com>

pkgbase=musa
pkgname=(
    musa-userspace
    mtgpu-dkms
)

pkgver=2.5.0
pkgrel=1

pkgdesc='MooreThreads MUSA'
arch=('x86_64')
url='https://developer.mthreads.com/sdk/download/musa'
license=('custom')
options=('!strip')

makedepends=(
    'binutils'
)

source=(
    # download it
    # # https://www.mthreads.com/pes/drivers/driver-info?productType=DESKTOP&productModel=DESKTOP_MTT_S80&osVersion=MTT_S80_Ubuntu
    # "musa_${pkgver}-Ubuntu_amd64.deb"::"invalid://musa_${pkgver}-Ubuntu_amd64.deb"
    # https://developer.mthreads.com/sdk/download/musa?equipment=&os=&driverVersion=&version=
    "MUSA+Toolkits-v1.5.2+Intel+CPU_Ubuntu.zip::https://developer.mthreads.com/sdk/download/musa?equipment=&os=&driverVersion=&version="
    "00-port-ti-img-rouge-newer-sources.diff::https://github.com/dixyes/mtgpu-drv/commit/5f747fbfd28b25f230d4487be1a8fd6217715ba3.diff"
    "01-disable-cursor_set-things.diff::https://github.com/dixyes/mtgpu-drv/commit/17170659d9fcf6b1591ac539e7a7dae71ca01924.diff"
    "02-avoid-redefine.diff::https://github.com/dixyes/mtgpu-drv/commit/3d84942c3b1070054aafb089f48bbb57c88d643e.diff"
    "03-fake-ubuntu.diff::https://github.com/dixyes/mtgpu-drv/commit/f05b21697014645f2bb6470c9d8d7cb91af1bcb0.diff"
)
sha512sums=('a1749d95fa617d1974376aa8321ac71f0e4d3e3a5d9d8b07ea4904b48d6271e5d06f36c46a787127803b3fce7568c85e2d6cb9c3f44641c8b24d627318ba0f75'
            'dff8983f4abe3a6bd12ff8490ef8964753388b26d333c84083365c20a98bc761973c956bc4b87f37d981683eff25dcc0346714c59f9e00afe3a24da7717c7216'
            'd9ade66f27c9afe43343191ed671a18740a2543dab95c12f11187f3bff57ded4b0a8ef56f383413e0ba98447c851f07f591a3a128cc21df4780c699107447427'
            '21f4b395462f1e3af0178427931caae7dca139eceda16e65943e4989b8aa73acb36bfebd076ab3d80936942f16b94892d28b10e68bbbead015a2de68d4ba2629'
            'cd448b8909afe31260e2e34b402a41b1b5e4a34e5dabc413a0d154ed89de039001d115945403c560ea8b137786c7926038b1e4e25bf921b4956f6662daa27621')

prepare()
{
    ar x Driver/musa_2.5.0-server-Ubuntu_amd64.deb
    rm control.tar.gz debian-binary
    tar -xf data.tar.gz
    rm data.tar.gz

    install -d -m0755 usr/local/musa

    # install packages
    # TODO: split quyuan and chunxiao
    tar -xf muDNN/mudnn_rtm2.3.1-quyuan.tar.gz -C usr/local/musa --strip-components 1 \
        mudnn/lib \
        mudnn/include \
        mudnn/docs
    tar -xf MCCL/mccl_rtm1.3.0-quyuan.tar.gz -C usr/local/musa --strip-components 1 \
        ./mccl/lib \
        ./mccl/include \
        ./mccl/cmake \
        ./mccl/LICENSE.txt
    tar -xf MUSA\ Toolkits/musa_toolkits_rtm1.5.2-quyuan.tar.gz -C usr/local/musa --strip-components 1 \
        musa_toolkits_1.5.2 \
        --exclude='musa_toolkits_1.5.2/install.sh' \
        --exclude='musa_toolkits_1.5.2/version.json'

    # dkms sources
    mv usr/src/mtgpu-1.0.0 "usr/src/mtgpu-${pkgver}"
    cd "usr/src/mtgpu-${pkgver}"
    
    for patch in "${srcdir}"/*.diff; do
        patch -p1 < "${patch}"
    done

    cat > dkms.conf << EOF
MAKE="make ARCH=x86_64 KERNELVER=\$kernelver"
CLEAN="make ARCH=x86_64 clean"
BUILT_MODULE_NAME[0]="mtgpu"
DEST_MODULE_LOCATION[0]="/extra"
PACKAGE_NAME=mtgpu
PACKAGE_VERSION=${pkgver}
AUTOINSTALL="yes"
EOF
}

package_musa-userspace()
{
    pkgdesc="MooreThreads MUSA userspace libraries include muDNN, mccl"
    depends=()

    # ldconfig
    install -d -m0755 "${pkgdir}/etc/ld.so.conf.d"
    cat > "${pkgdir}/etc/ld.so.conf.d/musa.conf" <<EOF
/usr/lib/musa
/usr/local/musa/lib
EOF

    # config files
    install -D -m0644 etc/OpenCL/vendors/MT.icd "${pkgdir}/etc/OpenCL/vendors/MT.icd"
    install -D -m0644 etc/vulkan/icd.d/musaicdconf.json "${pkgdir}/etc/vulkan/icd.d/musaicdconf.json"

    # install -D -m0644 etc/musa_config "${pkgdir}/etc/musa_config"
    install -D -m0644 etc/musa.ini "${pkgdir}/etc/musa.ini"

    # binaries and libraries
    install -d -m0755 "${pkgdir}/usr"
    cp -r --no-preserve='ownership' usr/bin usr/local usr/share "${pkgdir}/usr/"
    install -d -m0755 "${pkgdir}/usr/lib/musa"
    cp -r --no-preserve='ownership' usr/lib/x86_64-linux-gnu/musa/* "${pkgdir}/usr/lib/musa"
    install -d -m0755 "${pkgdir}/usr/lib/dri"
    cp -r --no-preserve='ownership' usr/lib/x86_64-linux-gnu/dri/* "${pkgdir}/usr/lib/dri"
    install -d -m0755 "${pkgdir}/usr/lib/gbm"
    cp -r --no-preserve='ownership' usr/lib/x86_64-linux-gnu/gbm/* "${pkgdir}/usr/lib/gbm"

    # ucm2
    install -d -m0755 "${pkgdir}/usr/share/alsa/ucm2"
    ln -sf MooreThreads/ucm2/MooreThreads "${pkgdir}/usr/share/alsa/ucm2/"
}

package_mtgpu-dkms()
{
    pkgdesc="MooreThreads mtgpu dkms driver"
    depends=("dkms")

    # modprobe config
    install -D -m0644 etc/modprobe.d/mtgpu.conf "${pkgdir}/etc/modprobe.d/mtgpu.conf"

    # firmwares
    install -d -m0755 "${pkgdir}/usr/lib/firmware/mthreads"
    cp -r --no-preserve='ownership' lib "${pkgdir}/usr/"

    # dkms sources
    install -d -m0755 "${pkgdir}/usr/src/mtgpu-${pkgver}"
    cp -dr --no-preserve='ownership' usr/src/mtgpu-${pkgver} "${pkgdir}/usr/src"
}
