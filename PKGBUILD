# Maintainer: Rhys Perry <rhysperry111@gmail.com>

# Honestly, I have no idea how most of this stuff fits together
# It is basically just a copy of their dockerfile

pkgname=plausible-git
_pkgname=plausible
pkgver=r456.b29afde
pkgrel=1
license=('MIT')
pkgdesc='Simple and privacy-friendly alternative to Google Analytics'
makedepends=("nodejs" "yarn" "python" "npm" "nodejs-webpack" "wget" "ca-certificates" "gnupg" "elixir")
depends=()
optdepends=()
arch=("any")
url='https://plausible.io'
source=("${pkgname%-*}::git+https://github.com/plausible/analytics.git")
sha1sums=('SKIP')
provides=('plausible')
conflicts=('plausible')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	mkdir app
	cp -r config app/
	cp -r assets app/
	cp -r tracker app/
	cp -r priv app/
	cp -r lib app/
	cp -r mix.exs app/
	cp -r mix.lock app/	
}

build() {
	cd "$_pkgname"/app
        
	export MIX_ENV=prod
	export NODE_ENV=production
        
	mix local.hex --force
	mix local.rebar --force
	mix deps.get --only prod
	mix deps.compile
	
	npm audit fix --prefix ./assets
	npm install --prefix ./assets
	npm run deploy --prefix ./assets
	npm install --prefix ./tracker
	npm run deploy --prefix ./tracker
	mix phx.digest priv/static

	mix release plausible
}

package() {
	cd "$_pkgname"/app
	install -Dm755 _build/prod/rel/plausible/ "$pkgdir"/opt/plausible/
	ln -s "$pkgdir"/opt/plausible/bin/plausible "$pkgdir"/usr/bin/plausible
}
