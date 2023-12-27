# Maintainer: Yun Dou <dixyes@gmail.com>

pkgbase=musa
pkgname=(
    musa-userspace
    mtgpu-dkms
)

pkgver=2.1.2
pkgrel=2

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
    "MUSA+Toolkits-rc1.4.1+Intel+CPU_Ubuntu.zip::MUSA+Toolkits-rc1.4.1+Intel+CPU_Ubuntu.zip"
    "fix-lts-build.diff::https://github.com/dixyes/mtgpu-drv/commit/56e502df5e0994a1f8cfae635066b8f29df2d1b3.diff"
)
sha512sums=(
    # 'e65522867013e82aaaa45e1e343b620d47cd8742ab8aa21edae6eae0d5a3ccdc188a0eb9264d61e0c09aa728c070a0356b2fc49f97f617e01746f55c1943502a'
    '74d49e14538c3430bd9c21d5be4eb3bd5b726be3e40e53ba780303e8bb1cc350986e6ab5109034f59fc7623650f21089e5fdd4068bb20463abea22e1cd6a2313'
    '984258a9570ddf4df68490f240e0fd8fa648202951cab888192b20505536f53a763b8238655fde50c2b1dbfaedc0694c9b183ec7788bb38325c65756fe212876'
)

prepare()
{
    ar x musa_2.1.2-Ubuntu-dev_amd64.deb
    rm control.tar.gz debian-binary
    tar -xf data.tar.gz
    rm data.tar.gz

    install -d -m0755 usr/local/musa

    # install packages
    tar -xf mudnn_rtm2.1.1.tar -C usr/local/musa --strip-components 2 \
        ./mudnn/lib \
        ./mudnn/include
    tar -xf mccl_rc1.2.0.tar.gz -C usr/local/musa --strip-components 2 \
        ./mccl/lib \
        ./mccl/include \
        ./mccl/LICENSE.txt
    tar -xf musa_toolkits_rc1.4.1.tar.gz -C usr/local/musa --strip-components 1 \
        musa_toolkits_1.4.1 \
        --exclude='musa_toolkits_1.4.1/install.sh'

    # dkms sources
    mv usr/src/mtgpu-1.0.0 "usr/src/mtgpu-${pkgver}"
    cd "usr/src/mtgpu-${pkgver}"
    patch -p1 < "${srcdir}/fix-lts-build.diff"
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
/usr/lib/x86_64-linux-gnu/musa
/usr/local/musa/lib
EOF

    # config files
    install -D -m0644 etc/OpenCL/vendors/MT.icd "${pkgdir}/etc/OpenCL/vendors/MT.icd"
    install -D -m0644 etc/vulkan/icd.d/musaicdconf.json "${pkgdir}/etc/vulkan/icd.d/musaicdconf.json"

    # install -D -m0644 etc/musa_config "${pkgdir}/etc/musa_config"
    install -D -m0644 etc/musa.ini "${pkgdir}/etc/musa.ini"

    # binaries and libraries
    install -d -m0755 "${pkgdir}/usr/lib/x86_64-linux-gnu/musa"
    cp -r --no-preserve='ownership' usr/bin usr/lib usr/local usr/share "${pkgdir}/usr/"

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
