# Maintainer: Gernot Pansy <notz76 at gmail dot com>
# based on openlens-bin

_pkgname=Freelens
pkgname=freelens-bin
pkgver=1.5.3 # datasource=github-releases depName=freelensapp/freelens
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
b2sums_x86_64=('457d0dd6f7f42fa51807f4951e0b0bdee5c36cceba14c2eeaa74c45bf59916dc34fbe0ba71a046377a3ad779e3df57d80252616778fbd95ca9349d01aebdd036')
b2sums_aarch64=('cd822c287dad04a483fe5c28d180e8f449eceebd099305ca009db02e973c3fcd77416c95de6c9a18dda4a270bf94e9659a451430b196c6fe21fcfe47cef71d70')

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
