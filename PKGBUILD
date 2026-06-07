# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname="robrix"
pkgname="${_pkgname}-git"
pkgver=1.0.0.alpha.1.r2741.20260605.7291b335
pkgrel=2
pkgdesc="Multi-Platform Matrix client. Written in Rust, built on top of Matrix Rust SDK, using the Makepad UI toolkit and the Robius app dev framework."
arch=(
  "aarch64"
  "armv7h"
  "armv8h"
  "loong64"
  "i686"
  "x86_64"
)
url="https://github.com/project-robius/robrix"
_url_robrix_source="https://github.com/project-robius/robrix"
license=(
  'MIT'        # Robrix
  'Apache-2.0' # Matrix Rust SDK
  # More for other pulled in third party projects?
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
)
replaces=()
makedepends=(
  "git"
  "cargo"
  #"cargo-license" # Commented out: Upstream now has this kind of information 'licenses/', see https://github.com/project-robius/robrix/issues/890#issuecomment-4607634663. We install directly from upstream.
  #'zopfli'        # To size-optimise PNG files.
  #'parallel'      # To size-optimise PNG files.

  'alsa-lib'
  'openssl'
  'libgcc'
  'libpulse'
  'libxkbcommon'
  'wayland'
)
depends=(
  'glibc'
  'libx11'
  'libxcursor'

  'libasound.so'     # alsa-lig
  'libcrypto.so'     # openssl
  'libgcc_s.so'      # 'libgcc'
  'libpulse.so'      # libpulse
  'libssl.so'        # openssl
  'libwayland-client.so'  # wayland
  'libwayland-egl.so'     # wayland
  'libxkbcommon.so'  # libxkbcommon
)
optdepends=()
source=(
  "${_pkgname}::git+${_url_robrix_source}.git"
  "robrix.desktop"
)
sha256sums=(
  'SKIP'                                                              # Main upstream source
  '53a15a44cea5effca7bd6403b0480ccab2bdfb68017d3632df128cfdc2e42c3e'  # robrix.desktop'
)
#options+=('!lto' 'debug' '!strip')
options+=('!lto') # With LTO, linking errors happen.
_cargo_build_options=(
  --frozen
  --release
  # --all-features # 2026-06-01: Don't use '--all-features' now; see https://github.com/project-robius/robrix/issues/892#issuecomment-4595194327.
)



prepare() {
  cd "${srcdir}/${_pkgname}"

  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  printf '%s\n' " --> Downloading rust dependencies ..."
  cargo fetch --locked --target host-tuple

  ### Commented out: Upstream now has this kind of information 'licenses/', see https://github.com/project-robius/robrix/issues/890#issuecomment-4607634663. We install directly from upstream.
  # printf '%s\n' " --> Fetching licenses of dependencies ..."
  # cargo license --avoid-build-deps --avoid-dev-deps --color never --output LICENSES_THIRDPARTY.txt

  printf '%s\n' " --> Generating git log ..."
  git log . > git.log

  #printf '%s\n' " --> Size-optimising PNG files ..."
  #find "${srcdir}/${_pkgname}" -name '*.png' -type f | parallel -j "`nproc`" zopflipng -m -y {} {}
}



pkgver() {
  cd "${srcdir}/${_pkgname}"

  #_ver="$(git describe --tags | sed -E -e 's|robrix/||' -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-([0-9]+)$|+\1|')"
  _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' Cargo.toml | sed 's|#.*||' | awk -F= '{print $2}' | sed -E -e 's|^[vV]||' | tr '-' '.' | tr -d \'\"[[:space:]])"
  _rev="$(git rev-list --count HEAD .)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad" .)"
  _hash="$(git log -1 --format="%h" .)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}



build() {
  cd "${srcdir}/${_pkgname}"

  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  _CFLAGSADDITIONS=" -O0"  # -O0 to work around 'cargo:warning=   47 |  #error "The CPU Jitter random number generator must not be compiled with optimizations. See documentation. Use the compiler switch -O0 for compiling jitterentropy.c."' # See https://github.com/project-robius/robrix/issues/889#issuecomment-4595182202
  CFLAGS+="${_CFLAGSADDITIONS}"
  export CFLAGS

  printf '%s\n' " --> Building ..."
  cargo build "${_cargo_build_options[@]}"

  #printf '%s\n' " --> running ..."
  #cargo run "${_cargo_build_options[@]}"
}



# # 2026-06-07: Disabled 'check()', since it does a lengthy recompile of the main binary.
# check() {
#   cd "${srcdir}/${_pkgname}"
# 
#   export RUSTUP_HOME="${srcdir}/.rustup"
#   export RUSTUP_TOOLCHAIN=stable
#   export CARGO_HOME="${srcdir}/.cargo"
#   export CARGO_TARGET_DIR=target
# 
#   printf '%s\n' " --> Checking ..."
#   cargo test "${_cargo_build_options[@]}"
# }



package() {
  cd "${srcdir}/${_pkgname}"

  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  printf '%s\n' " --> Installing main application ..."
  install -Dvm755 -t "${pkgdir}/usr/bin" target/release/robrix

  printf '%s\n' " --> Installing .desktop and icon files ..."
  install -Dvm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/robrix.desktop"
  install -Dvm644 resources/robrix_logo_alpha.png "${pkgdir}/usr/share/pixmaps/robrix.png"
  local _size
  for _size in 32 48 64 128 256 512 1024; do
    install -Dvm644 "resources/icon_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/robrix.png"
  done

  printf '%s\n' " --> Installing basic documentation ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log AGENTS.md README.md SPLASH.md
  printf '%s\n' " --> Installing license ..."
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT #LICENSES_THIRDPARTY.txt
  local _f
  find licenses/ -mindepth 1 -maxdepth 1 -type f | while read _f; do
    install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/thirdparty" "${_f}"
  done
  ## Optional convenience: Symlink commond license texts which are present system-wide and not already installed for this package
  local _license
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  for _license in "${license[@]}"; do
    if [ -e "/usr/share/licenses/spdx/${_license}.txt" ] && ! [ -e "${pkgdir}/usr/share/licenses/${pkgname}/${_license}.txt" ] ; then
      ln -sv "../spdx/${_license}.txt" "${_license}.txt"
    fi
  done
  cd "${srcdir}/${_pkgname}"
}
