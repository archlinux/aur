# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="vbisam"
pkgver=2.0
pkgrel=1
pkgdesc="ISAM file handler compatible with the leading commercial ISAM"
arch=(
  'i686'
  'x86_64'
)
url="https://sourceforge.net/projects/vbisam/"
license=(
  # 'GPL-2.0-or-later'
  'LGPL-2.1-or-later'
)
depends=(
  'glibc'
)
provides=(
  "lib${pkgname}.so"
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "https://downloads.sourceforge.net/vbisam/files/${_pkgsrc}.tar.gz"
)
md5sums=('49a06507793007d9bb40d203f8a22f02')
sha1sums=('e5e4e565991ca3172af7424f6e3c271723f873f8')
b2sums=('db9f658ef7864dd0eac2a93ba88b1b838591b07f063906617264d008ad5cdf57e67dc3bf5e000489ec35cb139df679e96f702a974bde0fb82af9d9e5cf704770')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # https://github.com/rpmsphere/spec/blob/master/v/vbisam.spec
  sed -i '/extern int/s/vbisam_off_t/off_t/' vbisam.h
  sed -i '206s/short MISALIGNED/int MISALIGNED/' libvbisam/isinternal.h
  sed -i '685s/LONG_MAX : LONG_MIN/INT_MAX : INT_MIN/' libvbisam/vbkeysio.c
}

build() {
  export CFLAGS+=" -Wno-error=implicit-int"
  local configure_options=(
    --prefix='/usr'
    --with-compatcisam
  )

  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "NEWS" "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING.LIB" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
