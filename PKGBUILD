# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="daed"
pkgname="${_pkgname}-edge-git"
pkgver=1.27.0.r14.g1e35217.w223.gdc50308.d843.gc7e0296
pkgrel=1
pkgdesc="A modern dashboard for dae, bundled with latest dae-wing (backend API server) and dae (core)."
arch=('x86_64' 'aarch64')
url="https://github.com/daeuniverse/daed"
license=('AGPL-3.0-or-later AND MIT')
makedepends=('git' 'pnpm' 'clang' 'go')
provides=("daed")
conflicts=('daed' 'daed-git')
source=("${_pkgname}::git+https://github.com/daeuniverse/${_pkgname}.git#branch=main"
  "dae-wing::git+https://github.com/daeuniverse/dae-wing.git#branch=main"
  "dae::git+https://github.com/daeuniverse/dae.git#branch=main"
  "dae_bpf_headers::git+https://github.com/daeuniverse/dae_bpf_headers.git#branch=main")
sha256sums=('SKIP'
  'SKIP'
  'SKIP'
  'SKIP')
install="${_pkgname}.install"
options=(!debug)

pkgver() {
  cd "$srcdir/$_pkgname"
  (
    set -o pipefail
    daed_version=$(git describe --long --tags --abbrev=7 --match 'v[0-9]*' 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)")
    wing_count=$(git -C wing rev-list --count HEAD)
    wing_commit=$(git -C wing rev-parse --short=7 HEAD)
    dae_count=$(git -C wing/dae-core rev-list --count HEAD)
    dae_commit=$(git -C wing/dae-core rev-parse --short=7 HEAD)
    printf "%s.w%s.g%s.d%s.g%s" "${daed_version}" "${wing_count}" "${wing_commit}" "${dae_count}" "${dae_commit}"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule foreach --recursive 'git reset --hard && git clean -ffdx' || true
  git reset --hard
  git clean -ffdx

  git submodule init
  git config submodule.wing.url "$srcdir/dae-wing"
  git -c protocol.file.allow=always submodule update
  git -C wing fetch "$srcdir/dae-wing" HEAD
  git -C wing checkout --force FETCH_HEAD
  git -C wing clean -ffdx

  git -C wing submodule init
  git -C wing config submodule.dae-core.url "$srcdir/dae"
  git -C wing -c protocol.file.allow=always submodule update
  git -C wing/dae-core fetch "$srcdir/dae" HEAD
  git -C wing/dae-core checkout --force FETCH_HEAD
  git -C wing/dae-core clean -ffdx

  git -C wing/dae-core submodule init
  git -C wing/dae-core config submodule.control/kern/headers.url "$srcdir/dae_bpf_headers"
  git -C wing/dae-core config submodule.trace/kern/headers.url "$srcdir/dae_bpf_headers"
  git -C wing/dae-core -c protocol.file.allow=always submodule update

  cd wing
  outbound_replace=$(cd dae-core && go list -m -f '{{ with .Replace }}{{ .Path }}@{{ .Version }}{{ end }}' github.com/daeuniverse/outbound)
  go mod edit -replace="github.com/daeuniverse/outbound=${outbound_replace}"
  go mod tidy
}

build() {
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  export CFLAGS="-fno-stack-protector"
  cd "$srcdir/$_pkgname"
  daed_commit=$(git rev-parse --short=7 HEAD)
  wing_commit=$(git -C wing rev-parse --short=7 HEAD)
  dae_core_commit=$(git -C wing/dae-core rev-parse --short=7 HEAD)
  package_version="$daed_commit.$wing_commit.$dae_core_commit"
  make SKIP_SUBMODULES=1 VERSION="unstable-$package_version"
}

package() {
  depends=(
    v2ray-geoip
    v2ray-domain-list-community
  )

  cd "$srcdir/$_pkgname"

  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -vDm644 "install/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/etc/daed/"

  mkdir -p "${pkgdir}/usr/share/daed"
  ln -vs "/usr/share/v2ray/geoip.dat" "${pkgdir}/usr/share/daed/geoip.dat"
  ln -vs "/usr/share/v2ray/geosite.dat" "${pkgdir}/usr/share/daed/geosite.dat"

  echo "After installation completed, open your browser and navigate to http://localhost:2023"
}
