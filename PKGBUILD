# Maintainer: Rubin Simons <me@rubin55.org>

_branch=master
_pkgname=svelte-language-server
pkgname=${_pkgname}-git
pkgver=r1977.aeef5e615
pkgrel=1
pkgdesc='Svelte Language Server, git master build'
url="https://github.com/sveltejs/language-tools"
license=(MIT)
arch=(any)
conflicts=(svelte-language-server)
provides=(svelte-language-server)
depends=(
  nodejs
  typescript
)
makedepends=(
  git
  pnpm
)
source=("${pkgname}::git+${url}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
}

build() {
  cd "${pkgname}/packages/svelte2tsx"
  pnpm install
  pnpm build
  cd ../language-server
  pnpm install
  pnpm build
}

check() {
  # The TS GO tests need the content mapper, it has no build script
  cd "${pkgname}/packages/typescript-content-mapper"
  pnpm exec tsc
  cd ../language-server
  pnpm test
}

package() {
  local mod_dir=/usr/lib/node_modules/$_pkgname

  install -d "$pkgdir"/{usr/bin,$mod_dir}
  ln -s $mod_dir/bin/server.js "$pkgdir/usr/bin/svelteserver"

  cd "${pkgname}"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE

  # Typescript is a peer dependency, deploy leaves it to the system
  pnpm --filter=svelte-language-server \
    --config.inject-workspace-packages=true \
    --config.node-linker=hoisted \
    deploy --prod "$pkgdir/$mod_dir"

  # Deploy pins versions and build paths, restore the original file
  install -m644 packages/language-server/package.json "$pkgdir/$mod_dir"
  rm -r "$pkgdir/$mod_dir"/{pnpm-lock.yaml,node_modules/{.pnpm,.modules.yaml,.pnpm-workspace-state-v1.json}}

  install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname packages/language-server/README.md
}
