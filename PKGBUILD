# Maintainer: karu1 <.1me.io7@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Benjamin Auder <benjamin.a@mailoo.org>

_pkgname=fuse-zip
pkgname="${_pkgname}-occhris-git"
pkgver=0.7.2.r482.cf0d889
pkgrel=1
pkgdesc='Mount and modify zip files - a soft fork made by Chris Graham with zip encryption support'
arch=(x86_64)
_url='https://bitbucket.org/agalanin/fuse-zip'
url='https://gitlab.com/occhris/fuse-zip'
license=(GPL3)
conflicts=("${_pkgname}" "${_pkgname}-git")
provides=("${_pkgname}")
# setconf use python
depends=(fuse libzip)
makedepends=(setconf git)
# FIXME: Use Chris Graham repo or patch
# 01.patch::https://gitlab.com/occhris/fuse-zip/-/commit/ffe2dc4ff1e70a0661a308f5b50992709143f0b0.patch
# 02.patch::https://gitlab.com/occhris/fuse-zip/-/commit/8940c74effa63ebc27948baf884140c89c395ad9.patch
# 03.patch::https://gitlab.com/occhris/fuse-zip/-/commit/cf0d8897ec2c5783bdd37189e0341a187fb0363e.patch
source=("${_pkgname}-occhris"::"git+https://gitlab.com/occhris/fuse-zip.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}-occhris" || exit 2
  ( set -o pipefail
    local _binver=`grep ' VERSION ' config.h | cut -d'"' -f2`
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.r%s.%s" "${_binver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${_pkgname}-occhris" || exit 2
  setconf Makefile prefix /usr
  setconf Makefile RELEASE_CXXFLAGS '-O3 -w'
}

build() {
  cd "${_pkgname}-occhris" || exit 2
  make release
}

package() {
  cd "${_pkgname}-occhris" || exit 2
  install -d "$pkgdir/usr/"{bin,share/man/man1}
  make DESTDIR="$pkgdir" install
}
