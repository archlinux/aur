# Maintainer: Gernot Pansy <notz76 at gmail dot com>
# based on openlens-bin

_pkgname=Freelens
pkgname=freelens-bin
pkgver=1.10.3 # datasource=github-releases depName=freelensapp/freelens
pkgrel=1
pkgdesc='Free Open Source Kubernetes IDE'
arch=('x86_64' 'aarch64')
license=('MIT')
url='https://freelens.app/'
depends=('gtk3' 'nss')
options=('!debug' '!strip' '!emptydirs')
source=("freelens.desktop")
source_x86_64=(${_pkgname}-${pkgver}-x86_64.AppImage::"https://github.com/freelensapp/freelens/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.AppImage")
source_aarch64=(${_pkgname}-${pkgver}-aarch64.AppImage::"https://github.com/freelensapp/freelens/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.AppImage")
b2sums=('e2fe3e0c27ab531419ebaf2b233dd25ef09e9c5d8da607295ce5438c5277461bfa653fba07f94021788b758bb05af4c2295e815a7c3254385ec1829650260154')
b2sums_x86_64=('b1f334b619ad73aac5dcf6e21172aa27fa19d774af686cbbaba773445cc1884ecf16c94fd36e2db1ff5e9a8308ac5a278cefdd60696a7f4f75a9ad2d0bafc23b')
b2sums_aarch64=('e6f481e3ec402eef8961d917994e78547309f159d14e325a7f7c8611ebc133698c61490b81cb58b28c2c19fcf134e33676f6b878a296d61dedbaa2a8bfdafdb4')

prepare() {
  chmod +x "${_pkgname}-${pkgver}-${CARCH}.AppImage"
  "./${_pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract
}

package() {
  # move the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/freelens
  mv "${srcdir}"/squashfs-root/* \
    "${pkgdir}"/usr/share/freelens

  # icon
  install -Dm 644 "${pkgdir}"/usr/share/freelens/usr/share/icons/hicolor/512x512/apps/freelens.png \
    "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/freelens.png

  # desktop file
  install -Dm 644 "${srcdir}"/freelens.desktop \
    "${pkgdir}"/usr/share/applications/freelens.desktop

  # symlink binary
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /usr/share/freelens/freelens \
    "${pkgdir}"/usr/bin/freelens

  # clean and fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  chmod -x "${pkgdir}"/usr/share/freelens/*.so
  rm -rf "${pkgdir}"/usr/share/freelens/AppRun
  rm -rf "${pkgdir}"/usr/share/freelens/freelens.desktop
  rm -rf "${pkgdir}"/usr/share/freelens/usr
  rm -rf "${pkgdir}"/usr/share/freelens/resources/extensions/*/dist/*-arm64
}
