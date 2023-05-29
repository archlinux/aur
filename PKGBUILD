# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: David Birks <david@birks.dev>

pkgname=lens
pkgdesc='The Kubernetes IDE'
pkgver=6.5.1
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://k8slens.dev'
depends=('gtk3' 'libxss' 'nss')
makedepends=('npm' 'nodejs-lts-gallium')
optdepends=('kubectl: Kubernetes control, can be downloaded from settings'
            'helm: for Helm section, only useful if your deploy uses Helm or plan to use it')
conflicts=('lens-bin')
install="${pkgname}.install"
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/lensapp/lens/archive/v${pkgver//+/-}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.install")
b2sums=('65f1e8483d1b0d7134c037e3407a10ea2279c0385998b5fea5c573182da73ace7638f547e22ac910a5c58ea4b25bcc868747bf56145064419a4bd3dc327047e2'
        '2aea209098a22d8e4b263a059f6e67b2a3e8f8dfb0c15ac81e33edb4c2be81fd7a6f419a04a77be5b5c8d81b160e6e3f159b4d8639ccab705fffecf149255a36'
        '47c4e6e7e4b895f55589b58ec32c31f29b487e41b07dc21d12dee2da6710fa40a9996abc02b1b7c073b08d972a988baf462c7a3becc8324dcc17934fdb2b207f')

build() {
  cd "${pkgname}-${pkgver//+/-}"
  export LANG=C LC_ALL=''
  npm run all:install
  npm run build:app -- --scope=open-lens -- --dir
}

package() {
  # remove unwanted binaries
  rm -f "${srcdir}"/${pkgname}-${pkgver//+/-}/open-lens/dist/linux-unpacked/resources/x64/{helm,kubectl}

  # copy the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/${pkgname}
  mv "${srcdir}"/${pkgname}-${pkgver//+/-}/open-lens/dist/linux-unpacked/* \
    "${pkgdir}"/usr/share/${pkgname}

  # icon
  install -Dm 644 "${srcdir}"/${pkgname}-${pkgver//+/-}/open-lens/build/icons/512x512.png \
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
