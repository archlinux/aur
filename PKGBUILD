# Maintainer: envolution
# Contributor: Jef Roosens
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=vlang
pkgname=vlang-bin
pkgver=0.4.12
pkgrel=1
pkgdesc='Simple compiled language for developing maintainable software (binary release)'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
conflicts=('vlang')
provides=('vlang')
depends=('glibc')
options=(!strip)
makedepends=('libx11' 'git')
optdepends=('glfw: Needed for graphics support'
  'freetype2: Needed for graphics support'
  'glfw: Graphics support'
  'openssl: Needed for http support')
source=("${_pkgname}-${pkgver}.zip::https://github.com/vlang/v/releases/download/${pkgver}/v_linux.zip")
sha256sums=('9d32751ec36b89b9f8107d8e7e3affd148e54934d169712123def3ed134ddced')

build() {
  cd v
  LDFLAGS="-Wl,--as-needed -Wl,-z,relro -Wl,-z,now" \
    PATH="$PWD:$PATH" \
    v build-tools #strip off some optimizations that tcc may not support
}

package() {
  cd v
  install -d "${pkgdir}/usr/lib/vlang" \
		"${pkgdir}/usr/share/licenses/${pkgname}" \
		"${pkgdir}/usr/share/doc/${pkgname}" \
		"${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/vlang/cmd/tools"

  install -Dm755 v "${pkgdir}/usr/lib/vlang/v"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  docs=(CHANGELOG.md README.md ROADMAP.md TESTS.md)
  for doc in "${docs[@]}"; do
    [[ -f $doc ]] && install -m644 "$doc" "${pkgdir}/usr/share/doc/${pkgname}/$doc"
  done

  for dir in cmd thirdparty vlib; do
    cp -a "$dir" "${pkgdir}/usr/lib/vlang/"
  done

  cp -a examples "${pkgdir}/usr/share/vlang/"
  install -Dm644 v.mod "${pkgdir}/usr/lib/vlang/v.mod"

  ln -s /usr/lib/vlang/v "${pkgdir}/usr/bin/v"

  touch "${pkgdir}/usr/lib/vlang/cmd/tools/.disable_autorecompilation"
}

# vim:set ts=2 sw=2 et:
