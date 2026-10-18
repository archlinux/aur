# Maintainer: w
# Gemini uses the system Electron runtime. The upstream application stays proprietary.
pkgname=gemini-desktop-bin
pkgver=1.15.0
pkgrel=1
pkgdesc='Google Gemini desktop client with system Electron and Rust Linux integration'
arch=('x86_64')
url='https://gemini.google.com/'
license=('LicenseRef-proprietary' 'MIT')
depends=('electron44' 'at-spi2-core' 'glib2' 'glibc' 'libgcc' 'bash' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('7zip' 'asar' 'ast-grep' 'cargo' 'nodejs')
optdepends=(
  'xdg-desktop-portal: global shortcuts and screen sharing on Wayland'
  'pipewire: screen sharing on Wayland'
  'libappindicator: tray icon support'
)
provides=('gemini-desktop')
conflicts=('gemini-desktop')
options=('!lto')
source=(
  "Gemini-${pkgver}.crx3::https://dl.google.com/release2/Google%20DeepMind/a3szjpb4hbjtiluhshjitvfqki_${pkgver}/-533dd80c-942a-4464-b6a9-2e59428d784e-_${pkgver}_all_hme4czbelpy4muj7tohqfskwym.crx3"
  'Cargo.toml'
  'Cargo.lock'
  'build.rs'
  'native.rs'
  'native-a11y.rs'
  'native-x11.rs'
  'prepare.cjs'
  'linux-patches.json'
  'linux.cjs'
  'gemini-desktop'
  'com.google.Gemini.desktop'
  'README.md'
  'LICENSE'
  'UPSTREAM-NOTICE'
)
noextract=("Gemini-${pkgver}.crx3")
sha256sums=('098f21d68d3325eb2c09c15c6285d146caf04f3d7d99b99d8c9a20eb13983abe'
            'c35a6d50d39ec9a67d72b7c35acca38e833ca7dc519e1fcc105443d049fa65ff'
            '0523bc49cbe47e0c040c944f90481221c2c8e30692d272f40a17fe36b9d0ca9f'
            'b5db441f474cee3177158a8a2be239280f6410123111fde94ce2554933506b1c'
            '921cfadfcbc1d6f642e191ebbb03f0af46f2c7a05e10ef0b80450ff7d5315a02'
            '3127acea99660fc6b427b2167f03352735a828633b333c9078a9690a4b0a897d'
            'fcd3b2497016656548768f832d7dd5fcd62e5343eaa00b9a344eb434f8f67877'
            '5b5dae58234c0cc93c4eddff5d49a3192965507fe1b39455e894738aa53cdcb3'
            '40f2c9efb3f454873f68eb98cde6353f1da6002ceb20c6fcf1f61d84afcb4add'
            'e7cc85cce47bd15ca1ba87865521eeaf629165f2a8b4431111d3c25c5a7f12fd'
            '894d2d741607a2b38fb23cdb82acf8459c078cac92c851d8581de890cf7bccfe'
            '952f3ae8fb865b676a6dba397446e577ca90a8aedf7613fdbf4ffd314182f7a2'
            'af7628b60edcfc6b9c7760b2fd2a19f942e6503f73564bfe074aa17d35edb2bd'
            '2220ca143c96ec35458d49ab3df5a6fc19e97e2f5facfe2337fa3aeb46a32fed'
            '2a96b0453a6f0d8934d7f2c4a9b52c311e9543b4f387321f6876b0160bb607b6')

prepare() {
  7z x -y "Gemini-${pkgver}.crx3" "-o${srcdir}/installer" \
    "GeminiSetup-${pkgver}_uncompressed.exe" >/dev/null
  7z x -y "installer/GeminiSetup-${pkgver}_uncompressed.exe" "-o${srcdir}/payload" \
    "app-${pkgver}/resources/*" >/dev/null
  asar extract "payload/app-${pkgver}/resources/app.asar" app
  rm -f app/src/gemini_native.node app/assets/icon.ico
  node prepare.cjs app linux-patches.json
  install -Dm644 linux.cjs app/src/linux.cjs
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cargo build --release --locked --offline --target "${CARCH}-unknown-linux-gnu" --target-dir target
  install -Dm755 "target/${CARCH}-unknown-linux-gnu/release/libgemini_native.so" app/src/gemini_native.node
}

check() {
  node --check app/src/main.js
  node --check app/src/linux.cjs
}

package() {
  install -d "${pkgdir}/usr/lib/gemini-desktop"
  cp -a app/. "${pkgdir}/usr/lib/gemini-desktop/"
  install -Dm755 gemini-desktop "${pkgdir}/usr/bin/gemini-desktop"
  install -Dm644 com.google.Gemini.desktop "${pkgdir}/usr/share/applications/com.google.Gemini.desktop"
  install -Dm644 app/assets/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gemini-desktop.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 UPSTREAM-NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/UPSTREAM-NOTICE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
