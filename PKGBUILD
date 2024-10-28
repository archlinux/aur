# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="pigami"
pkgname="${_pkgname}-bin"
pkgver=30
_commit="cf8b986741504506764da2185eaff93bc15102da"
pkgrel=2
pkgdesc="Roll a rectangular cube and reach the finish without falling! Platform/puzzle game."
arch=('x86_64' 'aarch64' 'armv7h' 'i686' 'powerpc64le' 's390x')
url="https://arthursonzogni.com/en/Pigami"
_url="https://github.com/ArthurSonzogni/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libx11')
makedepends=('squashfs-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/${_commit}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/${_commit}/LICENSE")
# https://askubuntu.com/a/1196449
source_x86_64=("${_pkgsrc}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/PTHyNliL7fpWlPZvayBEynVfWdBzYUuB_544.snap")
source_aarch64=("${_pkgsrc}-aarch64.snap::https://api.snapcraft.io/api/v1/snaps/download/PTHyNliL7fpWlPZvayBEynVfWdBzYUuB_545.snap")
source_armv7h=("${_pkgsrc}-armv7h.snap::https://api.snapcraft.io/api/v1/snaps/download/PTHyNliL7fpWlPZvayBEynVfWdBzYUuB_547.snap")
source_i686=("${_pkgsrc}-i686.snap::https://api.snapcraft.io/api/v1/snaps/download/PTHyNliL7fpWlPZvayBEynVfWdBzYUuB_541.snap")
source_powerpc64le=("${_pkgsrc}-powerpc64le.snap::https://api.snapcraft.io/api/v1/snaps/download/PTHyNliL7fpWlPZvayBEynVfWdBzYUuB_546.snap")
source_s390x=("${_pkgsrc}-s390x.snap::https://api.snapcraft.io/api/v1/snaps/download/PTHyNliL7fpWlPZvayBEynVfWdBzYUuB_548.snap")
b2sums=('10bc6ccc1813858951e758159c5f2da70085ca7b4a580a1ae4d524869de713adb365dc5d362679dd8d9ed4576d7421c87247a7bd41da8aeb7ae06e2e69cd0c90'
        '0a9aa4eab3e6f902305669987b6fbc5142e71f522aa10b5ff5a3896ed9cdc8541e396e0224a6313b90096743f9696b3d16887b619962c088780884137ae2e496')
b2sums_x86_64=('1ee5d53e7e4fbe738ad5834e8a2b3feb37e97d1366a56f59df7297769df30ada54cfdbdcceab5387131aae29ea0d28f0b618251d761fd0d574b82fecf25bf0e4')
b2sums_aarch64=('f7a37492c220c646ebf43cd93390a919405c66eeca408c6cf802ae5504c17677e696ed57e0893049ca1facd6f3c37f85a06272ab08cb8f13f6a16b35cd8f9da0')
b2sums_armv7h=('9cfb27dbecd260499de87b12bfc83156784bbb0fb0188dd2f76d8fb70729daf922aef7f3704bebf67673258d347cd0f5ddfbcea43c64706ee4b272161e854770')
b2sums_i686=('7e17bbcb39a6b5aa954297fb17b155176e783b64fe2d5deeed6e551a6de53579635e5692935d1361443839c5eea26444c09ef05c390ad041125da5c01d5b8554')
b2sums_powerpc64le=('beb14f98a4b00592122b8e649997155cf5288202ee11d05d3b3140f9d0fb332bade4147d71792159b5a73757ab6144ab6a8e6c382a0f11c0e166b2707c79883c')
b2sums_s390x=('c12c500baf2ea35f33004e779385b9bd223db78684c45a9516a60cc0940928ad20a42cb469b739a4e7315073575008b2ade04a0ffd13f0eacedb494b5186e7e4')

prepare() {
  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${_pkgsrc}-${CARCH}" "${_pkgsrc}-${CARCH}.snap"
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/meta/gui"
  sed -i 's|Icon=${SNAP}/meta/gui/pigami\.png|Icon=pigami|' "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/bin"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/meta/gui"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/60x60/apps/${_pkgname}.png"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share"
  find "${_pkgname}" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/{}" \;
}
