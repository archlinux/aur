# Maintainer Joel Shapiro (jshapiro <a> nvidia)

pkgbase=libnvidia-container
pkgname=(libnvidia-container libnvidia-container-tools)

pkgver=1.0.0
_rpcver=1.1.4
_elfver=0.7.1
_nvmpver=396.51

pkgrel=1
pkgdesc='NVIDIA container runtime library'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('custom')

makedepends=(bmake lsb-release rpcsvc-proto)
depends=(libcap libseccomp)

# yikes! somehow the default flags cause a linking error :(
options=(!makeflags)

# This make process downloads files from other sources to build the libs as deps cleanly in place.
# This pkgbuild elects to download them ahead of time so their checksums can be validated.
# See:
# https://github.com/NVIDIA/libnvidia-container/blob/56704b8dd297bf4daf82a2da4b270dc7f14e0008/mk/libtirpc.mk
# https://github.com/NVIDIA/libnvidia-container/blob/e3a2035da5a44b8a83d9568b91a8a0b542ee15d5/mk/elftoolchain.mk
# https://github.com/NVIDIA/libnvidia-container/blob/56704b8dd297bf4daf82a2da4b270dc7f14e0008/mk/nvidia-modprobe.mk
source=("https://github.com/NVIDIA/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://downloads.sourceforge.net/project/libtirpc/libtirpc/${_rpcver}/libtirpc-${_rpcver}.tar.bz2"
        "https://sourceforge.net/projects/elftoolchain/files/Sources/elftoolchain-${_elfver}/elftoolchain-${_elfver}.tar.bz2"
        "https://github.com/NVIDIA/nvidia-modprobe/archive/396.51.tar.gz")
sha256sums=('5c8ca77e490fd9a0a47020fa0d6d9842af4951bfcb12d189db37ad5524b67f27'
            '2ca529f02292e10c158562295a1ffd95d2ce8af97820e3534fe1b0e3aec7561d'
            '44f14591fcf21294387215dd7562f3fb4bec2f42f476cf32420a6bbabb2bd2b5'
            '25bc6437a384be670e9fd76ac2e5b9753517e23eb16e7fa891b18537b70c4b20')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i ../../fix_rpc_flags.patch

  deps_dir="${srcdir}/${pkgname}-${pkgver}/deps/src/"
  # mimic behavior from:
  # https://github.com/NVIDIA/libnvidia-container/blob/56704b8dd297bf4daf82a2da4b270dc7f14e0008/mk/libtirpc.mk
  for dep in "libtirpc-${_rpcver}.tar.bz2" "elftoolchain-${_elfver}.tar.bz2" "${_nvmpver}.tar.gz"; do
    dep_dir="${deps_dir}/${dep%.tar*}"
    mkdir -p ${dep_dir}
    # untar the download into the deps dir
    tar -xf "${srcdir}/${dep}" -C "${dep_dir}" --strip-components=1
    # tell make to ignore this target, it's already done
    touch "${dep_dir}/.download_stamp"
  done

  # the tar isn't named correctly, so the dir needs moving
  if [ ! -d "${deps_dir}/nvidia-modprobe-${_nvmpver}" ]; then
    mv "${deps_dir}/${_nvmpver}" "${deps_dir}/nvidia-modprobe-${_nvmpver}"
  fi
}

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  # finally actually make
  CC=gcc make WITH_LIBELF=yes WITH_TIRPC=yes WITH_SECCOMP=yes prefix=/usr
}

make_dist(){
  cd "${srcdir}/${pkgbase}-${pkgver}"
  # package
  make dist prefix=/usr

  # untar into $pkgdir
  tar -xf "${srcdir}/${pkgbase}-${pkgver}/dist/${pkgbase}_${pkgver}_x86_64.tar.xz" -C ${pkgdir} --strip-components=1
}

package_libnvidia-container() {
  make_dist

  # cleanup
  rm -rf "${pkgdir}/usr/lib/debug"
  rm -rf "${pkgdir}/usr/lib/pkgconfig"

  # save bin/ for -tools
  rm -rf "${pkgdir}/usr/bin"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  rm -rf "${pkgdir}/usr/share/doc"
}

package_libnvidia-container-tools() {
  make_dist

  # cleanup
  rm -rf "${pkgdir}/usr/lib/debug"
  rm -rf "${pkgdir}/usr/lib/pkgconfig"

  # save lib/ and include/ for -tools
  rm -rf "${pkgdir}/usr/lib"
  rm -rf "${pkgdir}/usr/include"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 "${pkgdir}/usr/share/doc/${pkgbase}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  rm -rf "${pkgdir}/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
