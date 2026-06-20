# Maintainer: Davide Gerhard <rainbow@irh.it>
# Contributor: Joshua Rubin <me at jawa dot dev>

pkgname=pihpsdr-git
_pkgname=pihpsdr
pkgver=r2836.8a2268c
pkgrel=1
pkgdesc='SDR software for HPSDR radios like Anan and Hermes Lite 2'
arch=('x86_64' 'aarch64')
url='https://github.com/dl1ycf/pihpsdr'
license=('GPL2')
# we use the internal 'libspecbleach'
# since pihpsdr requires the git version and I don't want
# to maintain it in aur
depends=('fftw' 'libpulse' 'gtk3' 'soapysdr' 'alsa-lib' 'rnnoise' 'libwebsockets')
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
            '51ade79cec6a98f568714612c2f5b7216986f03a9a75910daa486c9d4ff9180d2d5a88042f9e7798843fd7dde9f5342880f0ee1b6338667a72e2f35f6146aaea')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  patch --directory="$_pkgname" --forward --strip=1 --input="${srcdir}/desktop_file.patch"
}

build() {
  cd "$_pkgname"
  export CFLAGS="${CFLAGS} -D_GNU_SOURCE -march=native -O3"
  make \
    GPIO= \
    MIDI=ON \
    SATURN=ON \
    SOAPYSDR=ON \
    USBOZY=OFF \
    STEMLAB=ON \
    AUDIO=PULSE \
    NR34LIB=OFF \
    PORTFORWARD=OFF
}

package() {
  cd "$_pkgname"
  install -D "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -D release/pihpsdr/hpsdr.png -m 0644 "${pkgdir}/usr/share/pihpsdr/hpsdr.png"
  install -D release/pihpsdr/piHPSDR_logo.png -m 0644 "${pkgdir}/usr/share/pihpsdr/piHPSDR_logo.png"
  install -m 0644 -D pihpsdr.desktop "${pkgdir}/usr/share/applications/pihpsdr.desktop"
  install -m 0644 -D "${srcdir}/piHPSDR-Manual.pdf" "${pkgdir}/usr/share/doc/pihpsdr/manual.pdf"
}
