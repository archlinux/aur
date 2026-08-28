_pkgname="avia-client"
pkgname="${_pkgname}-git"
pkgver=1.8.4.r14.g796984a
pkgrel=1
pkgdesc="The Stoat Client you actually want"
license=( 'AGPL-3.0-or-later' )
arch=( 'x86_64' )
url="https://github.com/AvaLilac/for-desktop"
source_x86_64=("${_pkgname}-source::git+${url}.git"
               "avia-client.desktop"
               "avia-client.sh")

sha256sums_x86_64=('SKIP'
                   '1de3db56b7395f6f7c040e1f4ef794c1541275b60faf8cad94d1ddf2274fecfe'
                   '7470cc1f570087a48f432174a49c880e5424796cf79dccb5fac8a5354042d8e3')
makedepends=('git'
			 'nodejs' 'pnpm-bin'
			 'rust') # node-pipewire
conflicts=( 'avia-client-bin' 'avia-client' )

pkgver() {
	cd "$srcdir/$_pkgname-source"
	git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname-source"
	git submodule update --init --recursive --depth 1 || git submodule --init --recursive

	# This is a bit weird, I don't know why Avia requires this
	# Update Stoat assets
	git -c submodule."assets".update=checkout submodule update --init assets
}

build() {
	cd "$srcdir/$_pkgname-source"
	pnpm install --frozen-lockfile || pnpm install

	pnpm package
}

package() {
	mkdir -p "$pkgdir/opt/avia-client" && cp -r "$srcdir/$_pkgname-source/out/AviaClient-linux-x64/." "$pkgdir/opt/avia-client/"

	install -Dm644 "$srcdir/avia-client.desktop" "$pkgdir/usr/share/applications/avia-client.desktop"

	install -Dm755 "$srcdir/avia-client.sh" "$pkgdir/usr/bin/avia-client"
	ln -sf "../../opt/avia-client/aviaclient-desktop" "$pkgdir/usr/bin/avia-client.bin"
}

