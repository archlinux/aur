# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Tomasz Gąsior <tomaszgasior.pl>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>

# This file is based on the 
# original PKGBUILD of mate-utils package.
# https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/mate-utils

_proj="mate"
_pkgbase="${_proj}-utils"
pkgbase="${_proj}-search-tool"
pkgname=(
  "${pkgbase}"
)
pkgver=1.20.1
pkgrel=1
_pkgdesc=(
  "Utility to search for files."
  "Fork of gnome-search-tool,"
  "separated from MATE utils."
)
pkgdesc="${_pkgdesc[*]}"
url="http://${_proj}-desktop.org"
arch=(
  'x86_64'
  'arm'
  'armv7h'
  'aarch64'
  'i686'
  'pentium4'
  'powerpc'
)
license=(
  'GPL'
)
depends=(
  'gtk3'
  'libsm'
)
makedepends=(
  'intltool'
  'itstool'
  'libgtop'
)
conflicts=(
  "${_pkgbase}"
  "gnome-search-tool"
)
provides=(
  "gnome-search-tool"
)
source=(
  "https://pub.${_proj}-desktop.org/releases/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.xz"
  "build-only-gsearchtool.patch"
  "dont-read-mate-setting.diff"
  "i-dont-need-help.patch"
)
sha256sums=(
  "6a1e0bba9c117f8ce81bb271d2182006524250fe9e31f2fc904f6403453020cf"
  "4cb1c2b986659859fbc5cfa6659026025d6785d4189a6b9964c965eba3987670"
  "94fd8ebd909886214f02688b04140d62c47f383bb8746b57bd8e92da1176b005"
  "af54d55508428deec00989966c36d5e00d8e7db61cf6e31febd3b636957bc755"
)

prepare() {
  cd \
    "${_pkgbase}-${pkgver}"
  patch \
    -p0 \
    -i \
      "${srcdir}/build-only-gsearchtool.patch"
  patch \
    -p0 \
    -i \
      "${srcdir}/dont-read-mate-setting.diff"
  patch \
    -p0 \
    -i \
      "${srcdir}/i-dont-need-help.patch"
}

build() {
  local \
    _opts=()
  cd \
    "${_pkgbase}-${pkgver}"
  _opts=(
    --prefix=/usr
    --libexecdir=/usr/lib/${_pkgbase}
    --sysconfdir=/etc
    --enable-gdict-applet=no
    --enable-gtk-doc=no \
    --disable-maintainer-flags
    --disable-schemas-compile
  )
  ./configure \
    "${_opts[@]}"

  # https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed \
    -i \
    -e \
      's/ -shared / -Wl,-O1,--as-needed\0/g' \
    libtool
  make
}

package() {
  cd \
    "${_pkgbase}-${pkgver}"
  make \
    DESTDIR="${pkgdir}" \
    install
  cd \
    "${pkgdir}/usr/bin"
  ln \
    -s \
    "${pkgbase}" \
    "gnome-search-tool"
}

# vim:set sw=2 sts=-1 et:
