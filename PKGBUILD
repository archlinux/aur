# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2024-12-18.

_pkgname=pentaxpj-cups
pkgname="${_pkgname}"
epoch=0
pkgver=2.0.0
pkgrel=1
pkgdesc="PPD files and printer filter for Pentax PocketJet 200, PocketJet II, PocketJet 3 and PocketJet 3plus printers."
arch=('i686' 'x86_64')
url="https://www.openprinting.org/download/printing/pentaxpj/pocketjet_cups/"
license=(
  'GPL-2.0-only'
  'LicenseRef-custom:proprietary'
)

# groups=(
#   "pentaxpj"
# )

depends=(
  "glibc"
  "libcups"
)

makedepends=(
  "libcups" # For 'cups-config'
)

provides=(
  # "${_pkgname}=${pkgver}"
  "pentax-pocketjet-2-manual=2004"
  "pentax-pocketjet-200-manual=2004"
  "pentax-pocketjet-ii-manual=2004"
  "pentax-pocketjet-3-manual=2004"
  "pentax-pocketjet-3plus-manual=2004"
)

_target="${_pkgname}-${pkgver}.tar.gz"
_gccfixuppatch="${_pkgname}-${pkgver}-gcc-fixup.patch"

source=(
  "${_target}::https://www.openprinting.org/download/printing/pentaxpj/pocketjet_cups/pocketjet_CUPS.tar.gz"
  "${_gccfixuppatch}::https://www.openprinting.org/download/printing/pentaxpj/pocketjet_cups/pocketjet-fix.patch"
  "Pentax_PocketJet_II_and_PocketJet_200_users_guide.pdf::http://web.archive.org/web/20071017093018/http://www.megatron.fr/imprimantes/pdf/manuels/thermal/#pentax/doc_pocketjet_II-200_user_guide_e.pdf"
  "Pentax_PocketJet_3_and_PocketJet_3plus_users_guide.pdf::https://archive.org/download/manualsbase-id-384912/384912.pdf"
  "license_users-guide_info.txt"
)

sha256sums=(
  "3c395dfebbdcd0c93b6cf6c714e16940b80ba2580728400238beb9a3486fc9f5"
  "fe981425bda813d4e659a384efe0584446cc9dc89af1d1f7905ac87e92a402d9"
  "ab714ff7dac4cf61261b63836cc238873936c0816b5978d265acf49ffcb3cfcc"
  "18fbf3edaea8ee10e9dd12741b5fb4122b3bb207c1dc63c173b958293691b4db"
  "385590851fdc8464f0cb844f0d93e2b625ee46772ce8fad9d287d640db7e9fc2"
)

options+=('emptydirs')

prepare() {
  cd "${srcdir}/pocketjet_CUPS"

  patch -Np0 -i "${srcdir}/${_gccfixuppatch}"

  # './configure' is needed for 'pkgver()'.
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin
}

pkgver() {
  cd "${srcdir}/pocketjet_CUPS"

  grep -E '^[[:space:]]*#define[[:space:]]+VERSION' config.h | awk '{print $3}' | tr -d \"\'
}

build() {
  cd "${srcdir}/pocketjet_CUPS"

  make
}

package() {
  cd "${srcdir}/pocketjet_CUPS"

  install -Dvm755 -t "${pkgdir}/$(cups-config --serverbin)/filter"/        rastertopocketjet
  install -Dvm644 -t "${pkgdir}/$(cups-config --datadir)/model"/pentaxpj/  *.ppd

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"/                AUTHORS INSTALL NEWS README "${srcdir}"/{Pentax_PocketJet_II_and_PocketJet_200_users_guide.pdf,Pentax_PocketJet_3_and_PocketJet_3plus_users_guide.pdf}
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"             COPYING "${srcdir}/license_users-guide_info.txt"
}
