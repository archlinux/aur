# Maintainer: envolution
# Contributor: Jef Roosens
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=vlang
pkgname=vlang-bin
pkgver=0.4.10
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
sha256sums=('53d7e1a4e3d1a23602d6205c9288967229c1782183bf27dbee41870e5b3071b6')

#build() {
#  cd v
#  PATH="$PWD:$PATH" exec v build-tools #(included in precompiled release)
#}

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
