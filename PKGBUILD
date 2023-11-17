# Maintainer: Davide Gerhard <rainbow@irh.it>
# Contributor: Joshua Rubin <me at jawa dot dev>

pkgname=pihpsdr-git
_pkgname=pihpsdr
pkgver=r1973.c281d71
pkgrel=1
pkgdesc='SDR software for HPSDR radios like Anan and Hermes Lite 2'
arch=('x86_64' 'aarch64')
# we use this insted of g0orx because it contains
# a lot of fixes and it is currently developed
url='https://github.com/dl1ycf/pihpsdr'
license=('GPL2')
depends=('fftw' 'libpulse' 'gtk3' 'soapysdr' 'alsa-lib')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+https://github.com/dl1ycf/${_pkgname}"
  "desktop_file.patch"
)
sha512sums=('SKIP'
            'ea09a0de3fc5fcc684f06273790720ca4087127cf633511c596ed44dc8f1c35330f393a98da59e90d6834b33888b92966f25b051bcb3d0716d4e7d832de52cb4')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  patch --directory="$_pkgname" --forward --strip=1 --input="${srcdir}/desktop_file.patch"
}

build() {
  cd "$_pkgname"
  make \
    GPIO= \
    MIDI=ON \
    SATURN= \
    SOAPYSDR=ON \
    AUDIO=PULSE
}

package() {
  cd "$_pkgname"
  install -D "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -D release/pihpsdr/hpsdr.png -m 0644 "${pkgdir}/usr/share/pihpsdr/hpsdr.png"
  install -D release/pihpsdr/hpsdr_icon.png -m 0644 "${pkgdir}/usr/share/pihpsdr/hpsdr_icon.png"
  install -m 0644 -D pihpsdr.desktop "${pkgdir}/usr/share/applications/pihpsdr.desktop"
}
