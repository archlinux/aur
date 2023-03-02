# Maintainer: 7Ji <pugokughin@gmail.com>

pkgbase=openvfd
pkgname=(
  "${pkgbase}-dkms"
  "${pkgbase}-service"
)
pkgver=1.4.2
pkgrel=1
_pkgdesc="FD628 and similar compatible LED controller driver for linux"
arch=('aarch64')
_openvfd_repo="linux_${pkgbase}"
url="https://github.com/arthur-liberman/${_openvfd_repo}"
license=('GPL3')
makedepends=('gcc')
_openvfd_commit='ac2d94c8f466d6d1d56b5dc818a342b0ce01a750'
_srcname="${_openvfd_repo}-${_openvfd_commit}"
source=(
  "${_srcname}.tar.gz::${url}/archive/${_openvfd_commit}.tar.gz"
  'openvfd-probe.sh'
  'openvfd.service'
  'openvfd.conf'
  'dkms.conf'
)
_armbian_commit='02ea36d5caef58d6e6b7e204054ea6d79c400395'
_confs=(
  h96max-x3 hk1-x3 hk1box t95 t95z-plus tx3-mini tx3 tx9-pro x92 x96air x96max x96maxplus
)
for _conf in "${_confs[@]}"; do
  source+=(
    "https://github.com/ophub/amlogic-s9xxx-armbian/raw/${_armbian_commit}/build-armbian/armbian-files/platform-files/amlogic/rootfs/usr/share/openvfd/conf/${_conf}.conf"
  )
done
sha256sums=(
  '76338767e0c8cfc7e61ce3b383e92441cb5affcebe9c6e95b7bda7cda10590c5'
  'd596e8572cbc89891bff3e93aa6f21dff69535af7d54c708ae9b1066b581d8e3'
  'b84b64d3fe307f327ef95c6e6cb5d5ff7cbe5658cb8d4345e870656dcab9b28a'
  '8bd929359277cd44b27a611fd3be56c5a2aece5712cae3013b6da20c1b80af99'
  '30d529ff7883029b6d83302fdf36a071aa50128527a681b9d5729dceb085e77e'
  '9de429c41be6a8c5d4a61cf9092e0efabc8e878fa21ccd1782a27ca5b4c1ab32'
  '4780db13829c1259bea051296b9cf57bf7ff3b2e8a0d540c651885ad4901a4b0'
  '7511cd7b6f419eeaafc2588e6a0606066457eb599dcf01d51ed07cdb5c1b2175'
  '375b04973480886cd4edda7599af4a20321499f07245fbed2c1ce14976c9bd49'
  '6c2d8b0ed493d97b216384af067646b59889b106c382f45e58c4db4c3f87e262'
  'bb0b784d020d21bb2297dd30b22e4041b553502377cd59212ebcbee5b8420a6d'
  '600e130268d4a416160c92e2a07063ed9042a209309a6276c3f3f7c50bd94cdd'
  '63589c832d26a9435ef2bdb19db8260ad9947addd6b34b794a5b41d0389a975d'
  '8578831a21bffed10d6efb759d4d7c9a50b5054f2f45a84347453f33c03d6646'
  '9c3fff0833cd6bff4955424ecd56874824838305dbd6d67f75a7f6350443eee0'
  '5d7a170a73bcff088d5d4de6404df043edabca008f5dd497589a8df380414cc3'
  'f17f8c8e8014ace6e514d7ca9058675dc0b64bfbc631af607cecda378da0d25e'
)

build() {
  # Build the service
  cd "${srcdir}/${_srcname}"
  make OpenVFDService
}

package_openvfd-dkms() {
  depends=(
    'dkms'
  )
  conflicts=(
    'linux-aarch64-flippy'
  )
  pkgdesc="${_pkgdesc}, DKMS module"
  local _srcname_dkms="${pkgbase}-${pkgver}"
  local _target_dir="${pkgdir}/usr/src/${_srcname_dkms}"
  install -DTm 644 "${srcdir}/dkms.conf" "${_target_dir}/dkms.conf"
  cp -rva "${srcdir}/${_srcname}/driver/"* "${_target_dir}/"
}

package_openvfd-service() {
  pkgdesc="${_pkgdesc}, service daemon"
  depends=(
    'glibc'
  )
  optdepends=(
    'linux-aarch64-flippy: kernel that has the openvfd module built in tree'
    'openvfd-dkms: dynamically built openvfd module'
  )
  backup=(
    'etc/conf.d/openvfd'
  )
  local _conf
  for _conf in "${_confs[@]}"; do
    # No need to all those comment lines
    grep -v '^#' "${srcdir}/${_conf}.conf" | 
      grep -v '^$' |
      install -DTm 644 '/dev/stdin' "${pkgdir}/usr/share/${pkgbase}/${_conf}.conf"
  done
  install -DTm 755 "${srcdir}/${_srcname}/OpenVFDService" "${pkgdir}/usr/bin/openvfd-service"
  install -DTm 755 "${srcdir}/openvfd-probe.sh" "${pkgdir}/usr/bin/openvfd-probe"
  install -DTm 644 "${srcdir}/openvfd.service" "${pkgdir}/usr/lib/systemd/system/openvfd.service"
  install -DTm 644 "${srcdir}/openvfd.conf" "${pkgdir}/etc/conf.d/openvfd"
}