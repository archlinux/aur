# Maintainer: James An <james@jamesan.ca>

# PKGBUILD-git
# template for writing a PKGBUILD file with a git VCS source

# Copyright 2014 James An

# THIS PROGRAM is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

pkgname=wlterm-git
_pkgname=${pkgname%-git}
pkgver=r19.946df2d
pkgrel=1
pkgdesc="Small terminal emulator based on libtsm"
arch=('i686' 'x86_64' 'any')
url="https://www.freedesktop.org/wiki/Software/kmscon/$_pkgname"
license=('MIT')
depends=('gtk3' 'cairo' 'libtsm-git')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git://people.freedesktop.org/~dvdhrm/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname"

  # Generate license file from COPYING.
  sed -n '/Copyright (c)/,/SOFTWARE\./{s/^\s\+//;p}' COPYING >| LICENSE
}

build() {
  cd "$_pkgname"

  make
}

package() {
  cd "$_pkgname"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE_htable "$pkgdir/usr/share/licenses/$_pkgname/LICENSE_htable"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
