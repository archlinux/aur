# Maintainer: graysky <graysky AT archlinux DOT us>
# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=nvidia-340xx
pkgname=(nvidia-340xx nvidia-340xx-dkms); [ -n "$NVIDIA_340XX_DKMS_ONLY" ] && pkgname=(nvidia-340xx-dkms)
pkgver=340.108
pkgrel=20
pkgdesc="NVIDIA drivers for linux, 340xx legacy branch"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-340xx-utils=${pkgver}" 'linux>=5.5' 'linux-headers>=5.5')
conflicts=('nvidia')
license=('custom')
options=(!strip)
# https://github.com/warpme/minimyth2/tree/master/script/nvidia/nvidia-340.108/files
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
  20-nvidia.conf
  0001-kernel-5.7.patch
  0002-kernel-5.8.patch
  0003-kernel-5.9.patch
  0004-kernel-5.10.patch
  0005-kernel-5.11.patch
)
b2sums=('6538bbec53b10f8d20977f9b462052625742e9709ef06e24cf2e55de5d0c55f1620a4bb21396cfd89ebc54c32f921ea17e3e47eaa95abcbc24ecbd144fb89028'
        'a0266d62a742f8ecd96be767b66af169c09428ba3f718efa1e36f2c69303e35b6437503381b041dd3a88fa86eb82909f8cbf209dbba4a5658fd7bb220a852000'
        '7150233df867a55f57aa5e798b9c7618329d98459fecc35c4acfad2e9772236cb229703c4fa072381c509279d0588173d65f46297231f4d3bfc65a1ef52e65b1'
        'b436095b89d6e294995651a3680ff18b5af5e91582c3f1ec9b7b63be9282497f54f9bf9be3997a5af30eec9b8548f25ec5235d969ac00a667a9cddece63d8896'
        '947cb1f149b2db9c3c4f973f285d389790f73fc8c8a6865fc5b78d6a782f49513aa565de5c82a81c07515f1164e0e222d26c8212a14cf016e387bcc523e3fcb1'
        '665bf0e1fa22119592e7c75ff40f265e919955f228a3e3e3ebd76e9dffa5226bece5eb032922eb2c009572b31b28e80cd89656f5d0a4ad592277edd98967e68f'
#        'bbea70e129f5a51a06a0c341f731be360f39f6b31a88df39e97c2d8f2daa87dd6c4b3a8becc57f25ad2a26ad567c69208546d907e7334c320796c4140fc78a15')
	'344cd3a9888a9a61941906c198d3a480ce230119c96c72c72a74b711d23face2a7b1e53b9b4639465809b84762cdc53f38210e740318866705241bc4216e4f35')
_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

# default is 'linux' substitute custom name here
_kernelname=linux
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
  [ -n "$NVIDIA_340XX_DKMS_ONLY" ] && return 0
  cd "${_pkg}/kernel"
  make SYSSRC="/usr/src/$_kernelname" module

  cd uvm
  make SYSSRC="/usr/src/$_kernelname" module
}

package_nvidia-340xx() {
  pkgdesc="NVIDIA drivers for linux, 340xx legacy branch"
  depends=('linux>=5.3.6' "nvidia-340xx-utils=$pkgver" 'libgl')
  install=nvidia-340xx.install

  install -Dt "${pkgdir}${_extradir}" -m644 \
    "${srcdir}/${_pkg}/kernel"/{nvidia,uvm/nvidia-uvm}.ko

  find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-340xx.conf"

  install -Dm644 "$srcdir/20-nvidia.conf" "$pkgdir/usr/share/nvidia-340xx/20-nvidia.conf"
}

package_nvidia-340xx-dkms() {
  pkgdesc="NVIDIA driver sources for linux, 340xx legacy branch"
  depends=('dkms' "nvidia-340xx-utils=$pkgver" 'libgl')
  optdepends=('linux-headers: Build the module for Arch kernel')
  provides=("nvidia-340xx=$pkgver")
  conflicts+=('nvidia-340xx')
  install=nvidia-340xx.install

  cd "${_pkg}"

  install -dm 755 "${pkgdir}"/usr/src
  cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-${pkgver}"
  cat "${pkgdir}"/usr/src/nvidia-${pkgver}/uvm/dkms.conf.fragment >> "${pkgdir}"/usr/src/nvidia-${pkgver}/dkms.conf

  echo "blacklist nouveau" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

  install -Dm644 "$srcdir/20-nvidia.conf" "$pkgdir/usr/share/nvidia-340xx/20-nvidia.conf"
}

# vim:set ts=2 sw=2 et:
