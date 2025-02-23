# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="LibrePilot"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
_commit_rel="3cb6e4e8ba7961d0fb62b2a27fb0dd5ef929ce8d" # 16.09
_commit="8c101adcccabc57ecbfe5be9250344448bee7908" # r782
pkgver="16.09+r782+g${_commit::7}"
pkgrel=2
pkgdesc="A ground control station and firmware for UAV flight controllers"
arch=('i686' 'x86_64')
url="https://www.librepilot.org"
_url="https://bitbucket.org/${_pkgname}/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'libusb'  'qt5-base' 'qt5-declarative'
         'qt5-multimedia' 'qt5-serialport' 'qt5-svg' 'qt5-xmlpatterns'
         'qt6-declarative' 'sdl' 'systemd-libs') # 'openscenegraph' 'osgearth' 'qt5-quick1'
# makedepends=('patchelf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}-rpm")
options=('!strip')
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,i686}".deb")
source=("${_pkgsrc}-CREDITS.txt::${_url}/raw/${_commit}/CREDITS.txt"
        "${_pkgsrc}-GPLv3.txt::${_url}/raw/${_commit}/GPLv3.txt"
        "${_pkgsrc}-LICENSE.txt::${_url}/raw/${_commit}/LICENSE.txt"
        "${_pkgsrc}-MILESTONES.txt::${_url}/raw/${_commit}/MILESTONES.txt"
        "${_pkgsrc}-README.md::${_url}/raw/${_commit}/README.md"
        "${_pkgsrc}-WHATSNEW.txt::${_url}/raw/${_commit}/WHATSNEW.txt")
source_i686=("${_pkgsrc}-i686.deb::https://ppa.launchpadcontent.net/${_pkgname}/next/ubuntu/pool/main/${_pkgname::4}/${_pkgname}/${_pkgname}_${pkgver//+g/'~g'}-0bionic1_i386.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://ppa.launchpadcontent.net/${_pkgname}/next/ubuntu/pool/main/${_pkgname::4}/${_pkgname}/${_pkgname}_${pkgver//+g/'~g'}-0bionic1_amd64.deb")
b2sums=('19501a2b7a4152ce33f9f7367a37efb29d4fcb203b671dda72e9344fb59dd136f8a6e5334c982ec9c5948b39840edcc835b45aae2c2d742377432c2ec8ef0cbb'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c'
        '082b4372cad0a65a7f75d828061ac8902bec800eae3efbb3b900fc4c96f16bfdbfc1590b5526670d360747f6c13ff56382cd008348f1ce4d1238dd6274bb0d13'
        'b34d76177d46ecf22c8cd3f5da1cccc01353f880145039448dd4123896518b09eae3f05096fd57f812280a24561ee1689ba9959102761029b312bc5e4ec2e211'
        'a36637e6a9ac17b6ac3d12c063a09ba36a2dea8c2edc1b941c01e2ca24eca348aa78b6b5442796c67b05885f3dc9f5bdc70d7a767d1cb330b6dc3320ab5ac074'
        '15cd901c8a7cb7bdd2386c28094695ecaebdec249bad4ad7e455de3e496f3d86622df4b2484bc2607830f33b547e36221e5c758cf83468a71965b504d122d8ac')
b2sums_i686=('7ea8dbc1063dfcbe4241a75d8f960eee1e73234cd8272d5a42321bde51e9b7110f506370cf7c6b4d4232ede7feb8e78e65c16c241ae0caab1ae36b634d6bfdbf')
b2sums_x86_64=('afbeeb358d1b0ec6a04ba5af6bc676e28e3551c64e602a78e197c2fae50d2db30fb1733cba0920f1c96b81317109938851804f17f25fc9aff12e6498340549df')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find "lib" -type f -exec install -D "{}" "usr/{}" \;
  rm -rf "lib"
  
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}"
  rm -f ./*Debian* copyright INSTALL

  # cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/lib/${_pkgname}-gcs"
  # find . -type f \( -name 'libGCSOsgEarth.so.1.0.0' -o -name 'libPfdQml.so' \) \
  #    -exec patchelf --replace-needed "libOpenThreads.so.20" "libOpenThreads.so" {} \; \
  #    -exec patchelf --replace-needed "libosg.so.131"        "libosg.so" {} \; \
  #    -exec patchelf --replace-needed "libosgDB.so.131"      "libosgDB.so" {} \; \
  #    -exec patchelf --replace-needed "libosgEarth.so.5"     "libosgEarth.so" {} \; \
  #    -exec patchelf --replace-needed "libosgEarthUtil.so.5" "libosgEarthUtil.so" {} \; \
  #    -exec patchelf --replace-needed "libosgGA.so.131"      "libosgGA.so" {} \; \
  #    -exec patchelf --replace-needed "libosgText.so.131"    "libosgText.so" {} \; \
  #    -exec patchelf --replace-needed "libosgUtil.so.131"    "libosgUtil.so" {} \; \
  #    -exec patchelf --replace-needed "libosgViewer.so.131"  "libosgViewer.so" {} \;
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm644 "${_pkgsrc}-CREDITS.txt"    "${pkgdir}/usr/share/doc/${_pkgname}/CREDITS.txt"
  install -vDm644 "${_pkgsrc}-MILESTONES.txt" "${pkgdir}/usr/share/doc/${_pkgname}/MILESTONES.txt"
  install -vDm644 "${_pkgsrc}-README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-WHATSNEW.txt"   "${pkgdir}/usr/share/doc/${_pkgname}/WHATSNEW.txt"
  install -vDm644 "${_pkgsrc}-GPLv3.txt"      "${pkgdir}/usr/share/licenses/${_pkgname}/GPLv3.txt"
  install -vDm644 "${_pkgsrc}-LICENSE.txt"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
