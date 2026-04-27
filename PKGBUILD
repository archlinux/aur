# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Ashley <ashley at nullworks dot dev>

_pkgname=pmount-modern
pkgname="${_pkgname}-nosystemd-git"
pkgver=0.10.0_dbus.r334.20260406.d1cbb00
pkgrel=1
pkgdesc='Modernized pmount with D-Bus and PolicyKit integration. Built without systemd dependency.'
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url='https://github.com/zHappySnake/pmount-modern'
license=('GPL-3.0-or-later')
depends=(
  'dbus'
  'dbus-glib'
  'glib2'
  'polkit'
  'util-linux'
  'util-linux-libs'
)
makedepends=(
  'git'
  'cmake'
  'meson'
  'pkgconf'
)
optdepends=(
  'cryptsetup: LUKS support'
  'ntfs-3g: NTFS mounting via ntfs-3g'
)
provides=(
  'pmount'
  "${_pkgname}=${pkgver}"
  "${_pkgname}-git=${pkgver}"
  "${_pkgname}-nosystemd=${pkgver}"
)
conflicts=(
  'pmount'
  "${_pkgname}"
  "${_pkgname}-git"
  "${_pkgname}-nosystemd"
)
#replaces=('pmount')
backup=(
  'etc/pmount.allow'
  'etc/pmount.conf'
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  #_ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-dbus|_dbus|' -e 's|-|+|g')"
  _ver="$(grep -E '^[[:space:]]*version:' meson.build | awk -F: '{print $2}' | tr -d [[:space:]],\"\' | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-dbus|_dbus|' -e 's|-|+|g')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  _SILENCEWARNINGS=("unused-variable" "unused-parameter" "unused-function")
  for _warning in "${_SILENCEWARNINGS[@]}"; do
    #CFLAGS+=" -Wno-${_warning}"
    CFLAGS+=" -Wno-error=${_warning}"
    #CXXFLAGS+=" -Wno-${_warning}"
    CXXFLAGS+=" -Wno-error=${_warning}"
  done
  export CFLAGS
  export CXXFLAGS

  local meson_options=(
    -Ddbus=enabled
    -Dpolkit=enabled
    -Dsystemd=disabled
    -Dmount-prog=/usr/bin/mount
    -Dumount-prog=/usr/bin/umount
    -Dcryptsetup-prog=/usr/bin/cryptsetup
    -Dmount-ntfs-3g=/usr/bin/mount.ntfs-3g
    -Dfsck-prog=/usr/bin/fsck
    -Dlosetup-prog=/usr/bin/losetup
    --prefix=/usr
    --sysconfdir=/etc
    --sharedstatedir=/var/lib
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  cd "${srcdir}"

  meson test -C build --print-errorlogs
}

package() {
  cd "${srcdir}"

  meson install -C build --destdir "${pkgdir}" --no-rebuild

  cd "${srcdir}/${_pkgname}"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      AUTHORS README.md git.log
  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgname}"/
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
