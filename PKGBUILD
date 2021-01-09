# Maintainer: Arpan Kapoor <a at arpankapoor dot com>

_pkgname=8188eu
pkgname="${_pkgname}-dkms"
pkgver=v4.3.0.8_13968
pkgrel=15
pkgdesc='Driver for Realtek RTL8188EUS (RTL8188EUS, RTL8188ETV) WLAN'
arch=('any')
url='http://www.realtek.com.tw/'
license=('GPL')
depends=('dkms')
install="${pkgname}.install"
source=("https://www.dropbox.com/s/afs5d2yfgwurqm2/${_pkgname}-${pkgver}.tar.xz?dl=1"
        blacklist-r8188eu.conf
        date_time_macro.patch
        dkms.conf
        led.patch
        linux-4.0.patch
        linux-4.2.patch
        linux-4.3.patch
        linux-4.6.patch
        linux-4.11.patch
        linux-4.15.patch
        linux-4.19.patch
        linux-5.0.patch
        linux-5.1.patch
        linux-5.2.patch
        linux-5.6.patch
        linux-5.8.patch
        linux-5.10.patch
        no_debug.patch)
md5sums=('ca8736349079bc2bfedfb862d04a08bb'
         '8af5df9ed717b3bb48df59dac0c8a9c8'
         '699a2e12d0d9c7272612fe32a7c10810'
         'd973b02dadacb783eacdc1d715843de7'
         '26316154e211046f6f711efa2848281f'
         '2e3d4ac7b1b856f7d835731b5e5ebafc'
         'a0286c3541676f1f43cd02d5e1056bdd'
         '6015156964800281cbe4b580e427a117'
         'a7d7c79bb1a2a1905a4c1b4c184eed77'
         'af75f63a39d075f3e00edf34be5de708'
         'd7166ea97454fed40b2a7d5c6b3695b8'
         'b50c4d78fb03ab6af99f45d04b1890fd'
         'a540f87d5f8b08c732d594760696a97f'
         '4730b05761b7bc9b3e970a088fc81c8f'
         '0f23196d2f3be2aff32393c698c10d7a'
         'd3d112aec7a0cdccc7161ba1d66b8475'
         '96d4403315c7af254d2be5706b726317'
         '8906dbc463e885aa6aa95679e5c5f659'
         '0b14ee4517f78ada4d471654afd82b79')

prepare() {
  cd "${_pkgname}-${pkgver}"
  local i;for i in "${source[@]}";do
    case $i in
      *.patch)
        echo "Applying patch ${i}"
        patch -p1 -i "${srcdir}/${i}"
    esac
  done
  # Disable power saving
  sed -i 's/^CONFIG_POWER_SAVING \= y/CONFIG_POWER_SAVING = n/' Makefile
}

package() {
  cd "${srcdir}"
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  # Copy dkms.conf
  install -Dm644 dkms.conf "${install_dir}/dkms.conf"
  # Blacklist r8188eu
  install -Dm644 blacklist-r8188eu.conf "${pkgdir}/etc/modprobe.d/r8188eu.conf"
  # Set name and version
  sed -e "s/@_PKGNAME@/${_pkgname}/" -e "s/@PKGVER@/${pkgver}/" -i "${install_dir}/dkms.conf"
  # Copy sources
  cd "${_pkgname}-${pkgver}"
  for d in $(find . -type d);do install -dm755 "${install_dir}/$d";done
  for f in $(find . -type f);do install -m644 "$f" "${install_dir}/$f";done
}
