# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=appimaged-bin
pkgdesc="Deprecated: A daemon that monitors the system and integrates AppImages"
url="https://github.com/AppImageCommunity/appimaged"
pkgver=r199
pkgrel=4
arch=(x86_64)
license=(MIT)
provides=(appimaged)
conflicts=(appimaged)
depends=(gdk-pixbuf2)
options=(!strip)
source=(
  "appimaged.AppImage"::"https://github.com/AppImageCommunity/appimaged/releases/download/continuous/appimaged-x86_64.AppImage"
  "LICENSE"::"https://github.com/AppImageCommunity/appimaged/raw/continuous/LICENSE"
  "appimaged.service"
  "appimaged-path.sh"
)
sha256sums=(
  0cb439698ccd542c622c5aec5496efb0fe6a56575b16be9e77bd5467b97b4555
  b54da09f0d48f1c42a1b27035711ed41494551ed8a20b991746e669e6f944a94
  SKIP
  SKIP
)

prepare() {
  chmod 755 appimaged.AppImage
}

package() {
  for pattern in usr/share/{applications,icons,metainfo}; do
    ./appimaged.AppImage --appimage-extract "${pattern}"
  done

  for directory in $(find squashfs-root -type d); do
    chmod 755 "${directory}"
    rmdir --parents --ignore-fail-on-non-empty "${directory}"
  done

  for file in $(find squashfs-root -type f); do
    chmod 644 "${file}"
  done

  mv -fT squashfs-root "${pkgdir}"

  install -Dm755 appimaged.AppImage "${pkgdir}/usr/bin/appimaged"
  install -Dm644 appimaged-path.sh --target-directory "${pkgdir}/etc/profile.d"
  install -Dm644 appimaged.service --target-directory "${pkgdir}/usr/lib/systemd/user"
  install -Dm644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
}
