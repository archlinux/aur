# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgbase=nvidia-340xx
pkgname=(nvidia-340xx nvidia-340xx-dkms); [ -n "$NVIDIA_340XX_DKMS_ONLY" ] && pkgname=(nvidia-340xx-dkms)
pkgver=340.108
pkgrel=32
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
  0006-kernel-5.14.patch
  0007-kernel-5.15.patch
  0008-kernel-5.16.patch
  0009-kernel-5.17.patch
  0010-kernel-5.18.patch
  0011-kernel-6.0.patch
  0012-kernel-6.2.patch
)
b2sums=('6538bbec53b10f8d20977f9b462052625742e9709ef06e24cf2e55de5d0c55f1620a4bb21396cfd89ebc54c32f921ea17e3e47eaa95abcbc24ecbd144fb89028'
        '49d99f612e8eee3ab5e34083c25348bfd14ed5fc8a7984dafc0dad7c0ae0df2c0b2a63a1bb993da440eb0a60293d7c753ca3889bd2f51991b8ddc51bce2fe4a8'
        '7150233df867a55f57aa5e798b9c7618329d98459fecc35c4acfad2e9772236cb229703c4fa072381c509279d0588173d65f46297231f4d3bfc65a1ef52e65b1'
        'b436095b89d6e294995651a3680ff18b5af5e91582c3f1ec9b7b63be9282497f54f9bf9be3997a5af30eec9b8548f25ec5235d969ac00a667a9cddece63d8896'
        '947cb1f149b2db9c3c4f973f285d389790f73fc8c8a6865fc5b78d6a782f49513aa565de5c82a81c07515f1164e0e222d26c8212a14cf016e387bcc523e3fcb1'
        '665bf0e1fa22119592e7c75ff40f265e919955f228a3e3e3ebd76e9dffa5226bece5eb032922eb2c009572b31b28e80cd89656f5d0a4ad592277edd98967e68f'
        '344cd3a9888a9a61941906c198d3a480ce230119c96c72c72a74b711d23face2a7b1e53b9b4639465809b84762cdc53f38210e740318866705241bc4216e4f35'
        '31a4047ab84d13e32fd7fdbf9f69c696d3fab6666c541d2acf0a189c1d17c876970985167fd389a4adc0f786021172bdec1aa6d690736e3cf9fcd8ceabe5fd32'
        'b3b7bbd597252b25ccb68f431f83707a10d464996f6c74bb67143795df96054da719faf09c1ad2e1c215261356833ad3fa0d9e60552151f827f9d7be7ae44605'
        'caedc5651bfd14c02fb677f9c5e87adef298d871c6281b78ce184108310e4243ded82210873014be7fedee0dd6251305fa9bbce0c872b76438e0895ef76109d9'
        '0266e1baaac9ffbb94d9e916a693b1663d8686b15e970bfc30f7c51f051a0af9267aa5f6a12b68586c69d2e9796a1124488b3997ba4b26db1a5ac10a892f0df2'
        'd69c9acbe550d5fccca68ca6a0d5095cbcaf887d2bc43704a8eb85533896692f16701eef07ead297881f596f5502c3105bb5bea77b2dcaf6c4dc2b49941f9f19'
        '682a7b8e58d2a008531b7e5179e32c0c71adad673891a1057acd1aa26e410d9d93ff607e46257c6701619621cee1a27e613ec9ae19a580acdd6f68f1c1fdedea'
        '47681d1e4b16f0b50775120b0a02bc6d279de692cde6086b895eef80bb4598e914ffe1fae81707a771d00f23df60ee4df591dfe042f5b764856d2e07306f3821')
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
