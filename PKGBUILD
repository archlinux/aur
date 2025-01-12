# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Fabian Bornschein <fabiscafe (at) archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig (at) archlinux.org>
# Contributor: Jan de Groot <jgc (at) archlinux.org>

_pkgbase=evolution-data-server
pkgbase="${_pkgbase}-libsoup2.4"
pkgname=(
  evolution-data-server-libsoup2.4
)
pkgver=3.44.4 # Seems to be the latest version using libsoup 2, and not libsoup 3.
pkgrel=1
pkgdesc="Unified contacts, tasks and calendar backend. Legacy version depending on libsoup 2.4, for compatibility with older software."
url="https://gitlab.gnome.org/GNOME/evolution/-/wikis/home"
arch=(
  'aarch64'
  'x86_64'
  'i686'
  'pentium4'
  'armv5h'
  'armv6h'
  'armv7h'
)
license=(
  "LGPL-2.0-only"
  "LGPL-2.1-or-later"
)
depends=(
  cairo
  db
  gcc-libs
  glib2
  glibc
  gtk3
  icu
  json-glib
  krb5
  libcanberra
  libgweather-4.so
  libgcr-base-3.so
  libgcr-ui-3.so
  libical
  libldap
  libphonenumber
  libsecret
  libsoup-2.4.so
  libwebkit2gtk-4.0.so
  libxml2
  nspr
  nss
  pango
  perl
  sqlite
  zlib
)
makedepends=(
  boost
  cmake
  db
  gcr
  git
  glib2-devel
  gobject-introspection
  gperf
  krb5
  libgweather-4
  libphonenumber
  "libsoup>=2"
  "libsoup<3"
  ninja
  nspr
  nss
  openldap
  postfix
  python
  vala
  webkit2gtk
)
checkdepends=(
  db
)
source=(
  "git+https://gitlab.gnome.org/GNOME/evolution-data-server.git#tag=$pkgver"
  "c++-17-standard.patch"
  "build_against_icu76.1.patch"
)
sha256sums=(
  '378c0176057e398ce86a067d0edc3b121089227e7812f53bdda6392767c4d86c'  # Upstream source
  "77ee7b13ccc5425a438a68132f7d5f661c6eaa22a810538aa857dcf0f9b48c87"  # c++-17-standard.patch
  "49ca28e3665415511e1f90bf4f74d48997c52f2c22a9799ef6ebabe0b7f4f139"  # build_against_icu76.1.patch
)
if which ccache > /dev/null 2>&1; then
  options+=("ccache")
fi

_CFLAGSADDITIONS="-w"

prepare() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}/${_pkgbase}"

  for _patch in "${srcdir}/c++-17-standard.patch" "${srcdir}/build_against_icu76.1.patch"; do
    printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  git log > git.log
}

build() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  local cmake_options=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DINCLUDE_INSTALL_DIR="/usr/include/${pkgbase}"
    -DLIBEXEC_INSTALL_DIR="/usr/lib/${pkgbase}"
    -DLIB_INSTALL_DIR="/usr/lib/${pkgbase}"
    -DSHARE_INSTALL_PREFIX="/usr/share/${pkgbase}"
    -DSYSCONF_INSTALL_DIR=/etc
    -DDB_LOAD=/usr/bin/db_load
    -DENABLE_BACKEND_PER_PROCESS=ON
    -DENABLE_BACKTRACES=OFF
    -DENABLE_BROKEN_SPOOL=OFF
    -DENABLE_CANBERRA=ON
    -DENABLE_CODE_COVERAGE=OFF
    -DENABLE_DOT_LOCKING=ON
    -DENABLE_EXAMPLES=OFF
    -DENABLE_FILE_LOCKING=fcntl
    -DENABLE_GOA=OFF
    -DENABLE_GOOGLE=OFF
    -DENABLE_GTK=ON
    -DENABLE_GTK_DOC=OFF
    -DENABLE_INSTALLED_TESTS=OFF
    -DENABLE_INTROSPECTION=ON
    -DENABLE_IPV6=ON
    -DENABLE_LARGEFILE=ON
    -DENABLE_MAINTAINER_MODE=OFF
    -DENABLE_OAUTH2=ON
    -DENABLE_SCHEMAS_COMPILE=ON
    -DENABLE_SMIME=ON
    -DENABLE_VALA_BINDINGS=ON
    -DENABLE_WEATHER=ON
    -DWITH_GWEATHER4=ON
    -DWITH_KRB5=ON
    -DWITH_LIBDB=/usr/lib
    -DWITH_NSPR_INCLUDES=/usr/include/nspr
    -DWITH_NSPR_LIBS=/usr/lib
    -DWITH_NSS_INCLUDES=/usr/include/nss
    -DWITH_NSS_LIBS=/usr/lib
    -DWITH_OPENLDAP=ON
    -DWITH_PHONENUMBER=ON
    -DWITH_PRIVATE_DOCS=OFF
    -DWITH_STATIC_LDAP=OFF
    -DWITH_SUNLDAP=OFF
    -DWITH_GOOGLE_CLIENT_ID=0000
    -DWITH_GOOGLE_CLIENT_SECRET=0000
    -DWITH_OUTLOOK_CLIENT_ID=0000
    -DWITH_OUTLOOK_CLIENT_SECRET=0000
    -DWITH_YAHOO_CLIENT_ID=0000
    -DWITH_YAHOO_CLIENT_SECRET=0000
    -Wno-dev
  )

  cd "${srcdir}"

  cmake -S "${_pkgbase}" -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}/build"

  ctest --output-on-failure --stop-on-failure
}

package_evolution-data-server-libsoup2.4() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" cmake --install build

  ## Remove stuff we do not want in this package, because it conflicts with `evolution-data-server`:
  rm -v "${pkgdir}/etc/xdg/autostart/org.gnome.Evolution-alarm-notify.desktop"
  rmdir "${pkgdir}/etc/xdg/autostart/" "${pkgdir}/etc/xdg" "${pkgdir}/etc"
  rm -v "${pkgdir}/usr/lib/systemd/user"/evolution-*
  rmdir "${pkgdir}/usr/lib/systemd/user" "${pkgdir}/usr/lib/systemd"

  cd "${srcdir}/${_pkgbase}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${pkgbase}"       git.log AUTHORS HACKING MAINTAINERS NEWS README
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}

# vim:set sw=2 sts=-1 et:
