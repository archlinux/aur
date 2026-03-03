# Maintainer:
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>
# Contributor: Vuokko <vuokko@msn.com>

: ${_use_sodeps:=false}

_pkgname="libsigrok"
pkgname="$_pkgname-git"
pkgver=0.5.2.r1862.g0bc2487
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, core library"
url="https://www.sigrok.org/wiki/Libsigrok"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'bluez-libs'
  'glibmm'
  'hicolor-icon-theme'
  'hidapi'
  'libftdi'
  'libieee1284'
  'libserialport'
  'libsigc++'
  'libusb'
  'libzip'
  'nettle'
)
makedepends=(
  'autoconf-archive'
  'cmake'
  'doxygen'
  'git'
  'python'
  'python-gobject'
  'python-numpy'
  'python-setuptools'
  'swig'
)
optdepends=(
  'jdk8-openjdk'
  'python'
  'sigrok-firmware-fx2lafw: Cypress FX2-based device support'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/sigrokproject/libsigrok.git"
  'libsigrok-swig-4.1.patch'
  'libsigrok-fix-ruby-binding-location.patch'
)
sha256sums=(
  'SKIP'
  '5a4d0660326d358d6f75c084309afc0fb5b76204ddf7f7b6c57f04c07d0165aa'
  'de6add6d1a6ee193999d0f3dd27b2bf263a6a7b0d66841c685eb7d748fd54432'
)

prepare() {
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -d "$_pkgsrc" -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done

  cd "$_pkgsrc"

  # Python 3.14
  sed -e 's&return nullptr;&return -1;&' -i "bindings/python/sigrok/core/classes.i"
}

pkgver() (
  cd "$_pkgsrc"
  local _tmp _tag _version _revision _hash
  _tmp=$(git tag | grep -E 'libsigrok-[0-9.]+' | sed -E 's&([^0-9]*)(\S+)$&\2 \1\2&' | sort -rV | head -1)
  _version=$(cut -f1 -d' ' <<< ${_tmp:?})
  _tag=$(cut -f2 -d' ' <<< ${_tmp:?})
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_commit:?}"
)

build() {
  cd "$_pkgsrc"
  autoreconf -fiv
  ./configure --prefix=/usr --enable-ruby
  make
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      libbluetooth.so
      libgio-2.0.so
      libglib-2.0.so
      libglibmm-2.4.so
      libgobject-2.0.so
      libhidapi-hidraw.so
      libnettle.so
      libstdc++.so
      libusb-1.0.so
      libz.so
      libzip.so
    )"
  fi

  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d" \
    contrib/60-libsigrok.rules \
    contrib/61-libsigrok-uaccess.rules
}
