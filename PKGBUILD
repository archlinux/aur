# Maintainer: OxiRoute maintainers <https://github.com/oxiroute/oxiroute/issues>

pkgname=oxiroute
pkgver=6.5.0
pkgrel=2
pkgdesc='Pingora-based HTTP, TCP, and RTMP proxy runtime'
arch=('x86_64')
url='https://github.com/brauliobo/oxiroute'
license=('Apache-2.0')
depends=('ca-certificates' 'gcc-libs' 'glibc' 'openssl' 'systemd>=257')
makedepends=('rust>=1.97')
optdepends=('certbot: provide certificate lineages consumed by configured Certbot sources')
backup=('etc/oxiroute/oxiroute.env'
        'etc/oxiroute/oxiroute.kdl'
        'etc/oxiroute/oxiroute.lua')
install=oxiroute.install
_target='x86_64-unknown-linux-gnu'
source=("oxiroute-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/oxiroute-${pkgver}.tar.gz"
        'oxiroute.service'
        'oxiroute.sysusers'
        'oxiroute.tmpfiles'
        'oxiroute.modules'
        'oxiroute.env'
        'oxiroute.kdl'
        'oxiroute.lua'
        'README.md')
sha256sums=('e034e61e74618edc7938b83490129965c9b366fc73d891bb451e20c415a5d069'
             '574eab59174656b0813499ed1c9bca8be5a6e2cf69a98e8327f376e1c0b83b1b'
            'ece087105e74910e9d4a6c3551082828378ac5c62fc15e97a755a3bc93020e72'
             '502dbc96a4f316ff7375cf90da32457b6003723a744825f04cec8a624974a356'
             'c23385c6ee614b2b91e8fcd1c535038fc2dd9a115b77db368fa2fda4d9d698a1'
             'd56db017915b82ad6204bb4de1aa268cc41586eafcbbf35194366b32ed02f19a'
            '57e5cb6cf58a38b6c5efd99e0b5a9a36bac3fafba438059a8396b07e9b6e80a9'
            'f55a08f56ff139b566afac6b0c9cbbc4ed08f69a7e04810128bfb8c98a0f0564'
             '5b4438cec129dd1814e377567cb4c0b89e49c8bc27ee9403bc210682d3fa62ce')

prepare() {
  cd "oxiroute-${pkgver}"
  cargo fetch --locked --target "${_target}"
}

# Copy of scripts/lib/reject-isa-flags.sh (the pinned release archive predates it; scripts/test-verify-baseline-isa.sh
# runs the same cases on both). The binary must stay generic x86-64 and pick AVX at run time, so a CPU target in
# RUSTFLAGS or CFLAGS (makepkg.conf of x86-64-v3 distributions) fails the build; set generic flags in ~/.makepkg.conf.
isa_rust_re='^((-C|--codegen)=?)?target-(cpu|feature)'
isa_c_re='^-(march=|mtune=|m(avx|sse3|ssse3|sse4|bmi|fma|popcnt|lzcnt|movbe|f16c|aes|pclmul|sha|vaes|vpclmulqdq|gfni|adx|xop|tbm|evex512))'
isa_ok_re='^-(march=x86-64(-v1)?|mtune=generic)$'
reject_isa_flags() {
  local name flag re tokens
  for name in $(compgen -v); do
    case ${name} in
      RUSTFLAGS | CARGO_ENCODED_RUSTFLAGS | CARGO_BUILD_RUSTFLAGS | CARGO_TARGET_*_RUSTFLAGS) re=${isa_rust_re} ;;
      CC | CXX | CFLAGS | CXXFLAGS | CPPFLAGS | ASFLAGS | HOST_C*FLAGS | TARGET_C*FLAGS | CC_* | CXX_* | CFLAGS_* | CXXFLAGS_*)
        re=${isa_c_re} ;;
      *) continue ;;
    esac
    read -ra tokens <<<"${!name//$'\x1f'/ }"
    for flag in "${tokens[@]}"; do
      [[ ${flag} =~ ${re} && ! ${flag} =~ ${isa_ok_re} ]] || continue
      printf 'build refused: %s carries %s; release binaries stay generic x86-64 and pick AVX at run time\n' "${name}" "${flag}" >&2
      return 1
    done
  done
}

build() {
  reject_isa_flags
  cd "oxiroute-${pkgver}"
  export CARGO_NET_OFFLINE=true
  export OPENSSL_NO_VENDOR=1
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/usr/src/debug/${pkgname} --remap-path-prefix=${CARGO_HOME:-${HOME}/.cargo}=/usr/src/debug/${pkgname}/cargo"
  cargo build --frozen --release \
    --package oxiroute \
    --package oxiroute-supervisor-process \
    --target "${_target}" \
    --jobs 3
}

package() {
  cd "oxiroute-${pkgver}"

  install -Dm755 "target/${_target}/release/oxiroute" \
    "${pkgdir}/usr/bin/oxiroute"
  ln -s oxiroute "${pkgdir}/usr/bin/oxr"
  install -d -m755 "${pkgdir}/usr/lib/oxiroute"
  install -m755 "target/${_target}/release/oxiroute-worker-launcher" \
    "${pkgdir}/usr/lib/oxiroute/oxiroute-worker-launcher"
  # Some Arch glibc crt objects overstate their ISA requirement; all compiled code targets baseline x86-64.
  objcopy --remove-section .note.gnu.property "${pkgdir}/usr/bin/oxiroute"
  objcopy --remove-section .note.gnu.property \
    "${pkgdir}/usr/lib/oxiroute/oxiroute-worker-launcher"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/oxiroute.service" \
    "${pkgdir}/usr/lib/systemd/system/oxiroute.service"
  install -Dm644 "${srcdir}/oxiroute.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/oxiroute.conf"
  install -Dm644 "${srcdir}/oxiroute.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/oxiroute.conf"
  install -Dm644 "${srcdir}/oxiroute.modules" \
    "${pkgdir}/usr/lib/modules-load.d/oxiroute.conf"
  install -Dm644 "${srcdir}/oxiroute.env" \
    "${pkgdir}/etc/oxiroute/oxiroute.env"
  install -Dm644 "${srcdir}/oxiroute.kdl" \
    "${pkgdir}/etc/oxiroute/oxiroute.kdl"
  install -Dm644 "${srcdir}/oxiroute.lua" \
    "${pkgdir}/etc/oxiroute/oxiroute.lua"
  install -Dm644 "${srcdir}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/arch-packaging.md"
  install -Dm644 docs/MANAGEMENT_CLI.md \
    "${pkgdir}/usr/share/doc/${pkgname}/management-cli.md"
}
