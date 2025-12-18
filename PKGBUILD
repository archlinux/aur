# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: ZhenDong Wu <wzd04062@sina.com>
# Contributor: someone5678 <someone5678 dot dev at google dot com>

pkgname=libfprint-cs9711-git
_pkgname=libfprint
pkgver=1.94.9+43.r1854.20251218.6cb01231
pkgrel=1
pkgdesc="libfprint with proprietary FPC match on host device CS9711Fingprint driver"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  libgudev
  libgusb
  openssl
  pixman
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  python-cairo
  python-gobject
  systemd
  opencv
  cmake
  doctest
)
checkdepends=(
  cairo
  umockdev
  doctest
)
provides=("libfprint=${pkgver}" "libfprint-2.so" "libfprint-cs9711")
replaces=("libfprint-cs9711<=1.94.8")
conflicts=("libfprint>=1.1")
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git"
        "sigfm::git+https://gitlab.freedesktop.org/Tooniis/libfprint#branch=sigfm"
        # Patches from https://github.com/ddlsmurf/libfprint-CS9711
        '0000-data_autosuspend.hwdb.patch'
        '0000-libfprint_drivers_cs9711_cs9711.c.patch'
        '0000-libfprint_drivers_cs9711_cs9711.h.patch'
        '0000-libfprint_meson.build.patch'
        '0000-meson.build.patch'
)
b2sums=('SKIP'
        'SKIP'
        'e037a114b21c328c80012a296424612b0a656574995fbc293e7c3144fbdc5f7dd53a40b9eecf03e3406eaac1620c3bdf8c291e6a932f776b138c593fe7dff2b2'
        '5b8029de09ca58ec78b3bf2e987f92fbc0694c77c476113032fca133f322f05de7f30f59ac561c1bf11666de191c14f073502ba58978d4112fa524b619692f6a'
        '47bf846159a5dfc2eb8823ccede211ffde0efbf04b4020da7c9d9275ae6e13e0e70762117ef742a38bebb5bf2db5dc8fceecba31a4d1c58effea8b984c3ceb52'
        '793acc025f0de306c5ff2f85ca824dc38892b1a6e2f81be437674eb27574132ee65e92f0aab7726219f6014def27232d64cca17408ece3a0be449a8d674fc7c5'
        'b14abcf7f8ce1b385291b345079f65ac31f02807a9a2e966e9eac1b61500ac7f5d9d37589161a83e0fd6dd23634e4604d4f129d16fa52cbc96b2f7dc4755b32b'
)

pkgver() {
  cd "${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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

prepare() {
  cd "${_pkgname}"
  git reset --hard origin/master && git clean -fdd
  git config remote.sigfm.url >&- || git remote add sigfm $srcdir/sigfm
  git config user.email >&- || git config user.email "makepkg@local.com"
  git config user.name >&- || git config user.name "makepkg"
  git fetch sigfm makepkg
  git merge sigfm/makepkg --no-edit
  # Revert "libfprint: Use fatal-warnings on g-i-scanner" to fix build
  sed -i '/fatal_warnings: true,/d' libfprint/meson.build
  sed -i 's|import shutil|import shutil\n    import traceback|g' tests/virtual-image.py
  for patch in $srcdir/*.patch; do
    git apply $patch
  done
}

build() {
  local meson_options=(
    # Add virtual drivers for integration tests (e.g. in fprintd)
    # -D drivers=all

    -D installed-tests=false
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

# check() {
#   meson test -C build --print-errorlogs
# }

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
