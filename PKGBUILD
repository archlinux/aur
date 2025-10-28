# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Odin"
_basename="${_Name,,}"
pkgname="${_basename}-build"
pkgver=1.17.13
pkgrel=2
pkgdesc="Build system that provides a simpler, more powerful, more efficient, and more reliable replacement for Make"
arch=('x86_64')
url="https://sourceforge.net/projects/odin-build/"
license=('GPL-1.0-or-later')
depends=(
  'glibc'
  'sh'
)
_pkgsrc="${_basename}-${pkgver}"
source=("${pkgname}-${pkgver}.tar.bz2::https://sourceforge.net/projects/odin-build/files/Odin%20${pkgver}/${_pkgsrc}.tar.bz2/download")
md5sums=('b8cf64a17b528cbaa653d56bfd4c2414')
sha1sums=('ea5c125c79752c5f603276253da76f5f8ff28d30')
b2sums=('2ec30f7287818d9b84c2fcbd4a0907b1afeb21a76cc946e5856e9a2287627358dd290b82714c8475d9e4661af7d938ead9cde16398ee9940d4aa19985f1554a2')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  find . -type f -exec \
    sed -e 's|/usr/local|/usr|g' \
        -e "s|lib/${_Name}|lib/${pkgname}|g" \
        -i "{}" +
}

build() {
  local configure_options=(
    --prefix='/usr'
  )

  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  # make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr"
  ./INSTALL "${pkgdir}/usr"

  cd "${pkgdir}/usr"
  install -vDm644 "man/man1/${_basename}.1" "share/man/man1/${pkgname}.1"
  rm -rf "man"

  cd "bin"
  sed -i "s|${pkgdir}||g" "${_basename}"
  mv -v "${_basename}" "${pkgname}"
}