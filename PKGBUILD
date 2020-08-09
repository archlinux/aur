# Maintainer: jialeens <jialeadmin@163.com>

pkgname=dida
pkgver=r23.1fe24d6
pkgrel=1
pkgdesc="使用electron包装的滴答客户端"
arch=('any')
url="https://github.com/jialeens/dida"
license=('Unlicense')
groups=()
depends=('electron')
makedepends=('git' 'npm' 'sed' 'gcc')
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git"
       "dida.desktop"
	   "dida.sh")
noextract=()
sha256sums=("SKIP"
            "2900c26c1209f94033b94c38ad754aa2941f2acbf681f8c30a04f83b128d3f13"
			"24a3b6e4300741f8184395a9d628076205f249201658a318c1eebaec6f613884")

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-\?//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$pkgname"
	npm install 
	npm run package
}

package() {
	install -Dm644 "dida.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/dida/dida.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/dida.png"
	mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r --no-preserve='ownership' -- $pkgname/dist/dida-linux-x64/* "$pkgdir/usr/lib/$pkgname"
	install -Dm755 "dida.sh" "$pkgdir/usr/bin/dida"
}