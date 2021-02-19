# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.7.0
pkgrel=1
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'capstone' 'llvm-libs' 'mbedtls' 'python' 'freetype2' 'file' 'hicolor-icon-theme')
makedepends=('cmake' 'glm' 'llvm' 'nlohmann-json')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        imhex.desktop
        0001-Arch-Linux-customisations.patch)
sha256sums=('891c9268dda958922698c6fdfcba34ec7b20853f3764fe9d58c4a932a6b0d3d8'
            '72525512a241589cecd6141f32ad36cbe1b5b6f2629dd8ead0e37812321bdde6'
            '8b73bc50fd0dd8c94c78a02361a974b7e3d813afe2c0a69ad1ecc22e70217206')
b2sums=('cd725290af8afdf83d08c78399e52420d983bd4cb3d91cbbd10d871fba2ee240286eae0de1495a63425f22ddd0c1d95ca8fe4cbcaf6164b3e13e6efb5875218e'
        '7b2d029de385fdc2536f57a4364add9752b9a5dc31df501e07bff1fd69fdd1de2afa19a5ac5a4c87fbf21c5d87cc96d3fe30d58825c050f5a7d25f6d85d08efc'
        '17d04544f0170716d68bb2e7d186302e29b094c3f416abe9b65f7e73b90ec03bf4234c42afbfc63c9adbb53585094e4dc443d1b44a77df639a1f344337c9235f')

prepare() {
  cd "${_pkgname}-${pkgver}"

  for f in "${srcdir}"/*.patch; do
    patch -Np1 -i $f
  done
}

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_VERSION="${pkgver}" \
    -Wno-dev
  make -C build
}

package() {
  # Executable
  install -Dm0755 build/imhex "${pkgdir}/usr/bin/imhex"

  # Shared lib and plugins
  install -Dm0755 -t "${pkgdir}/usr/lib" build/plugins/libimhex/libimhex.so

  for plugin in builtin; do
    install -Dm0755 -t "${pkgdir}/usr/lib/imhex/plugins" "build/plugins/$plugin/$plugin.hexplug"
  done

  # Desktop file(s)
  install -Dm0644 -t "${pkgdir}/usr/share/applications" imhex.desktop
  install -Dm0644 "${_pkgname}-${pkgver}/res/icon.png" "${pkgdir}/usr/share/icons/hicolor/72x72/apps/imhex.png"

  # Misc files
  install -Dm0644 -t "${pkgdir}/usr/share/imhex" \
    build/magic_dbs.mgc

  # License
  install -Dm0644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"


  # binary
  install -Dm0755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # license
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$_pkgname-$pkgver/LICENSE"

  # documentation
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$_pkgname-$pkgver/README.md"

  # desktop file(s)
  install -Dm0644 -t "$pkgdir/usr/share/applications" \
    "$pkgname.desktop"
  install -Dm0644 "$_pkgname-$pkgver/res/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/72x72/apps/$pkgname.png"
}
