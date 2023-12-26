# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=appimaged-bin
pkgdesc="Deprecated: A daemon that monitors the system and integrates AppImages"
url="https://github.com/AppImageCommunity/appimaged"
pkgver=r199
pkgrel=3
arch=(x86_64)
license=(MIT)
provides=(appimaged)
conflicts=(appimaged)
depends=(gdk-pixbuf2)
source=(
  "appimaged.AppImage"::"https://github.com/AppImageCommunity/appimaged/releases/download/continuous/appimaged-x86_64.AppImage"
  "LICENSE"::"https://github.com/AppImageCommunity/appimaged/raw/continuous/LICENSE"
)
sha256sums=(
  0cb439698ccd542c622c5aec5496efb0fe6a56575b16be9e77bd5467b97b4555
  b54da09f0d48f1c42a1b27035711ed41494551ed8a20b991746e669e6f944a94
)

prepare() {
  chmod +x appimaged.AppImage
}

package() {
  for pattern in usr/{lib/systemd,bin,share/{applications,icons,metainfo}}; do
    ./appimaged.AppImage --appimage-extract "${pattern}"
  done

  for directory in $(find squashfs-root -type d); do
    chmod 755 "${directory}"
    rmdir --parents --ignore-fail-on-non-empty "${directory}"
  done

  mv -fT squashfs-root "${pkgdir}"

  mkdir --parents "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
}
