# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=intel-sgx-psw-bin
pkgdesc='Intel® Software Guard Extensions Platform Software for Linux* OS'
pkgver=2.29
pkgrel=1
url='https://github.com/intel/linux-sgx'
arch=('x86_64')
license=('BSD-3-Clause AND LicenseRef-IntelSgx-ThirdParty') # https://github.com/intel/linux-sgx?tab=License-1-ov-file
makedepends=()
depends=('glibc' 'gcc-libs' 'bash')
optdepends=(
  'protobuf-21: required for the AESM service'
  'nodejs: for running the SGX DCAP PCCS Server'
  'curl: required for SGX Remote Attestation Service (RA)'
  'boost190: required by the TDX Quote Generation Service (QGS)'
)
provides=("intel-sgx-psw=${pkgver}")
conflicts=('intel-sgx-psw')
options=(!strip !debug) # debug symbols already included from upstream, better not to strip them
backup=('etc/aesmd.conf' 'etc/mpa_registration.conf' 'etc/qgs.conf' 'etc/sgx_default_qcnl.conf')
source=("sgx_${pkgver}_debian_local_repo.tgz::https://download.01.org/intel-sgx/sgx-linux/${pkgver}/distro/ubuntu26.04-server/sgx_debian_local_repo.tgz"
       'intel-sgx-sysusers.conf')
b2sums=('5832a7537c7bb0b50376bf6818e647bd738ba54da6263249ddf7c6a6483b60a0458bc7177c893ea7a364ddfa9c9ab9abcb5925ef12dd30c3f4ab61b9c0d62180'
        'f0a1415f8e88ffe2fe189c56a701a9756f74947375f142aa3965679129d3182f1b380beea02d70e07cbe7c9443461b8cbb674193ae07f71d543d13a10ecaf7ff')

package() {
  # shellcheck disable=SC2016
  find "${srcdir}"/sgx_debian_local_repo -name "*.deb" -exec \
    sh -c 'ar -p "$1" -O data.tar.zst | tar -x --zstd -C "$0"' "${pkgdir}" {} \;

  # required users and groups
  install -Dm644 intel-sgx-sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/intel-sgx.conf

  # composed license
  install -Dm644 "${pkgdir}"/usr/share/doc/libsgx-enclave-common/copyright -t "${pkgdir}/usr/share/licenses/${pkgname}"

  _fix_non_standard_paths # namcap rule: directoryname
  _fix_binary_symlinks # namcap rule: symlink
}

# Move files to standard Arch Linux folders
_fix_non_standard_paths() {
  # /etc/udev is for user files, packages should use /usr/lib/udev instead
  install -d -m755 "${pkgdir}"/usr/lib/udev
  mv "${pkgdir}"/etc/udev/rules.d "${pkgdir}"/usr/lib/udev/rules.d
  rmdir "${pkgdir}"/etc/udev

  # Debian has a /usr/lib/$TARGET folder, but you won't find them in Arch
  mv "${pkgdir}"/usr/lib/"${CARCH}"-linux-gnu/*.so* "${pkgdir}"/usr/lib/
  rmdir "${pkgdir}"/usr/lib/"${CARCH}"-linux-gnu

  # Debian has an actual /lib folder, which in Arch is just a symlink to /usr/lib
  mv "${pkgdir}"/lib/systemd/system/*.service "${pkgdir}"/usr/lib/systemd/system/
  rmdir "${pkgdir}"/lib/systemd/system "${pkgdir}"/lib/systemd "${pkgdir}"/lib

  # Debian also supports /include, which is empty here
  rmdir "${pkgdir}"/include
}

# Update symbolic links using non-standard Arch Linux paths
_fix_binary_symlinks() {
  local broken_symlinks=(
    "${pkgdir}/opt/intel/sgx-aesm-service/aesm/libsgx_pce.signed.so"
    "${pkgdir}/opt/intel/sgx-aesm-service/aesm/libsgx_pce.signed.so.1"
    "${pkgdir}/opt/intel/sgx-aesm-service/aesm/libsgx_qe3.signed.so"
    "${pkgdir}/opt/intel/sgx-aesm-service/aesm/libsgx_qe3.signed.so.1"
    "${pkgdir}/opt/intel/sgx-pck-id-retrieval-tool/libsgx_id_enclave.signed.so.1"
    "${pkgdir}/opt/intel/sgx-pck-id-retrieval-tool/libsgx_pce.signed.so.1"
  )

  local symlink target
  for symlink in "${broken_symlinks[@]}"; do
    target="${pkgdir}/usr/lib/$(basename "${symlink}")"
    target="$(realpath --relative-to="$(dirname "${symlink}")" "${target}")"

    ln -sf "${target}" "${symlink}"
  done
}
