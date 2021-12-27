# Maintainer: dreieck
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname='empathy'
pkgname="${_pkgname}-git"
pkgver=3.25.90.93+r13046.20210512.19a4dd3a4
pkgrel=1
pkgdesc="A GNOME instant messaging client using the Telepathy framework. Latest git checkout."
url="https://wiki.gnome.org/Apps/Empathy"
arch=(
  'x86_64'
  'i686'
)
license=('GPL2')
depends=(
  folks-telepathy
  gcr
  geoclue2
  geocode-glib
  iso-codes
  libcanberra
  libchamplain
  libgudev
  libpulse
  telepathy-farstream
  telepathy-glib
  telepathy-logger
  telepathy-mission-control
  webkit2gtk
)
makedepends=(
  'docbook-xsl'
  'gnome-common'
  'git'
  'intltool'
  'itstool'
  'python'
)
optdepends=(
  'telepathy-gabble: XMPP/Jabber support'
  'telepathy-haze: libpurple support'
  'telepathy-idle: IRC support'
  'telepathy-salut: Link-local XMPP support'
  'telepathy-tank: Matrix support'
)
source=(
  "${_pkgname}::git+https://git.gnome.org/browse/empathy.git"
  "telepathy-account-widgets::git+https://git.gnome.org/browse/telepathy-account-widgets.git"
  'enchant-2.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'f177f0dfc242018dd52e312637f513fd08f64aa991b45930cc3ea9a2576f795e'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '.')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config --local submodule.telepathy-account-widgets.url "$srcdir/telepathy-account-widgets"
  git submodule update

  patch -Np1 -i ../enchant-2.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}"

  export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc  \
    --libexecdir=/usr/lib/empathy \
    --disable-static \
    --disable-Werror \
    --enable-shared \
    --disable-static \
    --disable-valgrind \
    --enable-gprof=no \
    --disable-debug \
    --enable-nls \
    --enable-gudev=yes \
    --enable-spell=yes \
    --enable-map=yes \
    --enable-location=yes \
    --enable-geocode=yes \
    --enable-goa=yes \
    --enable-ubuntu-online-accounts=no \
    --disable-coding-style-checks \
    --with-x
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="$pkgdir" install
}
