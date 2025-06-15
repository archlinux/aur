# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

_pkgbase=fwupd
_srcdir="${_pkgbase}-starlabs"
pkgbase=${_srcdir}-git
pkgname=(
  $pkgbase
  ${_srcdir}-docs-git
)
pkgver=1.8.2.r5231.g0e29c54
pkgrel=1
pkgdesc="Simple daemon to allow session software to update firmware (StarLabs version)"
arch=(x86_64)
url='https://github.com/StarLabsLtd/fwupd'
license=(LGPL-2.1-or-later)
depends=(
  bash
  bluez
  curl
  flashrom-starlabs
  fwupd-efi
  gcc-libs
  glib2
  glibc
  gnutls
  hicolor-icon-theme
  json-glib
  libarchive
  libcbor
  libdrm
  libjcat
  libmbim
  libmm-glib
  libqmi
  libusb
  libxmlb
  passim
  polkit
  protobuf-c
  python
  shared-mime-info
  sqlite
  systemd-libs
  tpm2-tss
  xz
  zlib
  libgusb
)
makedepends=(
  bash-completion
  gi-docgen
  gnu-efi-libs
  gobject-introspection
  meson
  noto-fonts
  noto-fonts-cjk
  pandoc
  python-cairo
  python-dbus
  python-dbusmock
  python-gobject
  python-pillow
  umockdev
  vala
  valgrind
  git
)
source=(
  "${_srcdir}::git+${url}.git#branch=starlabs"
  fwupd.sysusers
)
sha512sums=('SKIP'
            '637203080b55eda74a659f58c853a9a723a2dad5da70915b2b0e036c6145a649468ebec700cc83975d9cb5378b9dced8b3a3b26bdbcc75ddc774837355e75deb')

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
  local meson_options=(
    -D docs=enabled
    -D efi_binary=false
    -D supported_build=enabled
    -D systemd_unit_user=fwupd
  )

  arch-meson ${_srcdir} build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_fwupd-starlabs-git() {
  depends+=(
    libarchive.so
    libcbor.so
    libcurl.so
    libgudev-1.0.so
    libjson-glib-1.0.so
    libmm-glib.so
    libpassim.so
    libprotobuf-c.so
    libqmi-glib.so
  )
  optdepends=(
    'python-dbus: Firmware packaging tools'
    'python-gobject: Firmware packaging tools'
    'udisks2: UEFI firmware upgrade support'
  )
  provides=(libfwupd.so ${_pkgbase})
  conflicts=(${_pkgbase})
  backup=(
    'etc/fwupd/fwupd.conf'
    'etc/fwupd/remotes.d/lvfs-testing.conf'
    'etc/fwupd/remotes.d/lvfs.conf'
    'etc/fwupd/remotes.d/vendor-directory.conf'
  )

  meson install -C build --destdir "${pkgdir}"
  # Add fwupd user https://bugs.archlinux.org/task/79653
  install -D -m644 fwupd.sysusers "${pkgdir}"/usr/lib/sysusers.d/fwupd.conf
  # Remove the tests
  rm -r "${pkgdir}"/usr/{lib,share}/installed-tests/
  # Conflicts with the dbxtool package
  mv "${pkgdir}"/usr/bin/{,fwupd-}dbxtool
  mv "${pkgdir}"/usr/share/man/man1/{,fwupd-}dbxtool.1
  # Remove msr module-load config as it is built-in
  rm "${pkgdir}"/usr/lib/modules-load.d/fwupd-msr.conf

  _pick docs "${pkgdir}"/usr/share/doc/{,fwupd/}{libfwupdplugin,libfwupd}
}

package_fwupd-starlabs-docs-git() {
  pkgdesc="Simple daemon to allow session software to update firmware - documentation"
  provides=(${_pkgbase}-docs)
  conflicts=(${_pkgbase}-docs)
  depends=()
  mv docs/* "${pkgdir}"
}
