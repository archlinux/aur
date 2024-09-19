# RaccoonLock; A free, open-source, simple and powerful password manager.
# Copyright (c) 2023-2024, Mónica Gómez (Autumn64)
# 
# This program is free software: you can redistribute it and/or modify it 
# under the terms of the GNU General Public License as published by 
# the Free Software Foundation, either version 3 of the License, or 
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful, 
# but WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License 
# along with this program. If not, see <https://www.gnu.org/licenses/>. 

pkgname="raccoonlock"
pkgver="5.1.1"
pkgrel="1"
pkgdesc="A free, open-source, simple and powerful password manager."
arch=("x86_64")
url="https://codeberg.org/Autumn64/RaccoonLock"
depends=("openssl")
makedepends=("git" "nodejs" "npm")
license=("GPL")
source=("${pkgname}::git+https://codeberg.org/Autumn64/RaccoonLock.git")
sha256sums=("SKIP")

prepare(){
		cd "${srcdir}/${pkgname}"
		npm install
}

build(){
		cd "${srcdir}/${pkgname}"
		npx electron-builder -p never --linux
		cd "${srcdir}/${pkgname}/RaccoonReader"
		make
		cp raccoonreader "${srcdir}/${pkgname}/dist/linux-unpacked"
		cp oldreader "${srcdir}/${pkgname}/dist/linux-unpacked"
		cd "${srcdir}/${pkgname}/dist/"
		rm -rf RaccoonLock
		mv linux-unpacked RaccoonLock
}

package(){
		cd "${srcdir}/${pkgname}"
		mkdir -p "${pkgdir}/opt/"
		cp -rfv "${srcdir}/${pkgname}/dist/RaccoonLock" "${pkgdir}/opt"
		install -Dm 644 -v "${srcdir}/${pkgname}/icon.png" "${pkgdir}/usr/share/icons/RaccoonLock.png"
		cat << EOF > "RaccoonLock.desktop"
[Desktop Entry]

Type=Application
Version=1.0
Name=RaccoonLock
GenericName=Password manager
Comment=A free, open-source, simple and powerful password manager
Path=/opt/RaccoonLock
Exec=/opt/RaccoonLock/raccoonlock
Icon=RaccoonLock
Terminal=false
Categories=Utility
EOF
	install -Dm 755 -v "${srcdir}/${pkgname}/RaccoonLock.desktop" "${pkgdir}/usr/share/applications/RaccoonLock.desktop"
}
