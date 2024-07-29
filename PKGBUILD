# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Martin Sandsmark <martin.sandsmark (at) kde.org> (https://aur.archlinux.org/account/sandsmark)

pkgname=linux-vr-player-or-something-git
epoch=1
pkgver=r10.20230129.ab86026
pkgrel=1
pkgdesc="Very simple VR video player using libmpv and openhmd."
arch=("i686" "x86_64")
url="https://github.com/JohnCiubuc/linux-vr-player-or-something"
license=(GPL-3.0-or-later)
depends=(
  "gcc-libs"
  "glibc"
  "libgl"
  "qt5-base"
  "mpv"
  "openhmd"
)
makedepends=(
  "git"
  "qt5-base"  # for 'qmake'
)
provides=(
  "linux-vr-player-or-something"
  "ohmdplayer"
)
conflicts=(
  "linux-vr-player-or-something"
  "ohmdplayer"
)
source=('git+https://github.com/JohnCiubuc/linux-vr-player-or-something.git')
md5sums=('SKIP')

pkgver() {
  cd linux-vr-player-or-something
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd linux-vr-player-or-something

  _SILENCEWARNINGS="-Wno-unused-parameter"
  CFLAGS+=" ${_SILENCEWARNINGS}"
  CXXFLAGS+=" ${_SILENCEWARNINGS}"
  export CFLAGS
  export CXXFLAGS

  qmake
  make
}

package() {
  cd linux-vr-player-or-something

  install -Dvm755 -t "$pkgdir/usr/bin" "ohmdplayer"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/linux-vr-player-or-something" "README.md"
}
