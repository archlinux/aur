# Maintainer: Jadren <jadren@jadren.dev>

pkgname=pi-desktop-git
_pkgname=pi-desktop
_electron=electron43
pkgver=0.20.1.r60.gcd91b99
pkgrel=1
pkgdesc="Local-first AI coding agent desktop: Electron + Rust host core + pi Agent Harness + user-installable plugins (git, system Electron)"
arch=('x86_64' 'aarch64')
url="https://github.com/vastsa/PI-Desktop"
license=('LGPL-3.0-or-later')
depends=("${_electron}" 'fd' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libsecret' 'libstdc++'
         'ripgrep' 'sqlite' 'vulkan-icd-loader')
makedepends=('cargo' 'git' 'nodejs>=22.19.0' 'pnpm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# LTO is handled in build(): -flto is kept only when rustc's linker can read
# the resulting C objects.
options=('!debug')
source=("${_pkgname}::git+${url}.git"
        "${_pkgname}.sh"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '3ae321af6566026cc7abdf2704775f4ed3df44434c4fd6fe5f1a6bb58be59fd7'
            '8f4f8e5a7ba4a42e7a7391580f5c5bf734bab7aa8d4538b738b350147d44384e')

pkgver() {
  cd "${_pkgname}"
  # v0.18.0-beta.6-93-g0744809 -> 0.18.0beta.6.r93.g0744809
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' \
    | sed -E 's/^v//; s/-([0-9]+)-g/.r\1.g/; s/-//g'
}

prepare() {
  cd "${_pkgname}"

  # Upstream's Electron major must match the system Electron we run on.
  local _want _have
  _want=$(node -p "require('./apps/desktop/package.json').devDependencies.electron.replace(/^[^0-9]*/, '').split('.')[0]")
  _have=${_electron#electron}
  if [[ $_want != "$_have" ]]; then
    error "upstream now targets electron${_want}, but this PKGBUILD uses ${_electron}"
    return 1
  fi

  # Under the system Electron, app.isPackaged is false and process.resourcesPath
  # points into /usr/lib/electronXX. Pin both to this package's layout, so the
  # app does not fall back to its development profile and dev resource paths.
  local _main=apps/desktop/electron/main _files
  _files=$(grep -rlE 'app\.isPackaged|process\.resourcesPath' "$_main" --include='*.ts' | grep -v '\.test\.ts$')
  [[ -n $_files ]] || { error "no app.isPackaged/process.resourcesPath to patch"; return 1; }
  sed -i -E \
    -e 's/\bapp\.isPackaged\b/true/g' \
    -e "s|\bprocess\.resourcesPath\b|\"/usr/lib/${_pkgname}\"|g" \
    $_files

  # In-app updates make no sense for a pacman-managed install.
  grep -q 'isPackaged: !isDevelopmentBuild,' "$_main/index.ts" \
    || { error "updater isPackaged option not found"; return 1; }
  sed -i 's/isPackaged: !isDevelopmentBuild,/isPackaged: false,/' "$_main/index.ts"

  # pnpm switches itself to the version pinned in package.json's
  # packageManager field; the lockfile is only valid for that version.
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  pnpm install --frozen-lockfile --ignore-scripts \
    --store-dir "${srcdir}/pnpm-store" \
    --filter '@pi-desktop/desktop...'

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable

  # C deps of Rust crates (ring, mimalloc) are linked by rustc's lld. That only
  # reads LTO objects from a clang on the same LLVM major as rustc, so drop
  # -flto otherwise; some makepkg.conf variants hard-code it in CFLAGS, where
  # !lto does not reach.
  local _v _rust_llvm _cc_llvm
  _rust_llvm=$(rustc -vV | sed -n 's/^LLVM version: \([0-9]*\).*/\1/p')
  _cc_llvm=$("${CC:-cc}" --version 2>/dev/null | sed -n 's/.*clang version \([0-9]*\).*/\1/p' | head -n1)
  if [[ -z $_cc_llvm || $_cc_llvm != "$_rust_llvm" ]]; then
    for _v in CFLAGS CXXFLAGS LDFLAGS; do
      export "$_v=$(sed -E 's/(^|[[:space:]])-flto(=[^[:space:]]*)?//g' <<< "${!_v}")"
    done
  fi

  # Rust host core, linked against the system sqlite.
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release -p host-core

  pnpm --filter '@pi-desktop/desktop^...' build
  pnpm -C packages/agent-runtime bundle

  cd apps/desktop
  pnpm exec electron-vite build

  local _electron_dist=/usr/lib/${_electron}
  pnpm exec electron-builder --linux --dir --publish never \
    -c.electronDist="${_electron_dist}" \
    -c.electronVersion="$(< "${_electron_dist}/version")" \
    -c.npmRebuild=false
}

package() {
  cd "${_pkgname}/apps/desktop"

  local _res _dest="${pkgdir}/usr/lib/${_pkgname}"
  _res=$(echo release/linux-*unpacked/resources)
  install -dm755 "${_dest}"
  cp -r "${_res}"/{app.asar,app.asar.unpacked,agent-runtime,bin,models.dev,plugins,skills,tray-icon.png} \
    "${_dest}/"

  # pvrecorder ships prebuilt binaries for every platform; keep only the ones
  # its loader picks on this arch (x86_64: linux/x86_64, arm64: raspberry-pi/*-aarch64).
  local _pv="${_dest}/app.asar.unpacked/node_modules/@picovoice/pvrecorder-node/lib"
  rm -rf "${_pv}"/{mac,windows}
  case $CARCH in
    x86_64) rm -rf "${_pv}/raspberry-pi" ;;
    aarch64)
      rm -rf "${_pv}/linux"
      find "${_pv}/raspberry-pi" -mindepth 1 -maxdepth 1 ! -name '*-aarch64' -exec rm -rf {} +
      ;;
  esac

  sed "s|@ELECTRON@|${_electron}|" "${srcdir}/${_pkgname}.sh" \
    | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 build/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
  install -Dm644 ../../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
