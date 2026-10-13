pkgname=knap-git
pkgver=0.6.0.r6.g0160089
pkgrel=1
pkgdesc="Flexible template engine for creating Markdown (Git version)"
arch=('any')
url="https://github.com/obsidianmd/knap"
license=('MIT')
depends=('nodejs>=20')
makedepends=('git' 'pnpm')
provides=("knap=${pkgver}")
conflicts=('knap')
source=("knap::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd knap
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd knap
  pnpm install --frozen-lockfile --store-dir "${srcdir}/pnpm-store"

  # Resolve the runtime dependencies from the upstream lockfile.
  mkdir -p "${srcdir}/runtime"
  cp package.json pnpm-lock.yaml "${srcdir}/runtime/"
  cd "${srcdir}/runtime"
  pnpm install --prod --frozen-lockfile --offline \
    --config.node-linker=hoisted --store-dir "${srcdir}/pnpm-store"
}

build() {
  cd knap
  pnpm build
}

package() {
  local module_dir="${pkgdir}/usr/lib/node_modules/knap"

  cd knap
  install -d "${module_dir}/node_modules" "${pkgdir}/usr/bin"
  cp -r dist package.json README.md CHANGELOG.md LICENSE "${module_dir}/"
  cp -r "${srcdir}"/runtime/node_modules/* "${module_dir}/node_modules/"
  ln -s ../lib/node_modules/knap/dist/cli.js "${pkgdir}/usr/bin/knap"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
