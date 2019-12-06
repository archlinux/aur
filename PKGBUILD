# Maintainer: Laszlo Papp <lpapp@kde.org>
# Contributor: Alexander Blinne <alexander@blinne.net>

_pkgname=8188eu
pkgname="${_pkgname}-dkms-git"
_pkgver=1.0
pkgver=1.0.ab19e22
pkgrel=2
pkgdesc='Standalone driver for Realtek RTL8188EUS (RTL8188EUS, RTL8188ETV) WLAN'
arch=('any')
url="https://github.com/lwfinger/rtl8188eu"
license=('GPL')
depends=('dkms')
_branch="v5.2.2.4"
source=("${_pkgname}::git+${url}#branch=${_branch}"
        blacklist-r8188eu.conf)
sha256sums=('SKIP'
            'edaeafe28410017fabb742d6ccdf060a945150fb56e41084adb7b9dd66739e2b')
conflicts=('8188eu-dkms' 'rtl8188eu-dkms' 'rtl8188eu-dkms-git' 'rtl8188eu-git')

pkgver() {
  cd "${_pkgname}"

  echo $(echo ${_pkgver}. && git rev-parse --short HEAD) | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/;s/ //g'
}


prepare() {
  cd "${_pkgname}"

  local i; for i in "${source[@]}"; do
    case $i in
      *.patch)
        msg2 "Applying patch ${i}"
        patch -p1 -i "${srcdir}/${i}"
    esac
  done

  # Disable power saving
  sed -i 's/^CONFIG_POWER_SAVING \= y/CONFIG_POWER_SAVING = n/' Makefile
}

build() {
  cd "${_pkgname}"

  # Set name and version for dkms.conf
  sed -e "s/PACKAGE_NAME=\"8188eu\"/PACKAGE_NAME=${_pkgname}/" \
      -e "s/PACKAGE_VERSION=\"1.0\"/PACKAGE_VERSION=${pkgver}/" \
      -i dkms.conf
}


package() {
  cd "${srcdir}"

  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  # Blacklist r8188eu
  install -Dm644 blacklist-r8188eu.conf "${pkgdir}/etc/modprobe.d/r8188eu.conf"

  # Copy sources
  cd "${_pkgname}"

  for d in $(find . -type d); do
    install -dm755 "${install_dir}/$d"
  done

  for f in $(find . -type f); do
    install -m644 "$f" "${install_dir}/$f"
  done
}
