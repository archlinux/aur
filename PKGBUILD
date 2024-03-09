# Maintainer: Yun Dou <dixyes@gmail.com>

pkgbase=musa
pkgname=(
    mtgpu-dkms
    musa-userspace-chunxiao
    musa-userspace-quyuan
)

pkgver=2.6.0
pkgrel=2

pkgdesc='MooreThreads MUSA'
arch=('x86_64')
url='https://developer.mthreads.com/sdk/download/musa'
license=('custom')
options=('!strip')

makedepends=(
    'binutils'
)

_mtgpu_deb_name=MT_Linux_Driver_2.6.0/musa_2.6.0-Ubuntu-dev-quyuan_amd64.deb
_mudnn_chunxiao_tar_name=muDNN_rc2.4.0/mudnn_rc2.4.0-chunxiao.tar.gz
_mudnn_quyuan_tar_name=muDNN_rc2.4.0/mudnn_rc2.4.0-qy2.tar.gz # shitty naming
_mudnn_component_strip=2
_mudnn_prefix=./mudnn
_mccl_chunxiao_tar_name=MCCL_rc1.4.0/mccl_rc1.4.0-chunxiao.tar.gz
_mccl_quyuan_tar_name=MCCL_rc1.4.0/mccl_rc1.4.0-quyuan.tar.gz
_mccl_component_strip=2
_mccl_prefix=./mccl
_musa_toolkits_chunxiao_tar_name=MUSA_Toolkits_rc2.0.0/musa_toolkits_rc2.0.0-chunxiao.tar.gz
_musa_toolkits_quyuan_tar_name=MUSA_Toolkits_rc2.0.0/musa_toolkits_rc2.0.0-quyuan.tar.gz
_musa_toolkits_component_strip=1
_musa_toolkits_prefix=musa_toolkits_2.0.0

source=(
    # download it
    # # https://www.mthreads.com/pes/drivers/driver-info?productType=DESKTOP&productModel=DESKTOP_MTT_S80&osVersion=MTT_S80_Ubuntu
    # "musa_${pkgver}-Ubuntu_amd64.deb"::"invalid://musa_${pkgver}-Ubuntu_amd64.deb"
    # https://developer.mthreads.com/sdk/download/musa?equipment=&os=&driverVersion=&version=
    "MUSA+SDK-rc2.0.0+Intel+CPU_Ubuntu.zip::https://developer.mthreads.com/sdk/download/musa?equipment=&os=&driverVersion=&version="
    "00-port-ti-img-rouge-newer-sources-${pkgver}-${pkgrel}.diff::https://github.com/dixyes/mtgpu-drv/commit/4bae8c0555c09ac55d417f184788824a77b014b3.diff"
    "01-disable-cursor_set-things-${pkgver}-${pkgrel}.diff::https://github.com/dixyes/mtgpu-drv/commit/995bbbac20757ca22232448d1f29c5a2e9b67c04.diff"
    "02-fake-ubuntu-${pkgver}-${pkgrel}.diff::https://github.com/dixyes/mtgpu-drv/commit/81e52ddbbcc587a800724d25584d8060a1228429.diff"
    "03-fix-ipc_tty_write-${pkgver}-${pkgrel}.diff::https://github.com/dixyes/mtgpu-drv/commit/d85a187f4e9d2a031bebdabf4fecb841aa6b4851.diff"
    "04-workaround-pci_enable_pcie_error_reporting-${pkgver}-${pkgrel}.diff::https://github.com/dixyes/mtgpu-drv/commit/0b797a3e4b4f4ed36d6f0b7915cb764b7d6d0ba7.diff"
)
sha512sums=('a06fe0c6d49d0569072bb2ebc40d68d5cf6f00a8fcafd72b25619469276e740f5a0bcd4cf742751ec6e2698310cd9c9041593039fb5e2509641e68be13dada07'
            '6b8cea6c6c26c9ee83c095ff362d484401dfa2d745bfa603bc3ac2a9dcec5de31139c72de4f70ec9680ecfed695a196bbe33e6141dcd7a60a8aa05c6e2638200'
            'd9ade66f27c9afe43343191ed671a18740a2543dab95c12f11187f3bff57ded4b0a8ef56f383413e0ba98447c851f07f591a3a128cc21df4780c699107447427'
            '06b60c59c664234959f2f9c4cbc30e871bdc405a396cb2094222a66e302dbdc272c8ee3ebdc659c66428224fe1c6c5d29baa76bd66273328e3c5b77fce1a1eef'
            '6964b0960aafdec107b7c2a919a31b8e738605c71ffe2813f7614128958a18207308f4326d5ba5e5d4e235d313862377f5e5ffcc45cdc9cf390c69658b3cab85'
            '7137d91dea6e8ffdee392ecd7124bdb7ba0491b68ceda0c8663562f552d029403a2f9b849cac060a45748cc8d298ba1f7a2b7f2950b8f785348edb59754b6965')

prepare()
{
    # dkms sources and x things
    # NOTE: at 2.6.0 they are the same
    mkdir mtgpu
    pushd mtgpu
    ar x "../${_mtgpu_deb_name}"
    rm control.tar.gz debian-binary
    tar -xf data.tar.gz
    rm data.tar.gz

    mv usr/src/mtgpu-1.0.0 "usr/src/mtgpu-${pkgver}"
    pushd "usr/src/mtgpu-${pkgver}"
    
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
    popd # "usr/src/mtgpu-${pkgver}"
    popd # mtgpu

    # install packages

    mkdir chunxiao quyuan

    # chunxiao(quyuan1) variant (S70 S80 S3000)

    tar -xf "$_mudnn_chunxiao_tar_name" -C chunxiao --strip-components "${_mudnn_component_strip}" \
        "${_mudnn_prefix}/bin" \
        "${_mudnn_prefix}/lib" \
        "${_mudnn_prefix}/include" \
        "${_mudnn_prefix}/docs"
    tar -xf "$_mccl_chunxiao_tar_name" -C chunxiao --strip-components "${_mccl_component_strip}" \
        "${_mccl_prefix}/bin" \
        "${_mccl_prefix}/lib" \
        "${_mccl_prefix}/include" \
        "${_mccl_prefix}/cmake" \
        "${_mccl_prefix}/LICENSE.txt"
    tar -xf "$_musa_toolkits_chunxiao_tar_name" -C chunxiao \
        --strip-components "${_musa_toolkits_component_strip}" \
        "${_musa_toolkits_prefix}" \
        --exclude="${_musa_toolkits_prefix}/install.sh" \
        --exclude="${_musa_toolkits_prefix}/version.json"

    # quyuan2 variant (S90 S4000)

    tar -xf "$_mudnn_quyuan_tar_name" -C quyuan --strip-components "${_mudnn_component_strip}" \
        "${_mudnn_prefix}/bin" \
        "${_mudnn_prefix}/lib" \
        "${_mudnn_prefix}/include" \
        "${_mudnn_prefix}/docs"
    tar -xf "$_mccl_quyuan_tar_name" -C quyuan --strip-components "${_mccl_component_strip}" \
        "${_mccl_prefix}/bin" \
        "${_mccl_prefix}/lib" \
        "${_mccl_prefix}/include" \
        "${_mccl_prefix}/cmake" \
        "${_mccl_prefix}/LICENSE.txt"
    tar -xf "$_musa_toolkits_quyuan_tar_name" -C quyuan \
        --strip-components "${_musa_toolkits_component_strip}" \
        "${_musa_toolkits_prefix}" \
        --exclude="${_musa_toolkits_prefix}/install.sh" \
        --exclude="${_musa_toolkits_prefix}/version.json"
}

package_mtgpu-dkms()
{
    pkgdesc="MooreThreads mtgpu dkms driver"
    depends=("dkms")

    pushd mtgpu

    # modprobe config
    install -D -m0644 etc/modprobe.d/mtgpu.conf "${pkgdir}/etc/modprobe.d/mtgpu.conf"

    # firmwares
    install -d -m0755 "${pkgdir}/usr/lib/firmware/mthreads"
    cp -r --no-preserve='ownership' lib "${pkgdir}/usr/"

    # dkms sources
    install -d -m0755 "${pkgdir}/usr/src/mtgpu-${pkgver}"
    cp -dr --no-preserve='ownership' usr/src/mtgpu-${pkgver} "${pkgdir}/usr/src"

    popd # mtgpu
}

_package_musa-userspace()
{
    local _variant="$1"

    pushd mtgpu

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

    popd # mtgpu

    cp -r --no-preserve='ownership' "${_variant}" "${pkgdir}/usr/local/musa"
}

package_musa-userspace-chunxiao()
{
    pkgdesc="MooreThreads MUSA userspace libraries for chunxiao (S70 S80 S3000) include OpenCL, Vulkan, Xorg drivers, muDNN, MCCL, MUSA Toolkits"
    provides=("musa-userspace")
    conflicts=("musa-userspace")
    replaces=("musa-userspace")
    _package_musa-userspace "chunxiao"
}

package_musa-userspace-quyuan()
{
    pkgdesc="MooreThreads MUSA userspace libraries for quyuan (S90 S4000) include OpenCL, Vulkan, Xorg drivers, muDNN, MCCL, MUSA Toolkits"
    provides=("musa-userspace")
    conflicts=("musa-userspace")
    replaces=("musa-userspace")
    _package_musa-userspace "quyuan"
}
