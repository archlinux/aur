# Maintainer: Yakumo Saki <yakumo at ziomatrix dot org>
# Contributor: Xuanwo <xuanwo@archlinucn.org>
pkgname=clickup
pkgver=3.0.6
pkgrel=2
pkgdesc="Desktop app for clickup.com"
arch=('x86_64')
url="https://clickup.com"
license=('custom')
makedepends=('wget')
depends=('fuse2')
_filename="$pkgname-desktop-$pkgver-x86_64.AppImage"
source=("${_filename}::https://desktop.clickup.com/linux")
sha512sums=('b72b0ec7ac3373faba2a71b345d08bddd1098a2647f4e5bbab74154bcf3d4806f568f43cb7422dd5c2de38fd47d1850fdbd795c2d40a012d7e3f0a17db8de3c2')
options=('!strip')

# howto update
# wget https://desktop.clickup.com/linux
# sha512sum linux
#
# update sha512sum of this file.
# makepkg -Sf    to test.
#
# release
# makepkg --printsrcinfo > .SRCINFO
# git commit and git push
 

prepare() {
  rm -rf squashfs-root
  chmod +x $_filename
  ./$_filename --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=/opt/${pkgname}/$_filename %U|" squashfs-root/ClickUp.desktop

  wget -O terms.html https://clickup.com/terms
}

package() {
  # AppImage
  install -Dm755 $_filename "${pkgdir}/opt/${pkgname}/$_filename"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/$_filename" "${pkgdir}/usr/bin/${pkgname}"

  # LICENSES
  install -Dm644 terms.html "${pkgdir}/usr/share/licenses/${pkgname}/terms.html"
  install -Dm644 squashfs-root/LICENSE.electron.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 squashfs-root/LICENSES.chromium.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  # desktop entry
  install -Dm644 squashfs-root/ClickUp.desktop "${pkgdir}/usr/share/applications/clickup.desktop"
  install -Dm644 squashfs-root/ClickUp.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/clickup.png"
  chmod -R a+rX "${pkgdir}/usr/share/icons/hicolor"
}

