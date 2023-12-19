# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=chrysalis
pkgdesc='Graphical configurator for Kaleidoscope-powered keyboards'
pkgver=0.13.3
pkgrel=1
arch=(x86_64)
url="https://github.com/keyboardio/${pkgname^}"
license=(GPL3)
_electron=electron23
depends=("$_electron"
         fuse2
         uucp)
makedepends=(git
             jq
             moreutils
             node-gyp
             nodejs-lts-hydrogen
             npm
             squashfs-tools
             yarn
             zip)
_archive="${pkgname^}-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
        "$pkgname.sh")
sha256sums=('13090edfe23eebf90ad47be179d3abc73bfde020f70d1a87be22359832569f70'
            '9de3ff052ca4600862b8663b93bf2b4223cf2e637995c67e1fe4cb4ed893b39f')

_yarnargs="--cache-folder '$srcdir/node_modules'"

prepare() {
	local _electronVersion=$($_electron --version | sed -e 's/^v//')
	cd "$_archive"
	npm config set fund false
	jq '		del(.devDependencies["electron"]) |
			.build.linux.target = ["dir"]' \
		package.json | sponge package.json
	yarn $_yarnargs install --frozen-lockfile --ignore-scripts
	yarn $_yarnargs add -D --no-lockfile --ignore-scripts electron@$_electronVersion
}

build() {
	cd "$_archive"
	yarn $_yarnargs run package
}

package() {
	sed -E "s/electron/$_electron/" "$pkgname.sh" |
		install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$pkgname"
	cd "$_archive"
	local _dist=out/${pkgname^}-linux-x64/resources
	install -Dm0644 -t "$pkgdir/usr/lib/$pkgname/" "$_dist/app.asar"
	cp -a "$_dist/app.asar.unpacked" "$_dist/static" "$pkgdir/usr/lib/$pkgname/"
	install -Dm0644 -t "$pkgdir/usr/lib/$pkgname/" NEWS.md
	mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
	ln -s /usr/lib/chrysalis/static/udev/60-kaleidoscope.rules "$pkgdir/usr/lib/udev/rules.d/"
}
