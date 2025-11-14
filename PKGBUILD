# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=intel-sgx-psw-bin
pkgdesc='Intel® Software Guard Extensions Platform Software for Linux* OS'
pkgver=2.26
pkgrel=3
url='https://github.com/intel/linux-sgx'
arch=('x86_64')
license=('BSD-3-Clause AND LicenseRef-IntelSgx-ThirdParty') # https://github.com/intel/linux-sgx?tab=License-1-ov-file
makedepends=('dpkg' 'findutils' 'patchelf')
depends=('glibc' 'gcc-libs' 'bash')
optdepends=(
  'protobuf-21: required for the AESM service'
  'nodejs: for running the SGX DCAP PCCS Server'
  'curl: required for SGX Remotte Attestation Service (RA)'
  'boost183: required by the TDX Quote Generation Service (QGS)'
)
provides=("intel-sgx-psw=${pkgver}")
conflicts=('intel-sgx-psw')
backup=('etc/aesmd.conf' 'etc/mpa_registration.conf' 'etc/qgs.conf' 'etc/sgx_default_qcnl.conf')
source=("sgx_${pkgver}_debian_local_repo.tgz::https://download.01.org/intel-sgx/sgx-linux/${pkgver}/distro/ubuntu24.04-server/sgx_debian_local_repo.tgz")
b2sums=('6c298b4dd0705ea62dbe9a55f733ff19a66f0cc53834175ac08e8fd576718f5be5d081902720ae84b77e565dd9e8054414c3a2b5c146d3c58ef8bd3ef81bd8d3')

package() {
  find "${srcdir}"/sgx_debian_local_repo -name "*.deb" -exec dpkg-deb -x {} "${pkgdir}" \;

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

  # Debian has this /usr/lib/$TARGET folder, but you won't find them in Arch
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
  broken_symlinks=(
    "${pkgdir}/opt/intel/sgx-aesm-service/aesm/libsgx_pce.signed.so"
    "${pkgdir}/opt/intel/sgx-aesm-service/aesm/libsgx_pce.signed.so.1"
    "${pkgdir}/opt/intel/sgx-aesm-service/aesm/libsgx_qe3.signed.so"
    "${pkgdir}/opt/intel/sgx-aesm-service/aesm/libsgx_qe3.signed.so.1"
    "${pkgdir}/opt/intel/sgx-pck-id-retrieval-tool/libsgx_id_enclave.signed.so.1"
    "${pkgdir}/opt/intel/sgx-pck-id-retrieval-tool/libsgx_pce.signed.so.1"
  )

  for symlink in "${broken_symlinks[@]}"; do
    target="${pkgdir}/usr/lib/$(basename "${symlink}")"
    target="$(realpath --relative-to="$(dirname "${symlink}")" "${target}")"

    ln -sf "${target}" "${symlink}"
  done
}
