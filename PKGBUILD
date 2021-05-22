# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'capstone' 'mbedtls' 'python' 'freetype2' 'file' 'gtk3' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'glm' 'llvm' 'nlohmann-json' 'librsvg')
source=("${pkgname}::git+https://github.com/WerWolv/ImHex.git#tag=v${pkgver}"
        imhex.desktop
        0001-Arch-Linux-customisations.patch)
cksums=('SKIP'
        '4178124713'
        '2359030413')
sha256sums=('SKIP'
            '72525512a241589cecd6141f32ad36cbe1b5b6f2629dd8ead0e37812321bdde6'
            '143067b3ab97f29436cd354e27b446cce8e176f61d8012f8a2980a3027fdec30')
b2sums=('SKIP'
        '7b2d029de385fdc2536f57a4364add9752b9a5dc31df501e07bff1fd69fdd1de2afa19a5ac5a4c87fbf21c5d87cc96d3fe30d58825c050f5a7d25f6d85d08efc'
        'bcc4d5d61ede3fa1f45fcc0d43cb06f7b97397847295509941c484352421e8c5a1973c368e8e22ffb9c3af174d9ebc669e86fdc06498bec20d4a54dd289aba04')

prepare() {
  git -C "${pkgname}" submodule update --init --recursive

  git -C "${pkgname}" apply ${srcdir}/*.patch
}

build() {
  cmake -B build -S "${pkgname}" \
    -Wno-dev \
    -D CMAKE_BUILD_TYPE=RelWithDebInfo \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D PROJECT_VERSION="${pkgver}"
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
  install -Dm0644 build/magic_dbs.mgc "${pkgdir}/usr/share/imhex/magic/imhex.mgc"
  install -Dm0644 -t "${pkgdir}/usr/share/imhex/resources" "${pkgname}/res/resources"/*

  # License
  install -Dm0644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Documentation
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgname}/README.md"
}
