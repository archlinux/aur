# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: David Birks <david@birks.dev>

pkgname=lens
pkgdesc='The Kubernetes IDE'
pkgver=6.1.1
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://k8slens.dev'
depends=('gtk3' 'libxss' 'nss')
makedepends=('npm' 'nodejs-lts-gallium' 'yarn')
optdepends=('kubectl: Kubernetes control, can be downloaded from settings'
            'helm: for Helm section, only useful if your deploy uses Helm or plan to use it')
conflicts=('lens-bin')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/lensapp/lens/archive/v${pkgver//+/-}.tar.gz"
        "${pkgname}.desktop")
b2sums=('91b4ac8b5d4a76ae763b920dea797aa5f7d6ae4a5dbfc6c4ec5bcf6b0b4ab943098a652c87adc38ae5920cc03923d8594eb295435d85a03a9a4cafd44012337b'
        '2aea209098a22d8e4b263a059f6e67b2a3e8f8dfb0c15ac81e33edb4c2be81fd7a6f419a04a77be5b5c8d81b160e6e3f159b4d8639ccab705fffecf149255a36')

build() {
  cd "${pkgname}-${pkgver//+/-}"
  export LANG=C LC_ALL=''
  make node_modules
  yarn download:binaries
  yarn run npm:fix-build-version
  make build-extensions
  yarn dist:dir
}

package() {
  # remove unwanted binaries
  rm -f "${srcdir}"/${pkgname}-${pkgver//+/-}/dist/linux-unpacked/resources/x64/{helm,kubectl}

  # copy the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/${pkgname}
  mv "${srcdir}"/${pkgname}-${pkgver//+/-}/dist/linux-unpacked/* \
    "${pkgdir}"/usr/share/${pkgname}

  # icon
  install -Dm 644 "${srcdir}"/${pkgname}-${pkgver//+/-}/build/icons/512x512.png \
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
