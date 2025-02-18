# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>
# Contributor: twa022 <twa022 at gmail dot com>

_name="icu"
_major=55
pkgname="${_name}${_major}"
pkgver="${_major}.2"
pkgrel=4
pkgdesc="International Components for Unicode library (legacy version ${_major})"
arch=('i686' 'x86_64')
url="https://icu.unicode.org"
_url="https://github.com/unicode-org/${_name}"
license=('BSD-2-Clause' 'BSD-3-Clause' 'LicenseRef-Unicode-3.0')
depends=('gcc-libs' 'glibc' 'sh')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz"
        "${_pkgsrc}.tar.gz.asc::${_url}/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz.asc")
sha512sums=('4f4ee742a1f4a320ef01c3a61907002fca687bf2a8516acd2d4d3670ae289208b81f3fc0daeadf684f868bf0840be54e7eda5be55b3f9e0cb83262759d9f6f69'
            'SKIP')
validpgpkeys=('9731166CD8E23A83BEE7C6D3ACA5DBE1FD8FABF1') # Steven R. Loomis (ICU Project) <srl@icu-project.org>

build() {
  export CC="gcc"
  export CXX="g++"

  cd "${srcdir}/${_name}/source"
  ./configure \
    --prefix='/usr' \
    --libexecdir="/usr/lib/${pkgname}" \
    --sysconfdir='/etc' \
    --mandir='/usr/share/man' \
    --sbindir='/usr/bin' # \
    # --enable-tools=no
  make
}

check() {
  cd "${srcdir}/${_name}/source"
  make check
}

package() {
  cd "${srcdir}/${_name}/source"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "sbin" "share/man"

  cd "${pkgdir}/usr/include"
  for file in *; do
    mv "${file}" "${file}-${_major}"
  done
  find . -type f -exec \
    sed -e "s|layout/|layout-${_major}/|g" \
        -e "s|unicode/|unicode-${_major}/|g" \
        -i "{}" +

  cd "${pkgdir}/usr/lib"
  for file in *.so; do
    mv "${file}" "${file%.so}${_major}.so"
  done
  find "${_name}" -mindepth 1 -maxdepth 1 ! -name "${pkgver}" -exec \
    rm -rf "{}" +

  cd "pkgconfig"
  for file in "${_name}-"*.pc; do
      mv "${file}" "${file//${_name}-/${_name}${_major}-}"
  done
  find . -type f -name "${_name}${_major}-*.pc" -exec \
    sed -E -e "s/${_name}-/${_name}${_major}-/g" \
           -e 's/(-licu)([^ ]*)( |$)/\1\2'"${_major}"'\3/g' \
           -i "{}" +
}
