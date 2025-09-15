# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Sebastian J. Bronner <waschtl@sbronner.com>

pkgname=gwenhywfar-git
pkgver=5.12.2+1+g2ffb0f3d
pkgrel=2
pkgdesc="OS abstraction functions for various projects"
arch=(x86_64 i686)
url='https://www.aquamaniac.de/rdm/'
license=(LGPL-2.1-only)
depends=(bash gcc-libs glib2 glibc gnutls libgcrypt libgpg-error openssl)
makedepends=(git gtk3 qt6-base)
optdepends=('gtk3: for the GTK3 UI' 'qt6-base: for the Qt5 UI')
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
  _tag="$(git -C "$_sourcedir" tag --list "${_version_base}*" | head -1)"
  if [[ -z "${_tag}" ]]; then
    printf >&2 'Unable to find tag that starts with %s\n' "${_tag}"
    return 1
  fi

  printf "%s+%s+g%s\n" \
    "${_version_base}" \
    "$(git -C "$_sourcedir" rev-list --count "^${_tag}" @)" \
    "$(git -C "$_sourcedir" describe --always --exclude='*')"
}

prepare() {
  cd $_sourcedir
  autopoint -f
  autoreconf -fi
}

build() {
  cd $_sourcedir
  GPGRT_CONFIG='/usr/bin/gpgrt-config' \
    PATH="/usr/lib/qt6:/usr/lib/qt6/bin:$PATH" \
    ./configure --prefix=/usr --sysconfdir=/etc --enable-system-certs --with-guis="gtk3 qt5"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_sourcedir
  make DESTDIR="${pkgdir}" install
}
