# Maintainer: Gernot Pansy <notz76 at gmail dot com>
# based on openlens-bin

_pkgname=Freelens
pkgname=freelens-bin
pkgver=1.7.0 # datasource=github-releases depName=freelensapp/freelens
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
b2sums_x86_64=('c1cdfb7bad7671318fe3f55e429c9bf583465f5d685178704ab92898a99dbe99ff1034a5594bddff0df6e8921daf432abeb29e763ca9105a1bc8abd82c51ad04')
b2sums_aarch64=('fba71d4a105e616f8bde9f90af4d2c91350c5f8ff50d0a121a8ada311ac5be0c6195c975514a2eb4d7f38fe5d881f738e33a0e782442500d91c465f062a0c83d')

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
