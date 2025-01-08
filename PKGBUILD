# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: James Duley <jagduley gmail>

_Name="LibrePilot"
pkgname="${_Name,,}"
_commit_rel="3cb6e4e8ba7961d0fb62b2a27fb0dd5ef929ce8d" # 16.09
_commit="35e84b704d2ef7656c7f7ebfcedb67b167788eac" # r902
pkgver="16.09+r902+g${_commit::7}"
pkgrel=1
pkgdesc="A ground control station and firmware for UAV flight controllers"
arch=('x86_64' 'i686')
url="https://www.librepilot.org"
_url="https://bitbucket.org/${pkgname}/${pkgname}"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'libusb' 'openscenegraph>=3.2' 'osgearth>=2.7'
         'qt5-base>=5.5' 'qt5-declarative' 'qt5-multimedia' 'qt5-serialport'
         'qt5-svg' 'qt5-xmlpatterns' 'qt6-declarative' 'sdl' 'systemd-libs') # 'qt5-quick1'
makedepends=('python2' 'qt5-script' 'qt5-tools')
_pkgsrc="${pkgname}-${pkgname}-${_commit::12}"
source=("${_pkgsrc}.tar.gz::${_url}/get/${_commit}.tar.gz"
        "${pkgname}_respect_build_flags.patch"
        "${pkgname}_osgearth_capabilities.patch")
        # https://download.librepilot.org/firmware/LibrePilot-15.09_firmware.tar.gz")
b2sums=('da3de0f6119eeebab745557f8b8ad49dc04b627cdaa254a4c36bee09348c21f04286090a61999f0ab981520579b947b0062da95876acab7fb76cb44e89f6d18b'
        'a9857293bd05c22820d6f27cafd4264a0ce7e881f7a07b9c04a1d31cbc910af214598ab0a0896df4dcba28596d651326317d87aacb0bfc7bf16b311967e4892f'
        '3b3bc5908b2a08840d692035069b481271ca4d9ab6074d6a090e92d43c788af0dc256f04438d9a9e0f2800680afeb69c4aedb7561a40c2ad7e4444b2fa1182ce')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_respect_build_flags.patch"
  patch -Np1 --binary -i "${srcdir}/${pkgname}_osgearth_capabilities.patch"

  find . \( -name '*.pro' -o -name '*.pri' \) -exec \
    sed -e 's/CONFIG += c++11/CONFIG += c++17/g' \
        -e 's/QMAKE_CXXFLAGS +=/QMAKE_CXXFLAGS += -std=c++17/g' \
        -i {} +
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make \
    prefix=/usr \
    udevrulesdir=/usr/lib/udev/rules.d \
    config_new # \
    # WITH_PREBUILT_FW="${srcdir}/firmware" \
    # V=1 # verbose
  # make fw_resource
  make gcs
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" enable-udev-rules=yes install

  install -vDm644 "CREDITS.txt"    "${pkgdir}/usr/share/doc/${_pkgname}/CREDITS.txt"
  install -vDm644 "MILESTONES.txt" "${pkgdir}/usr/share/doc/${_pkgname}/MILESTONES.txt"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "WHATSNEW.txt"   "${pkgdir}/usr/share/doc/${_pkgname}/WHATSNEW.txt"
  install -vDm644 "GPLv3.txt"      "${pkgdir}/usr/share/licenses/${_pkgname}/GPLv3.txt"
  install -vDm644 "LICENSE.txt"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
