# Maintainer: Yun Dou <dixyes@gmail.com>

pkgbase=musa
pkgname=(
    musa-userspace
    mtgpu-dkms
)

pkgver=2.6.0
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
    "MUSA+SDK-rc2.0.0+Intel+CPU_Ubuntu.zip::https://developer.mthreads.com/sdk/download/musa?equipment=&os=&driverVersion=&version="
    "00-port-ti-img-rouge-newer-sources-${pkgver}.diff::https://github.com/dixyes/mtgpu-drv/commit/5348abd9861c6906e4927d26a7d587190c7f1fe0.diff"
    "01-disable-cursor_set-things-${pkgver}.diff::https://github.com/dixyes/mtgpu-drv/commit/fb093df3606894481555fb19161c5713e5a1fbbe.diff"
    "02-fake-ubuntu-${pkgver}.diff::https://github.com/dixyes/mtgpu-drv/commit/b7bb67ab99172a6dc8e0e29db255ac4b9d44f967.diff"
    "03-fix-oops-${pkgver}.diff::https://github.com/dixyes/mtgpu-drv/commit/78a7620f8c3ad8201749a504216d886809fc9c01.diff"
)
sha512sums=('a06fe0c6d49d0569072bb2ebc40d68d5cf6f00a8fcafd72b25619469276e740f5a0bcd4cf742751ec6e2698310cd9c9041593039fb5e2509641e68be13dada07'
            '3342a70d3edd8eeffed316344616cb3e7e0811bbe63afd48e7802e9807209236516ee3ccfbd8a449569ec05a04f73c562d3a246f28a364db6b3be46838f20a74'
            'd9ade66f27c9afe43343191ed671a18740a2543dab95c12f11187f3bff57ded4b0a8ef56f383413e0ba98447c851f07f591a3a128cc21df4780c699107447427'
            '06b60c59c664234959f2f9c4cbc30e871bdc405a396cb2094222a66e302dbdc272c8ee3ebdc659c66428224fe1c6c5d29baa76bd66273328e3c5b77fce1a1eef'
            '8b4ffa908b73dbcc7b0957bb4e8444fa7481bf9eb3751b2ffb656d4fe1cbaf2f28c1614a26e39a6f971e01340659b4f20507c72aae21cfd04fa84a6420ad9697')

prepare()
{
    # NOTE: at 2.6.0 they are the same
    ar x MT_Linux_Driver_2.6.0/musa_2.6.0-Ubuntu-dev-quyuan_amd64.deb
    rm control.tar.gz debian-binary
    tar -xf data.tar.gz
    rm data.tar.gz

    install -d -m0755 usr/local/musa

    # install packages
    # TODO: split quyuan and chunxiao
    tar -xf muDNN_rc2.4.0/mudnn_rc2.4.0-chunxiao.tar.gz -C usr/local/musa --strip-components 2 \
        ./mudnn/bin \
        ./mudnn/lib \
        ./mudnn/include \
        ./mudnn/docs
    tar -xf MCCL_rc1.4.0/mccl_rc1.4.0-chunxiao.tar.gz -C usr/local/musa --strip-components 2 \
        ./mccl/bin \
        ./mccl/lib \
        ./mccl/include \
        ./mccl/cmake \
        ./mccl/LICENSE.txt
    tar -xf MUSA_Toolkits_rc2.0.0/musa_toolkits_rc2.0.0-chunxiao.tar.gz -C usr/local/musa --strip-components 1 \
        musa_toolkits_2.0.0 \
        --exclude='musa_toolkits_2.0.0/install.sh' \
        --exclude='musa_toolkits_2.0.0/version.json'

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
