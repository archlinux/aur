# Maintainer: Gernot Pansy <notz76 at gmail dot com>
# based on openlens-bin

_pkgname=Freelens
pkgname=freelens-bin
pkgver=1.10.2 # datasource=github-releases depName=freelensapp/freelens
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
b2sums_x86_64=('fda1d56ebdc13c5aa0db281895514d14e14a8b2a2a983c17a0483bb52a70bb2eac6ccae3e73a0eae511fc077aeab4e3b12d8c3b80d448587457c5958d4193687')
b2sums_aarch64=('de78ea6233cf20123492cf15216156213ea6c08b9f1f21d8bdcc6d1e13157d5386a72f3ea5b845d2284e7e5c55069cf33729c6f85416e391f012ceb1e4cee00c')

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
