# Maintainer: bgme <i@bgme.me>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=naiveproxy
pkgdesc="A Proxy using Chrome's network stack to camouflage traffic with strong censorship resistence and low detectablility."
pkgver=150.0.7871.63_1
pkgrel=1
_pkgver=150.0.7871.63
_pkgrel=1
arch=('x86_64')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD-3-Clause')
depends=("gcc-libs" "glibc")
makedepends=("ninja" "gn" "ccache" "python")
checkdepends=("python" "openssl")

_PGO_PATH='chrome-linux-7871-1782236690-ee033e4bf26c147ed0557fd905d416dc66bc7545-3d4da56162112271e9a86f91f4696c964516a649.profdata'
_clang_path='clang-llvmorg-23-init-10931-g20b6ec66-11.tar.xz'

source=(
  "naiveproxy.service"
  "naiveproxy@.service"
  "${pkgname}-${_pkgver}-${_pkgrel}.tar.gz::https://github.com/klzgrad/naiveproxy/archive/refs/tags/v${_pkgver}-${_pkgrel}.tar.gz"
  "${_PGO_PATH}::https://storage.googleapis.com/chromium-optimization-profiles/pgo_profiles/${_PGO_PATH}"
  "${_clang_path}::https://commondatastorage.googleapis.com/chromium-browser-clang/Linux_x64/${_clang_path}"
)

noextract=(
  "${_clang_path}"
)

sha1sums=('f959ceed9d451e3344d99b2a1572ca27416a5675'
          '278983a6edd5477e8f6f0557ea206f236fdc51dc'
          'd3a76215018c1d18b42002d07f51bb2f0b624b2b'
          'ee033e4bf26c147ed0557fd905d416dc66bc7545'
          '5b60dac1119b64878996f18cb9eaca843581d076')
sha256sums=('8b56b5a401cb7f77b50376ec27e40445f4bdbe85890ab717327de187ded92c53'
            'dd8f8e154832d49795be417557db9cc408976cc324452715f5d796b40e5a752d'
            '05f7808b91fe07d2acfdac1a041ad93b6d5a13799b1429952b0c82bd1edbf8d1'
            '63118ef73e3d7fe033ef94c8b3d1751174504c32ee8fdecc081e4a17491926da'
            'de584381536aa5ba2403033c4f8b70f3c39c2e5d7fa87c953b7fd8bfbba0ee2a')

backup=('etc/naiveproxy/config.json')
provides=('naiveproxy')
conflicts=('naiveproxy')

prepare() {
  SRC_DIR="${srcdir}/${pkgname}-${_pkgver}-${_pkgrel}/src"

  mkdir -p "${SRC_DIR}/chrome/build/pgo_profiles"
  cp ${_PGO_PATH} "${SRC_DIR}/chrome/build/pgo_profiles/"

  mkdir -p "${SRC_DIR}/third_party/llvm-build/Release+Asserts"
  tar xJf ${_clang_path} -C "${SRC_DIR}/third_party/llvm-build/Release+Asserts/"
}

build() {
  SRC_DIR="${srcdir}/${pkgname}-${_pkgver}-${_pkgrel}/src"

  cd "${SRC_DIR}"

  export TMPDIR="$PWD/tmp"
  rm -rf "$TMPDIR"
  mkdir -p "$TMPDIR"

  out=out/Release
  flags="
    is_official_build=true
    exclude_unwind_tables=true
    enable_resource_allowlist_generation=false
    chrome_pgo_phase=2
    symbol_level=0"

  export CCACHE_SLOPPINESS=time_macros
  export CCACHE_BASEDIR="$PWD"
  export CCACHE_CPP2=yes
  CCACHE=ccache

  flags="$flags
    cc_wrapper=\"$CCACHE\""

  flags="$flags"'
    is_clang=true
    use_sysroot=false

    fatal_linker_warnings=false
    treat_warnings_as_errors=false

    is_cronet_build=true

    use_udev=false
    use_aura=false
    use_ozone=false
    use_gio=false
    use_platform_icu_alternatives=true
    use_glib=false
    is_perfetto_embedder=true

    disable_file_support=true
    enable_websockets=false
    use_kerberos=false
    disable_file_support=true
    disable_zstd_filter=false
    enable_mdns=false
    enable_reporting=false
    include_transport_security_state_preload_list=false
    enable_device_bound_sessions=false
    enable_bracketed_proxy_uris=true
    enable_quic_proxy_support=true
    enable_disk_cache_sql_backend=false

    use_nss_certs=false

    enable_backup_ref_ptr_support=false
    enable_dangling_raw_ptr_checks=false
  '

  # Disable CFI icall for linux x64
  # See https://github.com/llvm/llvm-project/issues/86430
  flags="$flags"'
    use_cfi_icall=false'

  rm -rf "./$out"
  mkdir -p out

  export DEPOT_TOOLS_WIN_TOOLCHAIN=0

  gn gen "$out" "--args=$flags $EXTRA_FLAGS"

  ninja -C "$out" naive
}

check() {
  SRC_DIR="${srcdir}/${pkgname}-${_pkgver}-${_pkgrel}"
  script_dir="${SRC_DIR}/tests"
  naive="${SRC_DIR}/src/out/Release/naive"

  cd /tmp
  python "${script_dir}/basic.py" --naive="$naive"
}

package() {
  pushd "${srcdir}"
  install -Dm644 naiveproxy.service "${pkgdir}/usr/lib/systemd/system/naiveproxy.service"
  install -Dm644 naiveproxy@.service "${pkgdir}/usr/lib/systemd/system/naiveproxy@.service"
  popd

  pushd "${srcdir}/${pkgname}-${_pkgver}-${_pkgrel}"
  install -d -m750 "${pkgdir}/etc/naiveproxy"
  install -Dm644 src/config.json "${pkgdir}/etc/naiveproxy/config.json"
  install -Dm755 src/out/Release/naive "${pkgdir}/usr/bin/naiveproxy"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/naiveproxy/README.md"
  install -Dm644 USAGE.txt "${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/naiveproxy/LICENSE"
  popd
}
