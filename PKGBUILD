# Maintainer: lightjunction

pkgname=biliup-git
pkgver=1.3.4.r7.gc2a8f41
pkgrel=1
pkgdesc='Automatic livestream recording and Bilibili video uploader'
arch=('x86_64' 'aarch64')
url='https://github.com/biliup/biliup'
license=('MIT' 'Apache-2.0' 'OFL-1.1')
options=('!lto')
depends=('ffmpeg' 'gcc-libs')
makedepends=('git' 'nodejs>=20.9' 'npm' 'rust')
provides=('biliup')
conflicts=('biliup' 'biliup-rs-bin')

_upstream=biliup
_noto_cjk_commit=f8d157532fbfaeda587e826d4cd5b21a49186f7c
_google_fonts_commit=47d54ca1ebb14fd864695f1d39dc734f39017c33

source=(
  "${_upstream}::git+https://github.com/biliup/biliup.git#branch=master"
  "NotoSansSC-Regular.otf::https://raw.githubusercontent.com/notofonts/noto-cjk/${_noto_cjk_commit}/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Regular.otf"
  "NotoEmoji.ttf::https://raw.githubusercontent.com/google/fonts/${_google_fonts_commit}/ofl/notoemoji/NotoEmoji%5Bwght%5D.ttf"
  "NotoSansCJK-OFL.txt::https://raw.githubusercontent.com/notofonts/noto-cjk/${_noto_cjk_commit}/Sans/LICENSE"
  "NotoEmoji-OFL.txt::https://raw.githubusercontent.com/google/fonts/${_google_fonts_commit}/ofl/notoemoji/OFL.txt"
)
sha256sums=(
  'SKIP'
  '2c76254f6fc379fddfce0a7e84fb5385bb135d3e399294f6eeb6680d0365b74b'
  'de6c18832938afc99caf132b39d6a30a19bac7f2e812e28db2535b4608d27551'
  '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2'
  '500bb1ccf43df7bbb522112f9133a52b16e1c35e809632f5d8609b179152de5b'
)

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --tags --long --abbrev=7 | sed -E 's/^v//; s/-([0-9]+)-g([0-9a-f]+)/.r\1.g\2/'
}

build() {
  cd "${srcdir}/${_upstream}"
  npm ci --no-audit --no-fund --registry=https://registry.npmjs.org/ --replace-registry-host=always
  npm run build
  CARGO_TARGET_DIR="${srcdir}/target" cargo build --locked --release -p biliup-cli --bin biliup
}

package() {
  install -Dm755 "${srcdir}/target/release/biliup" "${pkgdir}/usr/bin/biliup"
  install -Dm644 "${srcdir}/${_upstream}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "${srcdir}/NotoSansSC-Regular.otf" "${pkgdir}/usr/share/biliup/render-tools/fonts/NotoSansSC-Regular.otf"
  install -Dm644 "${srcdir}/NotoEmoji.ttf" "${pkgdir}/usr/share/biliup/render-tools/fonts/NotoEmoji.ttf"
  ln -s /usr/share/biliup/render-tools "${pkgdir}/usr/bin/render-tools"

  install -Dm644 "${srcdir}/${_upstream}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_upstream}/crates/danmaku-factory/LICENSE-DanmakuFactory" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-DanmakuFactory"
  install -Dm644 "${srcdir}/${_upstream}/crates/danmaku-factory/THIRD-PARTY-NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.txt"
  install -Dm644 "${srcdir}/NotoSansCJK-OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NotoSansCJK-OFL.txt"
  install -Dm644 "${srcdir}/NotoEmoji-OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NotoEmoji-OFL.txt"
}
