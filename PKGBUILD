# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=chrysalis
pkgdesc='Graphical configurator for Kaleidoscope-powered keyboards'
pkgver=0.8.5
pkgrel=1
arch=(x86_64)
url="https://github.com/keyboardio/${pkgname^}"
license=(GPL3)
_electron=electron12
depends=("$_electron"
         fuse2
         uucp)
makedepends=(git
             jq
             moreutils
             node-gyp
             yarn)
_archive="${pkgname^}-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('28582c41e85ce0a1e6298ee7edfc263babe924019ca9686a80cbc597d8f385ba'
            '9de3ff052ca4600862b8663b93bf2b4223cf2e637995c67e1fe4cb4ed893b39f')

prepare() {
	local _electronVersion=$($_electron --version | sed -e 's/^v//')
	cd "$_archive"
	sed -i -e '/plugin:prettier/d' .eslintrc.js
	jq 'del(.devDependencies["electron"])' package.json | sponge package.json
	yarn --cache-folder "$srcdir/node_modules" install --frozen-lockfile --ignore-scripts
	yarn --cache-folder "$srcdir/node_modules" add -D --no-lockfile --ignore-scripts electron@$_electronVersion
}

build() {
	cd "$_archive"
	yarn --cache-folder "$srcdir/node_modules" run build:linux
}

package() {
	sed -E "s/electron/$_electron/" "$pkgname.sh" |
		install -Dm0755 -t "$pkgdir/usr/bin/" /dev/stdin
	cd "$_archive"
	local _dist=dist/linux-unpacked/resources
	install -Dm0644 -t "$pkgdir/usr/lib/$pkgname/" "$_dist/app.asar"
	cp -a "$_dist/static" "$pkgdir/usr/lib/$pkgname"
}
