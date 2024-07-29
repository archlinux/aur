# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="qmc-decoder"
pkgver=2.5
_fs_abbrev="3605e869150032ffdd9eae3db93e12f8711a0c82"
pkgrel=1
pkgdesc="Fastest & best convert qmc 2 mp3 | flac tools"
arch=('any')
url="https://github.com/Presburger/${pkgname}"
license=('MIT')
makedepends=('cmake' 'gcc')
_pkgsrc="${pkgname}-${pkgver}"
_fs_src="filesystem-${_fs_abbrev}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${_fs_src}.tar.gz::https://github.com/gulrak/filesystem/archive/${_fs_abbrev}.zip")
sha256sums=('ae71b9192649f1fe5416a9c57cfd091daa03740079e94af71f3d2f5549b657ab'
            '99d81718857a495996577039d985df78ea97e4f0835650d6bcc59dfd5222e266')

prepare() {
  cd "${srcdir}"
  cp -r "${_fs_src}"/* "${_pkgsrc}/3rdparty/filesystem"
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

# check() {
#   cd "${srcdir}"
#   ctest --test-dir "${_pkgsrc}/build" --output-on-failure --stop-on-failure
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/decoder" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md"     "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
