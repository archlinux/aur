# Maintainer: Davide Gerhard <rainbow@irh.it>
# Contributor: Joshua Rubin <me at jawa dot dev>

pkgname=pihpsdr-git
_pkgname=pihpsdr
pkgver=r2604.0a7cf16
pkgrel=1
pkgdesc='SDR software for HPSDR radios like Anan and Hermes Lite 2'
arch=('x86_64' 'aarch64')
# we use this insted of g0orx because it contains
# a lot of fixes and it is currently developed
url='https://github.com/dl1ycf/pihpsdr'
license=('GPL2')
depends=('fftw' 'libpulse' 'gtk3' 'soapysdr' 'alsa-lib')
makedepends=('git')
buildflags=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+https://github.com/dl1ycf/${_pkgname}"
  "desktop_file.patch"
  # we don't like to install the full Latex to build the manual
  "https://github.com/dl1ycf/${_pkgname}/releases/download/v2.5/piHPSDR-Manual.pdf"
)
sha512sums=('SKIP'
            '88c32a4329c92230cd31431b1cea4754cf578cc28eea134eada34dc739e0243146e1045dcd2d0f8ee94dd84bcd1ff6cd5bac79f56acfa42c41cceb1201b17a7e'
            # probably the manual is uploaded every time he does a change
            'SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  patch --directory="$_pkgname" --forward --strip=1 --input="${srcdir}/desktop_file.patch"
}

build() {
  cd "$_pkgname"
  export CFLAGS="${CFLAGS} -D_GNU_SOURCE"
  make \
    GPIO= \
    MIDI=ON \
    SATURN=ON \
    SOAPYSDR=ON \
    AUDIO=PULSE
}

package() {
  cd "$_pkgname"
  install -D "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -D release/pihpsdr/hpsdr.png -m 0644 "${pkgdir}/usr/share/pihpsdr/hpsdr.png"
  install -D release/pihpsdr/piHPSDR_logo.png -m 0644 "${pkgdir}/usr/share/pihpsdr/piHPSDR_logo.png"
  install -m 0644 -D pihpsdr.desktop "${pkgdir}/usr/share/applications/pihpsdr.desktop"
  install -m 0644 -D "${srcdir}/piHPSDR-Manual.pdf" "${pkgdir}/usr/share/doc/pihpsdr/manual.pdf"
}
