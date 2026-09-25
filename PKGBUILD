# Maintainer: Holger Heinz <79228197+holgerjh@users.noreply.github.com>

pkgname=prolewatch
pkgver=0.12.2
pkgrel=1
pkgdesc='Security gate for safer yay-driven AUR builds'
arch=('x86_64')
url='https://github.com/holgerjh/prolewatch'
license=('AGPL-3.0-only')
depends=('bash' 'bubblewrap' 'coreutils' 'findutils' 'glibc' 'gnupg' 'libarchive' 'pacman' 'sed' 'shadow>=4.20' 'sudo' 'systemd' 'util-linux')
makedepends=('go>=1.26.6')
optdepends=('yay>=13.0.1: supported AUR transaction driver' 'openai-codex: Codex-backed AI review' 'claude-code: Anthropic-backed AI review')
if [[ ${pkgname} == prolewatch-dev ]]; then
  provides=('prolewatch')
  conflicts=('prolewatch')
fi
options=('!debug' '!lto' '!strip')
backup=('etc/prolewatch/config.yaml')

source=("prolewatch-${pkgver}.tar.gz::https://github.com/holgerjh/prolewatch/releases/download/v${pkgver}/prolewatch-${pkgver}.tar.gz"
        "prolewatch-${pkgver}.tar.gz.sig::https://github.com/holgerjh/prolewatch/releases/download/v${pkgver}/prolewatch-${pkgver}.tar.gz.sig")
sha256sums=('7c68635800f823860f9dd828eafca9cfcd42a32f10ec5df524d1a26dcd88dca5'
             'SKIP')
validpgpkeys=('296E983E7120909958BD38E557F1F87148E02B27')

prepare() {
  cd "${srcdir}/prolewatch-${pkgver}"
  # Use vendored dependencies and keep Go state inside the build directory.
  export HOME="${srcdir}/home"
  export GOCACHE="${srcdir}/gocache"
  export GOMODCACHE="${srcdir}/gomodcache"
  export GOENV=off GOTOOLCHAIN=local GOWORK=off
  export GOFLAGS='-mod=vendor -buildvcs=false' GOPROXY=off GOSUMDB=off
  export GOPRIVATE= GONOPROXY= GONOSUMDB=
  install -d -m 0700 "${HOME}" "${GOCACHE}" "${GOMODCACHE}"
  go list ./... >/dev/null
}

build() {
  cd "${srcdir}/prolewatch-${pkgver}"
  HOME="${srcdir}/home" \
  GOCACHE="${srcdir}/gocache" \
  GOMODCACHE="${srcdir}/gomodcache" \
  PROLEWATCH_GOCACHE="${srcdir}/gocache" \
  PROLEWATCH_GOMODCACHE="${srcdir}/gomodcache" \
  PROLEWATCH_BUILD_HOME="${srcdir}/home" \
  PROLEWATCH_BUILD_DIR="${srcdir}/prolewatch-build" \
  PROLEWATCH_OFFLINE=1 \
  PROLEWATCH_GO_MOD_MODE=vendor \
    ./scripts/build.sh
}

check() {
  cd "${srcdir}/prolewatch-${pkgver}"
  env -i \
    HOME="${srcdir}/home" PATH=/usr/bin TMPDIR="${srcdir}" LANG=C.UTF-8 LC_ALL=C.UTF-8 \
    GOENV=off GOTOOLCHAIN=local GOWORK=off GOFLAGS='-mod=vendor -buildvcs=false' GOPROXY=off GOSUMDB=off \
    GOCACHE="${srcdir}/gocache" GOMODCACHE="${srcdir}/gomodcache" \
    go test ./...
}

package() {
  local source_root="${srcdir}/prolewatch-${pkgver}"
  local build_root="${srcdir}/prolewatch-build"
  local name

  for name in prolewatch prolewatch-makepkg prolewatch-gpg prolewatch-net; do
    install -Dm0755 "${build_root}/${name}" "${pkgdir}/usr/bin/${name}"
  done

  for name in default-config.yaml prolewatch.lua review-prompt.md verdict.schema.json; do
    install -Dm0644 "${source_root}/share/${name}" "${pkgdir}/usr/share/prolewatch/${name}"
  done

  install -Dm0644 "${source_root}/share/default-config.yaml" "${pkgdir}/etc/prolewatch/config.yaml"

  install -Dm0644 "${source_root}/README.md" "${pkgdir}/usr/share/doc/prolewatch/README.md"
  install -Dm0644 "${source_root}/SECURITY.md" "${pkgdir}/usr/share/doc/prolewatch/SECURITY.md"
  install -Dm0644 "${source_root}/docs/architecture.md" "${pkgdir}/usr/share/doc/prolewatch/architecture.md"
  install -Dm0644 "${source_root}/docs/ai-review.md" "${pkgdir}/usr/share/doc/prolewatch/docs/ai-review.md"
  install -Dm0644 "${source_root}/LICENSE" "${pkgdir}/usr/share/licenses/prolewatch/LICENSE"
  install -Dm0644 "${source_root}/THIRD_PARTY_NOTICES" "${pkgdir}/usr/share/licenses/prolewatch/THIRD_PARTY_NOTICES"
}
