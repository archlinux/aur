# Maintainer: klpod221 <klpod221@gmail.com>

_pkgauthor=klpod221
_pkgname=kerminal
pkgname=kerminal
pkgver=2.5.5
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Modern Terminal Emulator & SSH Manager"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/klpod221/kerminal"
license=('MIT')
makedepends=(
  'rust'
  'cargo'
  'nodejs>=20'
  'npm'
  'webkit2gtk-4.1'
  'gtk3'
  'glib2'
  'cairo'
  'libsoup3'
  'gdk-pixbuf2'
)

depends=(
  'glibc'
  'gcc-libs'
  'glib2'
  'gtk3'
  'cairo'
  'webkit2gtk-4.1'
  'libsoup3'
  'gdk-pixbuf2'
  'hicolor-icon-theme'
)

source=(
  "git+${url}.git#tag=v${pkgver}"
  "${pkgname}.desktop"
)
sha256sums=('7f0d6f3197e95f66a7f3ea5efaa7332b92db103d49bd8f9b5a9da15bf19afb39'
            '2012d68d4a1a7672497eaad7db0d398356e230e588344038d7151d4eeee9d3f6')

prepare() {
  cd "${_pkgname}"
  git checkout "v${pkgver}"
  npm install
}

build() {
  cd "${_pkgname}"
  
  export CARGO_TARGET_DIR="target"
  cargo tauri build --no-bundle
}

package() {
    cd "${_pkgname}"

    install -Dm755 "src-tauri/target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "src-tauri/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
        
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
