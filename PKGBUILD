# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: ugla <ugla at u8 dot is>

pkgname="passphrase"
pkgver=2.1
pkgrel=1
pkgdesc="Small, simple passphrase generator"
arch=('x86_64')
url="https://git.sr.ht/~alva/${pkgname}"
license=('MIT')
# depends=('glibc')
makedepends=('zig>=0.13' 'zig<0.14')
_zig_deps=(
  # passphrase
  # "zig-clap-560c8dd72ab25d556123846254040c5bf9ad3ba4.tar.gz::https://github.com/Hejsil/zig-clap/archive/560c8dd72ab25d556123846254040c5bf9ad3ba4.tar.gz"
  "zig-clap-0.9.1.tar.gz::https://github.com/Hejsil/zig-clap/archive/refs/tags/0.9.1.tar.gz"
  "zig-zg-0a9c8f1418ecd54ffaabf4b5256e2d77502700ba.tar.gz::https://codeberg.org/dude_the_builder/zg/archive/0a9c8f1418ecd54ffaabf4b5256e2d77502700ba.tar.gz"
)
noextract=("${_zig_deps[@]%%::*}")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${_zig_deps[@]}"
        "${pkgname}_zig-clap091.patch")
b2sums=('a01e346b040be6c62d945adfa95283dd8f69c5ef5f9d593488b1de0b1f01c159e424de261b3460547ce655d433a42cdfc00f04850931a4b9c39bcab5620f693d'
        '685208b8cb08070304c44c8a1a294d53e7eb4045585a65d5ea3297c1d50157ec8cec06c1b21e3476e3cea0518945bc77b1cf4fe349f11ddcf9aa80dbfbd87788'
        '36c8e689c78e95aa5025d09c7baf9f83248fade597bd602d623f0ea9739e5db470fcbd35e0517b7119bae8dfbb023310264c6f280ec5633930f62577656e10f0'
        '68f7ff32ff81113c8376f5aa4326125c8052154a9fa6a95c7bfb065695e58f9beb2a5badb7a9d3377115a67804b473d460b72ac540cd6f29484705f338c64547')

_srcenv() {
  export FAKEZIG_CACHE_DIR="${srcdir}"
}

prepare() {
  _srcenv

  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_zig-clap091.patch"

  cd "${srcdir}"
  for dep in "${_zig_deps[@]}"; do
    zig fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
  done
}

build() {
  _srcenv

  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.1-gnu.2.39
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    -Dpie
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build "${zig_options[@]}"
  DESTDIR="build" zig build doc "${zig_options[@]}"
}

check() {
  _srcenv

  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.1-gnu.2.39
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    -Dpie
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -va build/* "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
