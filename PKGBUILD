# Maintainer: Rubin Simons <me@rubin55.org>

_branch=master
_pkgname=svelte-language-server
pkgname=${_pkgname}-git
pkgver=r1925.84d54a14
pkgrel=1
pkgdesc='Svelte Language Server, git master build'
url="https://github.com/sveltejs/language-tools"
license=(MIT)
arch=(any)
conflicts=(svelte-language-server)
provides=(svelte-language-server)
depends=(
  nodejs
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
  cd "${pkgname}/packages/language-server"
  pnpm test
}

package() {
  local mod_dir=/usr/lib/node_modules/$_pkgname
  local ts_dir

  install -d "$pkgdir"/{usr/bin,$mod_dir}
  ln -s $mod_dir/bin/server.js "$pkgdir/usr/bin/svelteserver"

  cd "${pkgname}"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE

  pnpm --filter=svelte-language-server deploy --prod "$pkgdir/$mod_dir"
  ln -sfn "$mod_dir" "$pkgdir/$mod_dir/node_modules/.pnpm/node_modules/$_pkgname"

  ts_dir="$pkgdir/$mod_dir/node_modules/.pnpm/typescript@"*/node_modules/typescript

  ln -sfn "${ts_dir#"$pkgdir/$mod_dir/node_modules/"}" "$pkgdir/$mod_dir/node_modules/typescript"
  find "$pkgdir/$mod_dir/node_modules" -type f -path '*/.bin/*' -exec sed -i "s|$pkgdir||g" '{}' +
  rm -f "$pkgdir/$mod_dir/node_modules/.modules.yaml"

  install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname packages/language-server/README.md
}
