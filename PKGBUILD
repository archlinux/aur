pkgname=qfirehose
pkgrel=1
pkgver=1.4.21
_pkgname="QFirehose_Linux_and_Android_V${pkgver}"
arch=(x86_64)
options=('!strip' '!debug')
license=('proprietary')
url='https://github.com/nippynetworks/qfirehose'
description='Driver for Quectel PCI Express modems'
makedepends=(
  gcc
  git
)
source=(
  "${_pkgname}.zip::https://forums.quectel.com/uploads/default/original/3X/9/f/9fc8d3a449c9780e4a3fed262e80129e89d27ef0.zip"
)

sha256sums=('9e32fa5deba4001ee0857a0ed6a39d774700d000dd73000f03dcbee5d2f03398')

_to_filter=(
  -fstack-clash-protection
  -fstack-protector-strong
  -fstack-protector
)

_filter_flags() {
  local -n var="$1"
  local -n remove="$2"
  local filtered=()
  local flag skip

  # Split CFLAGS into words
  read -ra flags <<< "${var}"

  for flag in "${flags[@]}"; do
      skip=0
      for r in "${remove[@]}"; do
          if [[ "${flag}" == "${r}" ]]; then
              skip=1
              break
          fi
      done

      ((skip)) || filtered+=("${flag}")
  done

  var="${filtered[*]}"
}

prepare() {
  cd "${_pkgname}"
  rm -rf out
  sed -i -e 's/-Werror//g' Makefile
}

build() {
  cd "${_pkgname}"
  _filter_flags CFLAGS _to_filter
  _filter_flags CXXFLAGS _to_filter
  make
}

package() {
  cd "${_pkgname}"
  install -Dm0755 out/QFirehose "${pkgdir}/usr/bin/QFirehose"
  for i in README.md NOTICE
  do
    install -Dm0644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}/${i}"
  done
}
