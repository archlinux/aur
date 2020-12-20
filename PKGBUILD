# Maintainer: Rhys Perry <rhysperry111@gmail.com>

# Honestly, I have no idea how most of this stuff fits together
# It is basically just a copy of their dockerfile

pkgname=plausible-git
_pkgname=plausible
pkgver=r456.b29afde
pkgrel=3
license=('MIT')
pkgdesc='Simple and privacy-friendly alternative to Google Analytics'
makedepends=("nodejs" "yarn" "python" "npm" "nodejs-webpack" "wget" "ca-certificates" "gnupg" "elixir")
depends=()
optdepends=()
arch=("any")
url='https://plausible.io'
source=("${pkgname%-*}::git+https://github.com/plausible/analytics.git"
        "plausible.sysusers"
        "plausible.service"
        "plausible.tmpfiles"
        "plausible.env")
sha1sums=('SKIP'
          'b52729ab148fcf4e2be54abc37f01aebd02b1655'
          '1ddfc6e48f8b39c9e0a59ba1bd12a827b34716f1'
          '9c2569c4529612916f808637697195b1e5dd780a'
          'ecf4f528744d597eb21cfc9e4a946dcf6e15bd78')
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
	mkdir -p "$pkgdir"/opt/
	cp -r _build/prod/rel/plausible "$pkgdir"/opt/
	chmod 755 "$pkgdir"/opt/plausible/bin/plausible
	chmod +x "$pkgdir"/opt/plausible/releases/*/elixir

	mkdir -p "$pkgdir"/usr/bin/
	ln -sf /opt/plausible/bin/plausible "$pkgdir"/usr/bin/plausible

	install -Dm644 "${srcdir}/plausible.service" "${pkgdir}/usr/lib/systemd/system/plausible.service"
	install -Dm644 "${srcdir}/plausible.sysusers" "${pkgdir}/usr/lib/sysusers.d/plausible.conf"
	install -Dm644 "${srcdir}/plausible.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/plausible.conf"
	install -Dm644 "${srcdir}/plausible.env" "${pkgdir}/etc/plausible.conf"
}
