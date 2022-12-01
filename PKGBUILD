# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: David Birks <david@birks.dev>

pkgname=lens
pkgdesc='The Kubernetes IDE'
pkgver=6.2.4
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
b2sums=('849a67c6c581e7ad8205a0bfc0c4affd4c0220cd88d7e89e2f7f2265918d5785f42946a5c78c2cb7e9ff405fcf10306786f044c139423677fc088b001611e64d'
        '2aea209098a22d8e4b263a059f6e67b2a3e8f8dfb0c15ac81e33edb4c2be81fd7a6f419a04a77be5b5c8d81b160e6e3f159b4d8639ccab705fffecf149255a36')

build() {
  cd "${pkgname}-${pkgver//+/-}"
  export LANG=C LC_ALL=''
  make node_modules
  yarn download:binaries
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
