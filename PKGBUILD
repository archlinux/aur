# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Alberto Fanjul (https://aur.archlinux.org/account/albfan)

pkgname=miraclecast-nosystemd-git
_pkgname=miraclecast
pkgver=1.0+139.r327.20230216.850a1c6
pkgrel=1
pkgdesc="Software to connect external monitors to your system via Wifi. It is compatible to Miracast. Link-management works, everything else is still being worked on. Replaces openwfd. Built without systemd."
arch=(
  'i686'
  'x86_64'
  'armv6h'
  'armv7h'
)
url="https://github.com/albfan/miraclecast"
license=(
  'LGPL'
  'GPL2'
)
depends=(
  'bash'
  'glibc'
  'glib2'
  'gstreamer'
  'gst-plugins-base-libs'
  'gtk3'
  'libelogind>=221'
  'libudev'
  'python>=3'
  'python-gobject'
  'readline'
  'wpa_supplicant'
)
makedepends=(
  'git'
)
checkdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-nosystemd=${pkgver}"
  "${_pkgname}-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
backup=(
  'etc/dbus-1/system.d/org.freedesktop.miracle.conf'
)
source=(
  "${_pkgname}::git+${url}.git"
  'miraclecast-use-elogind.patch'
)
sha256sums=(
  'SKIP'
  'ad4f15e126d2a461cbfff0dd24971e5bf020a0d22a562ac217b96662b0f18c6d'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Modifying sources to be 'elogind' compatible ..."
  ### Change sources to be compatible with elogind instead of systemd.
  #   Two variants are given, use only one:
  #
  ## (1) Change in the fly with `sed`:
  #  grep -rE '#include[[:space:]]+<systemd/' * | awk -F: '{print $1}' | while read i; do sed -E -e 's|(#include[[:space:]]+<)(systemd/)|\1elogind/\2|g' -i "$i"; done
  ## (2) Use a patch:
  patch -N -p1 --follow-symlinks -i "${srcdir}/miraclecast-use-elogind.patch"

  msg2 "Running ./autogen.sh ..."
  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Running ./configure ..."
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-systemd

  msg2 "Running make ..."
  make
}

check() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Running make check ..."
  make -k check
}

package() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Running make install ..."
  make DESTDIR="${pkgdir}/" install

  for _docfile in NEWS README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done

  for _licensefile in COPYING* LICENSE*; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
