# Maintainer: Nemanja Nedeljkovic <nemanjan00@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>
# Contributor: Vuokko <vuokko@msn.com>

: ${_use_sodeps:=false}

_pkgname="libsigrok"
pkgname="$_pkgname-nemanjan00-git"
pkgver=0.6.2.r600.g6753ab7
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, core library (nemanjan00 fork: one fork with upstream plus pending hardware support: DSLogic U3Pro16/32, Sipeed SLogic, Saleae Logic Pro, Rigol MHO900 and more)"
url="https://github.com/nemanjan00/libsigrok"
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
)
optdepends=(
  'sigrok-firmware-fx2lafw: Cypress FX2-based device support'
)

provides=("$_pkgname" "$_pkgname-git")
conflicts=("$_pkgname" "$_pkgname-git" 'sigrok-slogic-git')

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/nemanjan00/libsigrok.git#branch=master")
sha256sums=('SKIP')

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
  ./configure --prefix=/usr --enable-cxx --disable-python --disable-ruby --disable-java
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
