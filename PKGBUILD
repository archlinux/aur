# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

_pkg="libxml"
_pkgname="${_pkg}2"
pkgbase="${_pkgname}-2.9"
pkgname=(
  "${pkgbase}"
  "${pkgbase}"-docs
)
pkgver=2.9.10
pkgrel=1
pkgdesc="XML C parser and toolkit"
_url="https://gitlab.gnome.org/GNOME/${_pkgname}"
url="${_url}/-/wikis/home"
arch=(x86_64)
license=(custom:MIT)
depends=(
  icu
  ncurses
  readline
  xz
  zlib
)
makedepends=(
  python
)
# tags/v2.4.30^0
# _commit=3ebf94cd96ba78ea25f929a1c948ad54a262e75e 
# tags/v2.9.10^0
_commit=41a34e1f4ffae2ce401600dbb5fe43f8fe402641 
# tags/v2.10.4^0
# _commit=223cb03a5d27b1b2393b266a8657443d046139d6  
source=()
sha256sums=()
_tarball="${_pkgname}-${pkgver}.tar.gz"
[[ "${_git}" == true ]] && \
  makedepends+=(
    git
  ) && \
  source+=(
    "git+${_url}.git#commit=$_commit"
  ) && \
  sha256sums+=(
    SKIP
  )
[[ "${_git}" == false ]] && \
  source+=(
    "${_tarball}::${_url}/-/archive/${_commit}/${_pkgname}-${_commit}.tar.gz"
  ) && \
  sha256sums+=(
    '9a95947bd868900c203382769e54fdb99cedf50e39851cc33bc4e87cbf2785d1'
  )
source+=(
  "${pkgbase}.8-python3-unicode-errors.patch"
  fix-relaxed-approach-to-nested-documents.patch
  "${pkgbase}.10-CVE-2019-20388.patch"
  "${pkgbase}.10-CVE-2020-7595.patch"
  "${pkgbase}.10-parenthesize-type-checks.patch"
  "${pkgbase}.10-CVE-2020-24977.patch"
  "${pkgbase}.10-fix-integer-overflow.patch"
  "${pkgbase}.10-icu68.patch"
  "https://www.w3.org/XML/Test/xmlts20130923.tar.gz"
)
sha256sums+=(
  '37eb81a8ec6929eed1514e891bff2dd05b450bcf0c712153880c485b7366c17c'
  '50f04807b86a179d051fb86755e82f55ba7aac9d0c005eefea93d2599a911d01'
  'cfe1b3e0f026df6f979dbd77c1dcd1268e60acf3d7a8ff3f480b4e67bfcc19d6'
  'c6105ff40d7b1b140fcd821b5d64ab8c7b596708071c26964727e7352b07ac7e'
  'b63c161e4c8a6f0a65ba091c3d3ed09d3110d21f997ee61077c782b311fd4b33'
  '62eafffc2b4949489c261c63883d27c2e83d688f1d4c899000b283e4c2a682be'
  'fd227780ad5699bebca7ef412d2d50fb1d21a54f6e3fdcad0bda5bdc8f8b2525'
  'f02a435761f26ff664041d49f9d05924dc627bf103c7f542feee891f69aa84a2'
  '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f'
)

# pkgver() {
#   cd \
#     "${_pkgname}"
#   git \
#     describe \
#       --tags | \
#     sed \
#       's/-rc/rc/;s/^v//;s/[^-]*-g/r&/;s/-/+/g'
# }

prepare() {
  cd \
    "${_pkgname}-${_commit}"
  # From 
  # https://src.fedoraproject.org/rpms/libxml2/tree/master
  patch \
    -Np1 \
    -i \
    "../fix-relaxed-approach-to-nested-documents.patch"
  patch \
    -Np1 \
    -i \
    "../${pkgbase}.8-python3-unicode-errors.patch"
  patch \
    -Np1 \
    -i \
    "../${pkgbase}.10-CVE-2019-20388.patch"
  patch \
    -Np1 \
    -i \
    "../${pkgbase}.10-parenthesize-type-checks.patch"
  patch \
    -Np1 \
    -i \
    "../${pkgbase}.10-CVE-2020-24977.patch"
  patch \
    -Np1 \
    -i \
    "../${pkgbase}.10-fix-integer-overflow.patch"
  patch \
    -Np1 \
    -i \
    "../${pkgbase}.10-icu68.patch"
  NOCONFIGURE=1 \
    ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --program-suffix=-2.9
    --libdir="/usr/lib/${pkgbase}"
    --includedir="/usr/include/${pkgbase}"
    --with-history
    --without-docbook
    --with-icu
    --without-python
    --with-threads
    --disable-static
  )

  cd \
    "${_pkgname}-${_commit}"
  ./configure \
    "${configure_options[@]}"
  sed \
    -i \
    -e \
    's/ -shared / -Wl,-O1,--as-needed\0/g' \
    libtool
  make
}

check() {
  cd \
    "${_pkgname}-${_commit}"
  make \
    check
}

package_libxml2-2.9() {
  local \
    _libdir="/usr/lib/${pkgbase}"
  optdepends=(
    'python2: Python 2 bindings'
    'python: Python bindings'
  )
  provides=(
    "${_pkgname}=${pkgver}"
    "${_pkgname}.so=${pkgver}"
  )
  cd \
    "${_pkgname}-${_commit}"
  make \
    DESTDIR="${pkgdir}" \
    install
  ln \
    -s \
    "${_libdir}/${_pkgname}.so.${pkgver}" \
    "${pkgdir}/usr/lib/${_pkgname}.so.${pkgver}"
  mkdir \
    "${pkgdir}/usr/lib/cmake"
  ln \
    -s \
    "${_libdir}/cmake/${_pkgname}" \
    "${pkgdir}/usr/lib/cmake/${pkgbase}"
  mkdir \
    "${pkgdir}/usr/lib/pkgconfig"
  ln \
    -s \
    "${_libdir}/pkgconfig/${_pkg}-2.0.pc" \
    "${pkgdir}/usr/lib/pkgconfig/${_pkg}2.9-2.0.pc"
  mkdir \
    -p \
    ../doc/usr/share
  mv \
    "${pkgdir}/usr/share/"{doc,gtk-doc} \
    -t \
    ../doc/usr/share
  mv \
    "${pkgdir}/usr/share/aclocal/${_pkg}.m4" \
    "${pkgdir}/usr/share/aclocal/${_pkg}2.9.m4"
  install \
    -Dm644 \
    Copyright \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_libxml2-2.9-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  mv \
    doc/* \
    "${pkgdir}"
  cd \
    "${_pkgname}-${_commit}"
  install \
    -Dm644 \
    "Copyright" \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
