# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="bfrt"
pkgver=0.2.3
pkgrel=1
pkgdesc="To save time and traffic, re-download file's parts until they are fixed"
arch=('x86_64')
url="https://${pkgname}.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('curl' 'gcc-libs' 'glibc' 'zlib')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}.tar.bz2")
source=("${_pkgsrc}.tar.bz2::https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_v${pkgver}_src.tar.bz2"
        "${pkgname}_fix_includes.patch"
        "${pkgname}_fix_build_flags.patch")
sha256sums=('1fdfd6ccbb2313b7945a168f379ea7ac28e3c7ab5007afa8bbd704d1961c6921'
            '61c89615d290cf85265aec27581b7559ddc5e2800c0ea5015c42a7f64624ee81'
            'bf331daa851e9771f5e5ea5151a0d177dbf348cddefe1fe87962305a435fd59a')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${_pkgsrc}.tar.bz2" -C "${srcdir}/${_pkgsrc}"

  cd "${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 --binary -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() { 
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "readme.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -Dm644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
