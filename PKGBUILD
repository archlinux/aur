# Maintainer: panxuc <https://github.com/panxuc>

pkgname=fcitx5-wetypex
pkgver=3.0.1.684
pkgrel=3
pkgdesc="Native Linux compatibility layer for WeType on Fcitx5"
arch=('x86_64' 'aarch64')
url="https://github.com/panxuc/fcitx5-wetypex"
license=('MIT' 'ISC' 'BSD-2-Clause' 'curl' 'Apache-2.0 WITH LLVM-exception')
options=('!debug')
depends=(
    'fcitx5>=5.1.9'
    'fcitx5-qt'
    'libime>=1.1.15'
    'libc++'
    'json-c'
    'curl'
    'libssl.so'
    'libcrypto.so'
    'bubblewrap'
    'util-linux'
    'python'
    'python-fonttools'
    'python-pillow'
    'fontconfig'
    'wayland'
    'qt6-base'
    'qt6-svg'
    'qt6-webengine'
    'layer-shell-qt'
    'wl-clipboard'
    'pipewire'
    'ffmpeg'
    'libnotify'
    'polkit'
)
optdepends_aarch64=('qemu-user: compatibility provider for older ARM64 CPUs')

makedepends=('cmake' 'clang' 'git' 'boost' 'openssl')
optdepends=('fcitx5-configtool: manage input methods')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}-${pkgrel}/${pkgname}-${pkgver}.tar.gz"
    'https://curl.se/download/curl-8.22.0.tar.xz'
    'libkqueue::git+https://github.com/mheily/libkqueue.git#commit=46a3e130f88b0b0742575dcb01d77e336538024b'
)
sha256sums=("f13162d1a13d715fb256e3760be54b4163d986a7b0bf88e1a9c69740dfb5fed6" "f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224dfd915a2a5f4f7" "SKIP") # first checksum is filled by the release workflow
install=fcitx5-wetypex.install


source_aarch64=(
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/libcxx-18.1.8.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/libcxxabi-18.1.8.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/cmake-18.1.8.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/runtimes-18.1.8.src.tar.xz'
)
sha256sums_aarch64=('bdecf90be0072bc720fd5c9c8ab061cdb197edd0c8ad3e170dc3e6bfaa49f388'
  '256c30d724eeb72713bc08ae1692f53aaf4ebe8a1d662c92bf59e69d6c53dce9'
  '59badef592dd34893cd319d42b323aaa990b452d05c7180ff20f23ab1b41e837'
  '9997c2e91e5438e2963306ba5019d85b5384b467535632738d8670ced8f07cb3')

build() {
  local arm_args=()
  if [[ "$CARCH" == aarch64 ]]; then
    arm_args=(-DFETCHCONTENT_SOURCE_DIR_WETYPEX_LIBCXX="${srcdir}/libcxx-18.1.8.src"
      -DFETCHCONTENT_SOURCE_DIR_WETYPEX_LIBCXXABI="${srcdir}/libcxxabi-18.1.8.src"
      -DFETCHCONTENT_SOURCE_DIR_WETYPEX_CMAKE="${srcdir}/cmake-18.1.8.src"
      -DFETCHCONTENT_SOURCE_DIR_WETYPEX_RUNTIMES="${srcdir}/runtimes-18.1.8.src")
  fi
    cmake -S "${srcdir}/${pkgname}-${pkgver}" -B "${srcdir}/build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib -DWETYPE_LAYER_SHELL=ON \
        -DFETCHCONTENT_SOURCE_DIR_KQUEUE="${srcdir}/libkqueue" \
        -DFETCHCONTENT_SOURCE_DIR_WETYPEX_CURL="${srcdir}/curl-8.22.0" "${arm_args[@]}"
    cmake --build "${srcdir}/build" --parallel
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
    # makepkg resolves SONAME dependencies only for executable ELF files.
    chmod 755 "${pkgdir}/usr/lib/fcitx5-wetypex/locale.so" \
        "${pkgdir}/usr/lib/fcitx5-wetypex/wcwss_bridge.so"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/NOTICE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
