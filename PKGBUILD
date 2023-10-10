# Maintainer: Davide Gerhard <rainbow@irh.it>
# Contributor: Joshua Rubin <me at jawa dot dev>

pkgname=pihpsdr-git
_pkgname=pihpsdr
pkgver=r1875.88e751c
pkgrel=1
pkgdesc='SDR software for HPSDR radios like Anan and Hermes Lite 2'
arch=('x86_64' 'aarch64')
# we use this insted of g0orx because it contains
# a lot of fixes and it is currently developed
url='https://github.com/dl1ycf/pihpsdr'
license=('GPL2')
depends=('wdsp-dl1ycf-git' 'fftw' 'libpulse' 'gtk3' 'soapysdr' 'alsa-lib')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+https://github.com/dl1ycf/${_pkgname}"
  "fix_icon.patch"
  "desktop_file.patch"
  "use_config.patch"
)
sha512sums=('SKIP'
            '4a0d877e98e0b5baedbab79b87ef85b5f76b6d04c6d8262f2d647567b51c76865b692846901d52398ff77caa53b92fb59ac7111730ee43561b4acaaf459bf2a6'
            'ea09a0de3fc5fcc684f06273790720ca4087127cf633511c596ed44dc8f1c35330f393a98da59e90d6834b33888b92966f25b051bcb3d0716d4e7d832de52cb4'
            '079c73656f5be69edd92e6fec02c0bb9beb15ea973aa181ecaa2250b7a2a5a5e8056b3d54bc86b506561f0e52134b2d48d7387df622065be446197b4575515b2')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  patch --directory="$_pkgname" --forward --strip=1 --input="${srcdir}/fix_icon.patch"
  patch --directory="$_pkgname" --forward --strip=1 --input="${srcdir}/desktop_file.patch"
  patch --directory="$_pkgname" --forward --strip=1 --input="${srcdir}/use_config.patch"
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
  install -D "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}.bin"
  install -D release/pihpsdr/hpsdr.png -m 0644 "${pkgdir}/usr/share/pihpsdr/hpsdr.png"
  install -D release/pihpsdr/hpsdr_icon.png -m 0644 "${pkgdir}/usr/share/pihpsdr/hpsdr_icon.png"
  install -m 0644 -D pihpsdr.desktop "${pkgdir}/usr/share/applications/pihpsdr.desktop"
  install -m 0755 -D pihpsdr_config.bin "${pkgdir}/usr/bin/${_pkgname}"
}
