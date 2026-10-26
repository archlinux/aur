# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=MeoUI-b8ed876b66a5e69fd4986385c734b1a83c567be7
pkgname=meoui-qml
pkgver=1.0.4beta3
pkgrel=5
pkgdesc="MeoUI Qt Quick Material Design 3 component library"
arch=('x86_64')
url='https://github.com/QwQdoge/MeoUI'
license=('MIT' 'Apache-2.0' 'OFL-1.1')
depends=('qt6-declarative' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'qt6-tools' 'qt6-shadertools')
# The reviewed minimal train does not publish implicit split debug packages.
# MeoKDE's application style links the exported meoui_tokens CMake target.
options=('!debug' 'staticlibs')
source=('MeoUI-b8ed876b66a5e69fd4986385c734b1a83c567be7.tar.gz::https://codeload.github.com/QwQdoge/MeoUI/tar.gz/b8ed876b66a5e69fd4986385c734b1a83c567be7'
        'Apache-2.0.txt'
        'DankMaterialShell-MIT.txt'
        'OFL-Comfortaa.txt'
        'OFL-Roboto.txt')
sha256sums=('bf371809a8bf657ccb6fb2da8d7fc18fa1f86bc02b036e117cea193eb2a0631a'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '4cee96286c5b7da9763a4694868bb1853b33bb1558821e0c609ad2eabd426bfa'
            '25bddd6b7f7e5973b6ada98fd6c9b9f01d947948a935e5f80480eda24ddcd515'
            'ee94f8704aa81e9a3bf4271e8320e99d975a3ee08ea45a088b494b918476ec12')

build() {
  cmake -B build -S "$srcdir/$_srcdir" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DMEOUI_BUILD_SHOWCASE=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # Older immutable release tags declare these JavaScript modules in qmldir
  # but do not install them. Keep downstream tooling functional without
  # altering the pinned component source.
  install -Dm644 "$srcdir/$_srcdir/components/MeoMaterialShapes.js" \
    "$pkgdir/usr/lib/qt6/qml/MeoUI/components/MeoMaterialShapes.js"
  install -Dm644 "$srcdir/$_srcdir/showcase/SettingsPreviewSchemes.js" \
    "$pkgdir/usr/lib/qt6/qml/MeoUI/showcase/SettingsPreviewSchemes.js"
  install -Dm644 "$srcdir/$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_srcdir/THIRD_PARTY_NOTICES.md" \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
  for notice in Apache-2.0.txt \
                DankMaterialShell-MIT.txt \
                OFL-Roboto.txt \
                OFL-Comfortaa.txt; do
    install -Dm644 "$srcdir/$notice" \
      "$pkgdir/usr/share/licenses/$pkgname/$notice"
  done
}
