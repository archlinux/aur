# Maintainer: Keshav Bhatt <keshavnrj@gmail.com>

pkgname=glate
pkgver=4.6.0
pkgrel=1
pkgdesc="Translate text and listen to it, online or offline on your computer"
arch=('x86_64' 'aarch64')
url="https://github.com/keshavbhatt/glate-ng"
license=('GPL-3.0-or-later' 'LicenseRef-Ktechpit-Licensing-Module' 'MPL-2.0' 'MIT' 'ISC')
depends=(
  'qt6-base'
  'qt6-multimedia'
  'qt6-svg'
  'libxcb'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'pcre2'
  'qt6-tools'
)
# Mozilla's translation engine for offline mode, at the commit pinned in the
# app's cmake/FetchTranslationsEngine.cmake (GLATE_ENGINE_COMMIT), with only the
# submodules the build uses: the same archives as the Flathub manifest, so the
# build fetches nothing. Update them together with that pin.
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/keshavbhatt/glate-ng/archive/refs/tags/v${pkgver}.tar.gz"
        "translations-69455acaecbe.tar.gz::https://github.com/mozilla/translations/archive/69455acaecbe8650cdba988dbcf7c10ca20e7c48.tar.gz"
        "ssplit-cpp-a311f9865ade.tar.gz::https://github.com/browsermt/ssplit-cpp/archive/a311f9865ade34db1e8e080e6cc146f55dafb067.tar.gz"
        "sentencepiece-ae41b7740d70.tar.gz::https://github.com/browsermt/sentencepiece/archive/ae41b7740d7006596bb9257e83340b2620db9d00.tar.gz"
        "intgemm-f7401513da71.tar.gz::https://github.com/kpu/intgemm/archive/f7401513da71758dacce52fed1c7855549abee59.tar.gz"
        "ruy-2d950b3bfa7e.tar.gz::https://github.com/google/ruy/archive/2d950b3bfa7ebfbe7a97ecb44b1cc4da5ac1d6f0.tar.gz"
        "cpuinfo-5916273f79a2.tar.gz::https://github.com/pytorch/cpuinfo/archive/5916273f79a21551890fd3d56fc5375a78d1598d.tar.gz"
        "onnxjs-924924b08e95.tar.gz::https://github.com/browsermt/onnxjs/archive/924924b08e9596b41aeebada4a172f026be95f5a.tar.gz"
        "simd_utils-d0793d86aea9.tar.gz::https://github.com/browsermt/simd_utils/archive/d0793d86aea9036a5bc77b9ca7791dff024168ca.tar.gz")
noextract=(translations-69455acaecbe.tar.gz ssplit-cpp-a311f9865ade.tar.gz sentencepiece-ae41b7740d70.tar.gz intgemm-f7401513da71.tar.gz ruy-2d950b3bfa7e.tar.gz cpuinfo-5916273f79a2.tar.gz onnxjs-924924b08e95.tar.gz simd_utils-d0793d86aea9.tar.gz)
sha256sums=('14a486d0593dcc7359ea76b4b6fac315f95057698d514d98b6be7ab2ee5a3387'
            'd55b241742191d634622dbaf21d6af50d911bb5bf46fc781a32080f20823f2a4'
            '937ded1229ee69f340772056a4ff6daaede5b899f12c4c7b091c40f430c56fd8'
            '4d2148ae7e240cd113586004d2cf0102f7ab1bae363b91b2934ee83c5ae3dbbe'
            '8e827c445dbb1b117a9667616bac23b3c945e626da0a3466786cfd058ed2f41d'
            '6593ec4323ae69e542bde97711d5680069cb802301512063289b1103c5374244'
            'f3c16d5d393d6d1fa6b6ed8621dd0a535552df9bc88cbba739375dde38a93142'
            '3821ba42d187d7011cc860dc1133fb295ac9d97a0a35c5bf08554229fc7b44cd'
            '829325e164ee2be5dffed51ccf8cc4b776edbb4269d174e79f6708fd89fca59f')

_unpack() {
  mkdir -p "$2"
  bsdtar -xf "${srcdir}/$1" -C "$2" --strip-components 1
}

prepare() {
  cd "glate-ng-${pkgver}"
  _unpack translations-69455acaecbe.tar.gz third_party/translations
  _unpack ssplit-cpp-a311f9865ade.tar.gz third_party/translations/inference/3rd_party/ssplit-cpp
  _unpack sentencepiece-ae41b7740d70.tar.gz third_party/translations/inference/marian-fork/src/3rd_party/sentencepiece
  _unpack intgemm-f7401513da71.tar.gz third_party/translations/inference/marian-fork/src/3rd_party/intgemm
  _unpack ruy-2d950b3bfa7e.tar.gz third_party/translations/inference/marian-fork/src/3rd_party/ruy
  _unpack cpuinfo-5916273f79a2.tar.gz third_party/translations/inference/marian-fork/src/3rd_party/ruy/third_party/cpuinfo
  _unpack onnxjs-924924b08e95.tar.gz third_party/translations/inference/marian-fork/src/3rd_party/onnxjs
  _unpack simd_utils-d0793d86aea9.tar.gz third_party/translations/inference/marian-fork/src/3rd_party/simd_utils
  # The engine stamps its version with `git log`; archives carry no history, so
  # give the engine one empty commit to read.
  git -C third_party/translations init -q
  git -C third_party/translations -c user.name=makepkg -c user.email=makepkg@localhost \
    commit -q --allow-empty -m "translations 69455acaecbe"
}

build() {
  cmake -B build -S "glate-ng-${pkgver}" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGLATE_BUILD_TESTS=OFF \
    -DGLATE_ENGINE_PREFETCHED=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  cd "glate-ng-${pkgver}"
  install -Dm644 LICENSE LICENSING.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES"
}
