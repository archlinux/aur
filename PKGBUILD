# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: David Birks <david@birks.dev>

pkgname=lens
pkgdesc='The Kubernetes IDE'
pkgver=5.5.1
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://k8slens.dev'
depends=('gtk3' 'libxss' 'nss')
makedepends=('npm' 'nodejs-lts-fermium' 'yarn')
optdepends=('kubectl: Kubernetes control, can be downloaded from settings'
            'helm: for Helm section, only useful if your deploy uses Helm or plan to use it')
conflicts=('lens-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lensapp/lens/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
b2sums=('f8ab7d3026253b530e92ee4b6ace95486e122f31a7bcc6fc52334da84c66f0a28312bc980b48b9f1963a43231953b99c09af73ff640d648c7d7e3537d3b61a82'
        '2aea209098a22d8e4b263a059f6e67b2a3e8f8dfb0c15ac81e33edb4c2be81fd7a6f419a04a77be5b5c8d81b160e6e3f159b4d8639ccab705fffecf149255a36')

build() {
  cd "${pkgname}-${pkgver}"
  make node_modules
  yarn download:binaries
  yarn run npm:fix-build-version
  make build-extensions
  yarn dist:dir
}

package() {
  # remove unwanted binaries
  rm -f "${srcdir}"/${pkgname}-${pkgver}/dist/linux-unpacked/resources/x64/{helm,kubectl}

  # copy the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/${pkgname}
  mv "${srcdir}"/${pkgname}-${pkgver}/dist/linux-unpacked/* \
    "${pkgdir}"/usr/share/${pkgname}

  # icon
  install -Dm 644 "${srcdir}"/${pkgname}-${pkgver}/build/icons/512x512.png \
    "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/open-${pkgname}.png

  # desktop file
  install -Dm 644 "${srcdir}"/${pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${pkgname}.desktop

  # symlink binary
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /usr/share/${pkgname}/open-lens \
    "${pkgdir}"/usr/bin/open-lens

  # symlink helm binary
  ln -sf /usr/bin/helm \
    "${pkgdir}"/usr/share/${pkgname}/resources/x64/helm
}
