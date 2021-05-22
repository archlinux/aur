# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers
pkgname=(
  kata-agent
  kata-runtime
  #kata-containers-image
)
pkgver=2.1.0
_pkgver=${pkgver/\~/-}
pkgrel=3
pkgdesc="Lightweight virtual machines for containers, version 2"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=(
  'go' 'bc' 'rust'
  #'yq2-bin'  # quietly pulled by Kata's codebase to read versions.yaml from source repo
  'mkinitcpio'  # initrd build
  'pacman' 'udisks2' # rootless image build
)

_gh_org="github.com/kata-containers"

source=(
  "${pkgbase}-${_pkgver}.tar.gz::https://${_gh_org}/kata-containers/archive/${_pkgver}.tar.gz"

  # mknitcpio-busybox
  "mkinitcpio-agent.conf"
  "install_kata-agent.tpl"
  "image_builder.sh"  # image build

  # mknitpcio-systemd
  "install_sd-kata-agent.tpl"
  "kata-agent.service.in"
  "kata-containers.target"
)
sha512sums=(
  "ccfc712168738fce1f26b14fbe4a0dcecd9d1f3a0698c06487d98091173951be141c06b4314712ea9b67cda93d2efa8701c3b9afc8770458147defa5adbabf1a"

  "182a249aecbab33b8704e9567e96d33b535ee59e6d2f52f0c30fbc3d12813f60192886539cc745933caaf59268925d78db9e0b6b427321e2bac932ebde77d62e"
  "0250e52251986f36cfb9e378d848f755caaf5253daa8ff7d87172f2622754c1eb4180b338a497e3fbeb880e232eef19d5e512f5a8e610e7a6eb468f210849a08"
  "6f476297d9001eef9a0665689f752cf5124907522cfc87240df16488379a5c7c9820a6e33a576dbf7f75c4fdfa7cab7a0e395b05c9339069dedbdaac42fb6c04"

  "60e2dee0afcfc52b6075309b4eeb55c75dc4a8f063274f2cd481a0056fae0e78e414f0422af26acddff93edb43a23cb52c26aefd92677160fd8eb6a685b6a6d6"
  "8f927f482d54a762ae5c952883034355a76c5547993ed4245a434a74014aa96e6c5182e3ece0a431e075c1d2f86e99ed0d0d8d839586821c5a7cdf053ec6963d"
  "b599a62d07f4451f52747eaf185142fbe8eeb9aced211369fc83d88c43483ef1008f87615fcfcf30d74a557569b89d5fcb4a61326ffc8cb0559ec51807d808ca"
)
b2sums=(
  "ee14536ba48ece1beba2409082446b18b80450233335bf2b9644604cf3d97404caa9f58a0ca1de69da50cd900e0b7ee5f9b046e206b9235ed77b9deccb2399d6"

  "43c81141a65fd14b60ae72c5b98168bec531990903cc7c8b224b416c71d1d05c1cf3f73891954604e0b0c6f48c52a3a41a8e9e78874a79e72b14282373108e8b"
  "9abf2208af353019ba177d8a48ba613401742cd21258a79c5d9cb8518a51f4f22a41dc386b71f2d6521d03f6ff65d8710dc59d1ca9c7c1dc5f94061c7374286c"
  "1745aa5d5df0af2452381de163e3964511172e045c13736a062bb2c932e3306250d24992b2bdbc534ced188b35d3b1f4958a5680c99356afd3097d11c84aee31"

  "1ce51ec8cfac8149e3d421d58ec4cb5df2119f4c4d6371da3406297f87a35b6453a9a91bfce9b3b6ac81945b9c8c8237d5818b7321198635614148a8001e3da7"
  "8b5371fe7b1858dc61dcf4153b58f9c7a5ba564299d657c2bc4eac2328801346e9ca3f6f441dcca710e89495e5b7f9d35b002a8e031eb3cbd4a4fa850566309a"
  "60bb47bec6e35ccc460ac066d7205d084ab8bdc7d1749918ce0497983a6e7eb770ca9fd996f44b05dbdbfc35390bf2d02b7e8abc619fa6d9df298988d5f19053"
)

case "${CARCH}" in
  x86_64)     _KARCH=x86_64;;
  aarch64)    _KARCH=arm64;;
  s390|s390x) _KARCH=s390;;
  ppc64le)    _KARCH=powerpc;;
esac

prepare(){
  #install -dm0755 "${srcdir}/bin"
  #ln -sf "$(command -v yq)" "${srcdir}/bin/yq"

  # agent-based initrd
  BINSRC="${srcdir}/${pkgbase}-${_pkgver}/src/agent/target/${_KARCH}-unknown-linux-gnu/release/kata-agent" envsubst <"${srcdir}/install_kata-agent.tpl" >"${srcdir}/install_kata-agent"
  install -Dm0644 "${srcdir}/install_kata-agent" "${srcdir}/initcpio-agent/install/kata-agent"

  # systemd units
  install -Dm0644 "${srcdir}/kata-agent.service.in" "${srcdir}/${pkgbase}-${_pkgver}/src/agent/kata-agent.service.in"
  install -Dm0644 "${srcdir}/kata-containers.target" "${srcdir}/${pkgbase}-${_pkgver}/src/agent/kata-containers.target"

  # systemd-based initrd
  SRCDIR="${srcdir}/${pkgbase}-${_pkgver}/src/agent" KARCH="${_KARCH}" envsubst <"${srcdir}/install_sd-kata-agent.tpl" >"${srcdir}/install_sd-kata-agent"
  install -Dm0644 "${srcdir}/install_sd-kata-agent" "${srcdir}/initcpio-systemd/install/sd-kata-agent"

  # remove subrepos without the `install` makefile target
  sed -i \
    -e '/COMPONENTS += trace-forwarder/d' \
    -e '/TOOLS += agent-ctl/d' \
    "${srcdir}/${pkgbase}-${_pkgver}/Makefile"
  install -m0755 "${srcdir}/image_builder.sh" "${srcdir}/${pkgbase}-${_pkgver}/tools/osbuilder/image-builder/image_builder.sh"
}

_kata_image_build() {
  install -dm0755 "${srcdir}/pkgcache" "${srcdir}/alpmdb" "${srcdir}/rootfs"
  fakeroot -- pacman -r "${srcdir}/rootfs" -b "${srcdir}/alpmdb" --cachedir "${srcdir}/pkgcache" --noconfirm -Sy systemd chrony iptables kmod libseccomp
  pushd "${srcdir}/rootfs/sbin"
  ln -sf ../lib/systemd/systemd init
  popd

  install -Dm0755 "${srcdir}/${pkgbase}-${_pkgver}/src/agent/target/${_KARCH}-unknown-linux-gnu/release/kata-agent" "${srcdir}/rootfs/usr/bin/kata-agent"
  install -Dm0644 "${srcdir}/${pkgbase}-${_pkgver}/src/agent/kata-containers.target" "${srcdir}/rootfs/usr/lib/systemd/system/kata-containers.target"
  sed -e 's#@BINDIR@#/usr/bin#' -e 's#@AGENT_NAME@#kata-agent#' "${srcdir}/${pkgbase}-${_pkgver}/src/agent/kata-agent.service.in" >"${srcdir}/rootfs/usr/lib/systemd/system/kata-agent.service"

  # rootfs image (builds filesystem with uid:gid of building system user! beware!)
  cd "${srcdir}/${pkgbase}-${_pkgver}/tools/osbuilder/image-builder"
  ./image_builder.sh -f ext4 "${srcdir}/rootfs"
}

build(){
  local i
  cd "${srcdir}/${pkgbase}-${_pkgver}"
  GOPATH="${srcdir}" make BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib" LIBC=gnu

  #mkinitcpio -c "${srcdir}/mkinitcpio-agent.conf" -g "${srcdir}/initrd-arch-agent.img" -D "${srcdir}/initcpio-agent"
  #mkinitcpio -c "${srcdir}/mkinitcpio-systemd.conf" -g "${srcdir}/initrd-arch-systemd.img" -D "${srcdir}/initcpio-systemd"
  #_kata_image_build
}

package_kata-agent(){
  cd "${srcdir}/${pkgbase}-${_pkgver}/src/agent"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib" LIBC=gnu

  # install hooks
  install -dm0755 "${pkgdir}/usr/lib/initcpio/install"
  BINSRC="/usr/bin/kata-agent" envsubst <"${srcdir}/install_kata-agent.tpl" >"${pkgdir}/usr/lib/initcpio/install/kata-agent"
  #SRCDIR="${srcdir}/${pkgbase}-${_pkgver}/src/agent" KARCH="${_KARCH}" envsubst <"${srcdir}/install_sd-kata-agent.tpl" >"${srcdir}/install_sd-kata-agent"
}

package_kata-containers-image(){
  install=kata2-guest.install
  local -r _img_filename="kata-containers-${_pkgver%%~*}-arch-systemd-image.img" _initrd_filename="kata-containers-${_pkgver%%~*}-arch-agent-initrd.img"
  install -Dm 0644 "${srcdir}/${pkgbase}-${_pkgver}/tools/osbuilder/image-builder/kata-containers.img" "${pkgdir}/usr/share/kata-containers/${_img_filename}"
  #install -Dm 0644 "${srcdir}/initrd-arch-agent.img" "${pkgdir}/usr/share/kata-containers/${_initrd_filename}"
  pushd "${pkgdir}/usr/share/kata-containers"
  ln -sf "${_img_filename}" "kata-containers-arch.img"
  #ln -sf "${_initrd_filename}" "kata-containers-arch-initrd.img"
  popd
}

package_kata-runtime(){
  optdepends=(
    'kata-containers-image: Disk and initrd images for booting Kata VMs'
    'linux-kata: Kernel images for booting Kata VMs'
    'qemu-headless: QEMU-hypervised Kata VMs'
    'cloud-hypervisor<16.0: Cloud-Hypervisor-based Kata VMs'
    'firecracker<0.24.0: Firecracker-based Kata VMs'
  )
  install=kata2-runtime.install
  cd "${srcdir}/${pkgbase}-${_pkgver}/src/runtime"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib" LIBC=gnu
}
