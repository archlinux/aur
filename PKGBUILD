# Maintainer: gnoooo

pkgname=typst-ide
pkgver=1.2.6
pkgrel=1
pkgdesc="A modern IDE for Typst"
arch=('x86_64')
url="https://github.com/gnoooo/typst-ide"
license=('GPL-3.0')

depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
)

makedepends=(
  'cargo'
  'nodejs'
  'npm'
  'pkg-config'
)
options=('!strip')

source=("${url}/archive/v${pkgver}.tar.gz" "typst-ide.desktop")

sha256sums=('SKIP' 'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"

  cd frontend
  npm ci
  npm run build
  cd ..

  export CFLAGS="${CFLAGS/-flto=auto}"
  export RUSTFLAGS="${RUSTFLAGS:-} -C linker=cc -C link-arg=-Wl,--no-as-needed"

  cargo build --release -p app
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "target/release/app" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "$srcdir/typst-ide.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "crates/app/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -Dm644 "crates/app/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 "crates/app/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
