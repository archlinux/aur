pkgname=animeshelf
pkgver=0.1.0
pkgrel=1
pkgdesc='Local-first anime ranking and tier-list management app.'
arch=('x86_64')
url='https://github.com/mengdehong/AnimeShelf'
license=('custom')
depends=('gtk3')
makedepends=('clang' 'cmake' 'flutter' 'git' 'ninja' 'pkgconf')
options=('!strip')
source=(
  "${pkgname}::git+${url}.git#tag=v${pkgver}"
  'animeshelf.desktop'
  'animeshelf.jpg'
)
sha256sums=(
  'SKIP'
  '5340512162bb77e4fe7f953bad1f54f2865196d065904115ad7018da652781a7'
  '496c5139a8b80176240cf48f34048d3c9602278762584349d2ac45bfa96e48e7'
)

build() {
  cd "${srcdir}/${pkgname}" || return 1

  export FLUTTER_SUPPRESS_ANALYTICS=true

  flutter config --enable-linux-desktop
  flutter pub get
  flutter build linux --release
}

package() {
  cd "${srcdir}/${pkgname}" || return 1

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a build/linux/x64/release/bundle/. "${pkgdir}/opt/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/anime_shelf" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/animeshelf.desktop" \
    "${pkgdir}/usr/share/applications/animeshelf.desktop"
  install -Dm644 "${srcdir}/animeshelf.jpg" \
    "${pkgdir}/usr/share/pixmaps/animeshelf.jpg"
}
