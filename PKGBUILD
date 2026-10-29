# Maintainer: Gernot Pansy <notz76 at gmail dot com>
# based on openlens-bin

_pkgname=Freelens
pkgname=freelens-bin
pkgver=2.0.0 # datasource=github-releases depName=freelensapp/freelens
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
b2sums_x86_64=('4b60cf8275bbdc483422d40573359c214ad3e5017d158586e4eac1a0878d24d1dacdf59f0d6a820b7a142d71a0f0579adecb1f09719c59b773fa37968c40aedb')
b2sums_aarch64=('b1baf4ef0dd4f0ada87980386aeea8e6c7a2e61b81fd6622d31df7de31bf92b278a2d4d85f54c95db0e6e457ca9eb53b33f6ba73ef683bf10a15f1cf298082dc')

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
