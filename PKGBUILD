# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Arpan Kapoor <a at arpankapoor dot com> for 8188eu-dkms
# Contributor: Runnytu < runnytu at gmail dot com > for 8192cu-dkms

_pkgname=8188fu
pkgname="${_pkgname}-dkms"
pkgver=r6.c601e5f
pkgrel=1
pkgdesc='Driver for Realtek RTL8188FU USB wireless adapter'
arch=('any')
url='http://www.realtek.com.tw/'
license=('GPL3')
depends=('dkms')
makedepends=('git')
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}::git+https://github.com/corneal64/Realtek-USB-Wireless-Adapter-Drivers.git"
        blacklist-r8188fu.conf
        dkms.conf)
sha256sums=('SKIP'
            '48bc8d2270ea8db1e5c0be51012419753b22a106028e153919b37d583c422cc6'
            'e2b146ffbe6b81c6a8c963ee2826aecc3a092497fd9b33c6290751da5706d103')

prepare() {
  cd "${_pkgname}-${pkgver}/rtl${_pkgname}"

  # Disable power saving (possibly already done below?)
  sed -i 's/^CONFIG_POWER_SAVING \= y/CONFIG_POWER_SAVING = n/' Makefile
}

package() {
  cd "${srcdir}"

  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  # Copy dkms.conf
  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  # Blacklist r8188fu
  install -Dm644 blacklist-r8188fu.conf "${pkgdir}/etc/modprobe.d/r8188fu.conf"

  # Set name and version
  sed -e "s/@_PKGNAME@/${_pkgname}/" -e "s/@PKGVER@/${pkgver}/" -i "${install_dir}/dkms.conf"

  # Copy sources
  cd "${_pkgname}-${pkgver}/rtl${_pkgname}"

  for d in $(find . -type d); do
    install -dm755 "${install_dir}/$d"
  done

  for f in $(find . -type f ! -name '.gitignore'); do
    install -m644 "$f" "${install_dir}/$f"
  done

  mkdir -p "${pkgdir}/etc/modprobe.d/"
  echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" > "${pkgdir}/etc/modprobe.d/rtl8188fu.conf"
}
