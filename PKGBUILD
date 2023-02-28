# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=nvidia-340xx-lts
pkgname=(nvidia-340xx-lts nvidia-340xx-lts-dkms)
pkgver=340.108
pkgrel=6
pkgdesc="NVIDIA drivers for linux-lts, 340xx legacy branch"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-340xx-utils=${pkgver}" 'linux-lts>=6.1.14' 'linux-lts-headers>=6.1.14')
conflicts=('nvidia-lts')
license=('custom')
options=(!strip)
# seems manjaro is keeping this current
# https://gitlab.manjaro.org/packages?utf8=%E2%9C%93&filter=nvidia-340xx
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
  20-nvidia.conf
  0001-kernel-5.7.patch
  0002-kernel-5.8.patch
  0003-kernel-5.9.patch
  0004-kernel-5.10.patch
  0005-kernel-5.11.patch
  0006-kernel-5.14.patch
  0007-kernel-5.15.patch
  0008-kernel-5.16.patch
  0009-kernel-5.17.patch
  0010-kernel-5.18.patch
  0011-kernel-6.0.patch
)
sha256sums=('995d44fef587ff5284497a47a95d71adbee0c13020d615e940ac928f180f5b77'
            '5b4cb7620abc1729a13c78a2fb33ccaeb7d92f42936d929885324c81f2b7c985'
            'c8bda5fb238fbebc5bf6ae4b7646e48b30a96b9060ced20d93c53c14ac3161f6'
            '10b91c8dbc269ff1d8e3e8a1866926c309ff3912d191a05cd5724a3139776f32'
            'e06af37ffa2203698594e0f58816b809feced9b2374927e13b85fd5c18fa3114'
            '5e184ca5fcbf5071050f23503bfd3391c4bc1ccc31453338791a3da3885b6085'
            '2430303d6a0f48418532229aa5377e8848be762a8fdc790edeba30e6eec5214c'
            '47ca88252c6b40f488f403f81c3eb1c1e5a5eed1dc353e31d53b5c815c433238'
            'ff4869ea16eb3d894b13a6ca6775906ce0feacf405a2ade63c4f052df6024769'
            'ad663464d7f57f0f7136bd727ed088d733b087be10cd944ba7d089c421536717'
            'e9970b3ab78f34bdfa29f5dc4f6772aa35026d14d14a0e35bd9744187583edc9'
            'ebb3c5f9b41d0d5081b27a6335ffa6114d65dbcb98f935158167877c394ccb89'
            'b741790983e2bfba1c7d1842af73a353fbe0de987bec3ee05385d20f244226b9')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

# default is 'linux' substitute custom name here
_kernelname=linux-lts
_kernver="$(</usr/src/$_kernelname/version)"
_extradir="/usr/lib/modules/$_kernver/extramodules"

prepare() {
  sh "${_pkg}.run" --extract-only

  cd "${_pkg}"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 0*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  cp -a kernel kernel-dkms
}

build() {
  cd "${_pkg}/kernel"
  make SYSSRC="/usr/src/$_kernelname" module

  cd uvm
  make SYSSRC="/usr/src/$_kernelname" module
}

package_nvidia-340xx-lts() {
  pkgdesc="NVIDIA drivers for linux-lts, 340xx legacy branch."
  depends=('linux-lts>=4.19.72' "nvidia-340xx-utils=$pkgver" 'libgl')
  install=nvidia-340xx-lts.install

  install -Dt "${pkgdir}${_extradir}" -m644 \
    "${srcdir}/${_pkg}/kernel"/{nvidia,uvm/nvidia-uvm}.ko

  find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-340xx-lts.conf"

  install -Dm644 "$srcdir/20-nvidia.conf" "$pkgdir/usr/share/nvidia-340xx-lts/20-nvidia.conf"
}

package_nvidia-340xx-lts-dkms() {
    pkgdesc="NVIDIA driver sources for linux-lts, 340xx legacy branch"
    depends=('dkms' "nvidia-340xx-utils=$pkgver" 'libgl')
    optdepends=('linux-lts-headers: Build the module for lts kernel')
    provides=("nvidia-340xx=$pkgver")
    conflicts+=('nvidia-340xx')
    install=nvidia-340xx-lts.install

    cd "${_pkg}"

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-${pkgver}"
    cat "${pkgdir}"/usr/src/nvidia-${pkgver}/uvm/dkms.conf.fragment >> "${pkgdir}"/usr/src/nvidia-${pkgver}/dkms.conf

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

    install -Dm644 "$srcdir/20-nvidia.conf" "$pkgdir/usr/share/nvidia-340xx-lts/20-nvidia.conf"
}

# vim:set ts=2 sw=2 et:
