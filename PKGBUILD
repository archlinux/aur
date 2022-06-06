# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Sebastian J. Bronner <waschtl@sbronner.com>

pkgname=gwenhywfar-git
pkgver=5.9.0+18+gd819db8e
pkgrel=1
pkgdesc="OS abstraction functions for various projects"
arch=(x86_64 i686)
url=https://www.aquamaniac.de/rdm/projects/gwenhywfar
license=(LGPL)
depends=(gnutls libgcrypt openssl)
makedepends=(git gtk3 qt5-base)
optdepends=('gtk3: for the GTK3 UI' 'qt5-base: for the Qt5 UI')
provides=(gwenhywfar)
conflicts=(gwenhywfar)
source=(git+https://git.aquamaniac.de/git/gwenhywfar)
sha256sums=(SKIP)
_sourcedir=gwenhywfar

pkgver() {
  # In the gwenhywfar repository, the Git tag that we want is
  # usually not reachable from the current HEAD.
  # To work around that issue, extract the version number from
  # configure.ac instead.
  _version_base="$(
    awk -F= \
      -e '/^GWENHYWFAR_VERSION_(MAJOR|MINOR|PATCHLEVEL)=/ {
        a[substr($1, 20)] = $2
      }' \
      -e 'END {
        if (length(a) < 3) {
          exit 64 + length(a)
        }
        print a["MAJOR"]"."a["MINOR"]"."a["PATCHLEVEL"]
      }' \
      "$_sourcedir/configure.ac"
  )"

  printf "%s+%s+g%s\n" \
    "${_version_base}" \
    "$(git -C "$_sourcedir" rev-list --count "^${_version_base}" @)" \
    "$(git -C "$_sourcedir" describe --always --exclude='*')"
}

prepare() {
  autoreconf -fi $_sourcedir
}

build() {
  cd $_sourcedir
  ./configure --prefix=/usr --sysconfdir=/etc --enable-system-certs --with-guis="gtk3 qt5"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_sourcedir
  make DESTDIR=$pkgdir install
}
