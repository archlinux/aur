# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="pigami"
pkgname="${_pkgname}-bin"
pkgver=30
_commit="cf8b986741504506764da2185eaff93bc15102da" # 30
pkgrel=3
pkgdesc="Roll a rectangular cube and reach the finish without falling! Platform/puzzle game."
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'x86_64'
)
url="https://arthursonzogni.com/en/Pigami/"
_url="https://github.com/ArthurSonzogni/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'libglvnd'
  'libstdc++'
  'libx11'
)
makedepends=(
  'squashfs-tools'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/${_commit}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/${_commit}/LICENSE"
)
# https://askubuntu.com/a/1196449
source_aarch64=(
  "https://api.snapcraft.io/api/v1/snaps/download/PTHyNliL7fpWlPZvayBEynVfWdBzYUuB_545.snap"
)
source_armv7h=(
  "https://api.snapcraft.io/api/v1/snaps/download/PTHyNliL7fpWlPZvayBEynVfWdBzYUuB_547.snap"
)
source_i686=(
  "https://api.snapcraft.io/api/v1/snaps/download/PTHyNliL7fpWlPZvayBEynVfWdBzYUuB_541.snap"
)
source_powerpc64le=(
  "https://api.snapcraft.io/api/v1/snaps/download/PTHyNliL7fpWlPZvayBEynVfWdBzYUuB_546.snap"
)
source_x86_64=(
  "https://api.snapcraft.io/api/v1/snaps/download/PTHyNliL7fpWlPZvayBEynVfWdBzYUuB_544.snap"
)
b2sums=('10bc6ccc1813858951e758159c5f2da70085ca7b4a580a1ae4d524869de713adb365dc5d362679dd8d9ed4576d7421c87247a7bd41da8aeb7ae06e2e69cd0c90'
        '0a9aa4eab3e6f902305669987b6fbc5142e71f522aa10b5ff5a3896ed9cdc8541e396e0224a6313b90096743f9696b3d16887b619962c088780884137ae2e496')
b2sums_aarch64=('f7a37492c220c646ebf43cd93390a919405c66eeca408c6cf802ae5504c17677e696ed57e0893049ca1facd6f3c37f85a06272ab08cb8f13f6a16b35cd8f9da0')
b2sums_armv7h=('9cfb27dbecd260499de87b12bfc83156784bbb0fb0188dd2f76d8fb70729daf922aef7f3704bebf67673258d347cd0f5ddfbcea43c64706ee4b272161e854770')
b2sums_i686=('7e17bbcb39a6b5aa954297fb17b155176e783b64fe2d5deeed6e551a6de53579635e5692935d1361443839c5eea26444c09ef05c390ad041125da5c01d5b8554')
b2sums_powerpc64le=('beb14f98a4b00592122b8e649997155cf5288202ee11d05d3b3140f9d0fb332bade4147d71792159b5a73757ab6144ab6a8e6c382a0f11c0e166b2707c79883c')
b2sums_x86_64=('1ee5d53e7e4fbe738ad5834e8a2b3feb37e97d1366a56f59df7297769df30ada54cfdbdcceab5387131aae29ea0d28f0b618251d761fd0d574b82fecf25bf0e4')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${source_artifact%.snap}" "${source_artifact}"

  cd "${source_artifact%.snap}/meta/gui"
  sed -e "s|^Icon=.*|Icon=${_pkgname}|g" \
      -i "${_pkgname}.desktop"
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  
  cd "${srcdir}/${source_artifact%.snap}"
  install -vDm755 "usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cp -va --parents --no-preserve=ownership "usr/share/${_pkgname}" -t "${pkgdir}"

  cd "meta/gui"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -vDm644 "${_pkgname}.png"     "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
