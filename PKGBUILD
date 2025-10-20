# Maintainer: Rubin Simons <me@rubin55.org>

_branch=master
_pkgname=svelte-language-server
pkgname=${_pkgname}-git
pkgver=r1803.6ad05e5b
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
  npm
  pnpm
)
options=('!emptydirs' '!strip')
source=("${pkgname}::git+${url}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  #pnpm test
}

package() {
  local mod_dir=/usr/lib/node_modules/$_pkgname

  install -d "$pkgdir"/{usr/bin,$mod_dir}
  ln -s $mod_dir/bin/server.js "$pkgdir/usr/bin/svelteserver"

  cd "${pkgname}"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE

  cd "packages/language-server"
  # Prune unnecessary packages
  cp package.json{,.bak}
  sed -i 's/workspace:~/*/' package.json
  rm -r node_modules
  npm install --omit=dev --no-audit --loglevel verbose
  rm -r node_modules/typescript
  mv package.json{.bak,}

  cp -r bin dist node_modules package.json "$pkgdir"/$mod_dir
  install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname README.md
}
