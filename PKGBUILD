# Maintainer: gnoooo

pkgname=typst-ide
pkgver=1.8.1
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
  'lld'
  'nodejs'
  'npm'
  'pkg-config'
)
options=('!strip')

source=("${url}/archive/v${pkgver}.tar.gz" "typst-ide.desktop")

# Verify against the SHA256SUMS published with the GitHub release.
# The tarball sum must be recomputed after each new tag.
sha256sums=('2d40553ff2a1bbef42d7702b5638e4cae0b6be93470a19bbcbfb2a5119d5e55f'
            '1d5284711e5c6fb212093845eb3c74c17ac0221f4f4d0025c9b14633646b3f84')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"

  cd frontend
  npm ci
  npm run build
  cd ..

  export CFLAGS="${CFLAGS/-flto=auto}"
  export RUSTFLAGS="${RUSTFLAGS:-} -C linker=cc -C link-arg=-Wl,--no-as-needed -C link-arg=-fuse-ld=lld"

  # --locked honore le Cargo.lock audite, une crate transitive
  # neuve ne doit pas se compiler sans verification.
  cargo build --release --locked -p typst-ide-app
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "target/release/typst-ide" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "$srcdir/typst-ide.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "crates/app/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -Dm644 "crates/app/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 "crates/app/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
