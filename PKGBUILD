# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gabriel Saillard (GitSquared) <gabriel@saillard.dev>
# Contributor: David Birks <david@tellus.space>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>
# Contributor: dpeukert

pkgname=marktext
pkgver=0.17.1
pkgrel=4
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability'
arch=(x86_64)
url=https://www.marktext.cc
_url="https://github.com/$pkgname/$pkgname"
license=(MIT)
_electron=electron15
depends=("$_electron"
         libxkbfile
         libsecret
         openssl
         ripgrep)
makedepends=(jq
             git
             nodejs-lts-hydrogen
             npm
             node-gyp
             moreutils
             yarn
             yq)
_archive="$pkgname-$pkgver"
source=("$_url/archive/v$pkgver/$_archive.tar.gz"
        "$pkgname.sh"
        "$pkgname-arg-handling.patch")
sha256sums=('d94433ee167cd2fcddd5ccbffd3e17f2933f7dee1e2346f3a6aaa2e8d9052581'
            '8f37f164a642a536b75f54b49e7c7a7c1e4d355a91dd8ece4cab6a95b42d369e'
            'c754a1cad52d10a38eeddb9293ce0a4540296c6adbb47eb5311eaaeded150a01')

prepare() {
	local _electronDist=$(dirname $(realpath $(which $_electron)))
	local _electronVersion=$($_electron --version | sed -e 's/^v//')
	cd "$_archive"
	jq 'del(.devDependencies["electron"], .scripts["preinstall", "postinstall"])' \
		package.json | sponge package.json
	yq -y ". + {\"electronDist\": \"$_electronDist\", \"electronVersion\": \"$_electronVersion\"}" \
		electron-builder.yml | sponge electron-builder.yml
	mkdir -p "$srcdir/node_modules"
	yarn --cache-folder "$srcdir/node_modules" install --frozen-lockfile
	yarn --cache-folder "$srcdir/node_modules" add -D --no-lockfile --ignore-scripts electron@$_electronVersion
	patch -p1 < "$srcdir/$pkgname-arg-handling.patch"
}

build() {
	cd "$_archive"
	yarn --cache-folder "$srcdir/node_modules" run \
		electron-rebuild
	node .electron-vue/build.js
	yarn --cache-folder "$srcdir/node_modules" run \
		electron-builder --linux --x64 --dir
	sed -e "s/@ELECTRON@/$_electron/" "../$pkgname.sh" > "$pkgname"
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
	local _dist=build/linux-unpacked/resources
	install -Dm0644 -t "$pkgdir/usr/lib/$pkgname/" "$_dist/app.asar"
	cp -a "$_dist"/{app.asar.unpacked,hunspell_dictionaries} "$pkgdir/usr/lib/$pkgname/"
	local _rg_path="$pkgdir/usr/lib/$pkgname/app.asar.unpacked/node_modules/vscode-ripgrep/bin/"
	mkdir -p $_rg_path
	ln -sf /usr/bin/rg "$_rg_path"
	install -Dm0755 -t "$pkgdir/usr/share/applications/" "resources/linux/$pkgname.desktop"
	install -Dm0755 -t "$pkgdir/usr/share/metainfo/" "resources/linux/$pkgname.appdata.xml"
	install -Dm0644 resources/icons/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md CONTRIBUTING.md
	cp -a docs "$pkgdir/usr/share/doc/$pkgname/"
	pushd "resources/icons"
	find -name maktext.png -exec \
		install -Dm0644 {} "$pkgdir/usr/share/icons/hicolor/{}" \;
}
