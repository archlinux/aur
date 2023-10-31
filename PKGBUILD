# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Alberto Fanjul (https://aur.archlinux.org/account/albfan)

_pkgbase=miraclecast
pkgbase="${_pkgbase}-nosystemd-git"
pkgname=(
  "${pkgbase}"
  "${_pkgbase}-docs-git"
)
pkgver=1.0+140.r328.20230714.fdb8671
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
makedepends=(
  'git'
)
checkdepends=()
source=(
  "${_pkgbase}::git+${url}.git"
  "${_pkgbase}-wiki::git+${url}.wiki.git"
  'miraclecast-use-elogind.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'ad4f15e126d2a461cbfff0dd24971e5bf020a0d22a562ac217b96662b0f18c6d'
)

prepare() {
  cd "${srcdir}/${_pkgbase}"

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
  cd "${srcdir}/${_pkgbase}"

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
  cd "${srcdir}/${_pkgbase}"

  msg2 "Running ./configure ..."
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-systemd

  msg2 "Running make ..."
  make
}

check() {
  cd "${srcdir}/${_pkgbase}"

  msg2 "Running make check ..."
  make -k check
}


package_miraclecast-nosystemd-git() {
  pkgdesc="Software to connect external monitors to your system via Wifi. It is compatible to Miracast. Link-management works, everything else is still being worked on. Replaces openwfd. Built without systemd."
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
  optdepends=(
    "miraclecast-docs: Documentation."
  )
  provides=(
    "miraclecast=${pkgver}"
    "miraclecast-nosystemd=${pkgver}"
    "miraclecast-git=${pkgver}"
  )
  conflicts=(
    'miraclecast'
  )
  backup=(
    'etc/dbus-1/system.d/org.freedesktop.miracle.conf'
  )


  cd "${srcdir}/miraclecast"

  msg2 "Running make install ..."
  make DESTDIR="${pkgdir}/" install

  msg2 "Installing additional 'binaries' ..."
  for _bin in miracle-vlc; do
    install -D -v -m755 "res/${_bin}" "${pkgdir}/usr/bin/${_bin}"
  done

  msg2 "Installing additional ressources/ helper files ..."
  for _res in miracle-utils.sh sinkctl.protocol-extension.example wpa.conf; do
    install -D -v -m644 "res/${_res}" "${pkgdir}/usr/share/doc/miraclecast/ressources/${_res}"
  done
  for _resbin in kill-wpa.sh gstplayer normal-wifi.sh show_wpa.sh test-hardware-capabilities.sh test-viewer.sh write-udev-rule.sh; do
    install -D -v -m755 "res/${_resbin}" "${pkgdir}/usr/share/doc/miraclecast/ressources/${_resbin}"
  done

  msg2 "Installing license files ..."
  install -d -v -m755 "${pkgdir}/usr/share/doc/miraclecast/licenses"
  for _licensefile in COPYING* LICENSE*; do
    install -D -v -m644 "${_licensefile}"                                            "${pkgdir}/usr/share/licenses/miraclecast-nosystemd-git/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/miraclecast-nosystemd-git/${_licensefile}" "${pkgdir}/usr/share/doc/miraclecast/licenses/${_licensefile}"
  done
}


package_miraclecast-docs-git() {
  pkgdesc="Documentation for miraclecast."
  provides=(
    "miraclecast-docs=${pkgver}"
  )
  conflicts=(
    "miraclecast-docs"
  )
  optdepends=(
    "miraclecast: To use the software that is documented here."
  )


  msg2 "Installing wiki ..."
  install -d -v -m755                    "${pkgdir}/usr/share/doc/miraclecast/wiki"
  cp -rv "${srcdir}/miraclecast-wiki"/*  "${pkgdir}/usr/share/doc/miraclecast/wiki"/

  cd "${srcdir}/miraclecast"

  msg2 "Installing source repository's doc files ..."
  for _docfile in NEWS README.md; do
    install -D -v -m644 "${_docfile}"    "${pkgdir}/usr/share/doc/miraclecast/$(basename "${_docfile}")"
  done
}
