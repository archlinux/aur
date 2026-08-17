# Maintainer: Clarence <xjh.azzbcc@gmail.com>

pkgname=rulesync
pkgver=16.12.0
pkgrel=1
pkgdesc='Generate configuration files for AI coding agents from unified sources'
arch=('x86_64' 'aarch64')
url='https://github.com/dyoshikawa/rulesync'
license=('MIT')
depends=('glibc' 'icu')
makedepends=('bun' 'git' 'nodejs>=22' 'pnpm>=11')
optdepends=('git: Use the git transport for remote rules and skills')
conflicts=('rulesync-bin')
options=('!strip')

_commit='9745cf98efdd669cc6ed16eec68535585a654511'
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"

  # The release lockfile already pins package integrity. Avoid querying the
  # publication age of every locked development dependency during the build.
  pnpm config set minimumReleaseAge 0 --location project
  pnpm config set store-dir "${srcdir}/pnpm-store" --location project
  pnpm install --prod --frozen-lockfile --ignore-scripts
}

build() {
  cd "${srcdir}/${pkgname}"

  local bun_target
  case "${CARCH}" in
    x86_64) bun_target='bun-linux-x64' ;;
    aarch64) bun_target='bun-linux-arm64' ;;
  esac

  mkdir -p dist-bun
  bun build \
    --compile \
    --minify \
    --sourcemap \
    --target="${bun_target}" \
    --outfile=dist-bun/rulesync \
    ./src/cli/index.ts
}

check() {
  cd "${srcdir}/${pkgname}"

  ./dist-bun/rulesync --version | grep -Fx "${pkgver}"
  ./dist-bun/rulesync --help >/dev/null
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 dist-bun/rulesync "${pkgdir}/usr/bin/rulesync"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
