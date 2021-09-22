# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'capstone' 'mbedtls' 'libssh2'
         'python' 'freetype2' 'file' 'gtk3' 'hicolor-icon-theme'
         'yara')
makedepends=('git' 'cmake' 'glm' 'llvm' 'nlohmann-json' 'librsvg')
source=("${pkgname}::git+https://github.com/WerWolv/ImHex.git#tag=v${pkgver}"
  0001-Set-correct-library-names.patch
  imhex.desktop)
cksums=('SKIP'
        '3656399322'
        '4178124713')
sha256sums=('SKIP'
            'a8f936c6685979f888a2008d9b407a556bd581d4655df1a88664cd35f7416d16'
            '72525512a241589cecd6141f32ad36cbe1b5b6f2629dd8ead0e37812321bdde6')
b2sums=('SKIP'
        '6e68b4674888b1888f1e2a9afb9b894f180e6823c3bc0579ca6ddbe99cc23ba167761d9122ed411e421e50a951276c4a5f34b13cfbb04081fca217b895603284'
        '7b2d029de385fdc2536f57a4364add9752b9a5dc31df501e07bff1fd69fdd1de2afa19a5ac5a4c87fbf21c5d87cc96d3fe30d58825c050f5a7d25f6d85d08efc')

prepare() {
  git -C "$pkgname" submodule update --init --recursive

  git -C "$pkgname" apply -v \
    "$srcdir/0001-Set-correct-library-names.patch"
}

build() {
  cmake -B build -S "$pkgname" \
    -Wno-dev \
    -D CMAKE_BUILD_TYPE=RelWithDebInfo \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D USE_SYSTEM_LLVM=ON \
    -D USE_SYSTEM_YARA=ON \
    -D PROJECT_VERSION="$pkgver"
  cmake --build build
}

package() {
  # Executable
  install -Dm0755 build/imhex "${pkgdir}/usr/bin/imhex"

  # Shared lib and plugins
  install -Dm0755 -t "${pkgdir}/usr/lib" build/plugins/libimhex/libimhex.so

  for plugin in builtin; do
    install -Dm0755 -t "${pkgdir}/usr/share/imhex/plugins" "build/plugins/$plugin/$plugin.hexplug"
  done

  # Desktop file(s)
  install -Dm0644 -t "${pkgdir}/usr/share/applications" imhex.desktop
  install -Dm0644 "${pkgname}/res/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/imhex.svg"
  for size in 32 48 64 128 256; do
    install -dm0755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    rsvg-convert -a -f png -w $size -o "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/imhex.png" \
      "${pkgname}/res/icon.svg"
  done

  install -Dm0644 "${pkgname}/res/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/imhex.svg"

  # Misc files
  install -Dm0644 -t "${pkgdir}/usr/share/imhex/resources" "${pkgname}/res/resources"/*

  # License
  install -Dm0644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Documentation
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgname}/README.md"
}
