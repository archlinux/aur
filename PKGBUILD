# Arch PKGBUILD for cLaTeXMath
# Copyright (C) 2020 sp1rit <sp1ritCS@protonmail.com>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# Maintainer: sp1rit <sp1ritCS@protonmail.com>

_basename=clatexmath
pkgname="${_basename}-git"
pkgver=r484.dc32540
pkgrel=1
pkgdesc="A dynamic, cross-platform, and embeddable LaTeX rendering library"
arch=("x86_64" "aarch64" "i686" "armv7h" "s390x")
url="https://github.com/NanoMichael/cLaTeXMath"
license=('MIT')
depends=("gtkmm3" "gtksourceviewmm" "tinyxml2")
makedepends=("git" "meson")
provides=("${_basename}")
source=("${_basename}::git+https://github.com/NanoMichael/cLaTeXMath.git")
sha256sums=("SKIP")
pkgver() {
	cd "${srcdir}/${_basename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_basename}"
	arch-meson . _build
}

build() {
	cd "${srcdir}/${_basename}"
	ninja -C _build
}

package() {
	cd "${srcdir}/${_basename}"
	DESTDIR="${pkgdir}" meson install -C _build
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	sed -n '/The .* License/,/ SOFTWARE\./p' README.md > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
