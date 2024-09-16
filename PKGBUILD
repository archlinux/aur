# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="linux-wifi-hotspot"
pkgname="${_pkgname}-bin"
pkgver=4.7.2
pkgrel=1
pkgdesc="Feature-rich wifi hotspot creator"
arch=('x86_64')
url="https://github.com/lakinduakash/${_pkgname}"
license=('BSD-2-Clause')
depends=('bash' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'hostapd' 'iproute2' 'iw' 'libpng' 'libx11' 'procps-ng' 'qrencode')
optdepends=("dnsmasq: for 'NATed' or 'None' Internet sharing method"
            "iptables: for 'NATed' or 'None' Internet sharing method"
            'haveged: for random MAC generation'
            'wireless_tools: if iw cannot recognize your adapter')
provides=("${_pkgname}" 'wihotspot' 'create_ap')
conflicts=("${_pkgname}" 'wihotspot' 'create_ap')
backup=('etc/create_ap.conf')
install="${_pkgname}.install"
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.deb")
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
        "${_pkgname}.install")
source_x86_64=("${_pkgsrc}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
b2sums=('04ee85002030378b57f7e0dddc16ed1ad546513fee5a6c8754b4e879e45dd3350083ced3fef268667463f05029280655f2e9ee0ee224ed046fef97eb407e52f4'
        '2864aeda3055806c3008e6d13452edf1f3b3b4fa0bca1477f0137a49899ef4cc0798b2f2385a2f2ba7e1d52363fd9ea0437088d845b8c775740e6ade858244de'
        '16735074de7791a88f3306cae5fe2da1f29dfb755123de2787d61031adccef6b50e791cf7adb85736db23bc0e981f33daced1910f3efca288cefde302b4f0512')
b2sums_x86_64=('490b99dffd08f70f8405cae6426ba32f589fa529b2ec191f0f34596902a505f601c547ecc8f946f24b587c3b7b83a5fbff054410c92d4458e4ead3d6a8f36e1d')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find "usr/bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/{}" \;
  find "usr/share" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
  find "etc"       -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;

  rm -rf "${pkgdir}/usr/share/doc/${_pkgname}"

  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
