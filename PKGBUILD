# Maintainer: VinJK <vinjk at disroot dot org>

pkgname="drill-search-git"
pkgver=1.79
pkgrel=1
pkgdesc="GTK+ tool for searching files without indexing, but clever crawling."
arch=("i686" "x86_64")
url="https://www.drill.santamorena.me/"
license=("GPL2")
depends=("gtk3")
makedepends=("dub")
provides=("drill-search")
source=(
    "drill-search.sh"
    "me.santamorena.drill.desktop"
	"git://github.com/yatima1460/Drill.git"
	"git://github.com/yatima1460/GtkD.git"
	"git://github.com/yatima1460/datefmt.git"
)
sha256sums=(
    '56cf59130ce9b794a4d065ef5b2e1203380e29747bb1211f57b35a0e6a4a5f88'
    '10ad4dbbc13e7d978c15ad3aaf376b25a80450ebf7eb71b1c41ed7d73d1335a7'
    'SKIP' 'SKIP' 'SKIP'
)

prepare() {
	cd "${srcdir}/Drill"
	git submodule init
	git config submodule.GtkD.url $srcdir/GtkD
	git config submodule.datefmt.url $srcdir/datefmt
	git submodule update
}

pkgver() {
	cd "${srcdir}/Drill"
	git describe --tags | sed 's/-/_/g'
}

build() {
	cd "${srcdir}/Drill"
	dub build -c GTK -b release
}

package() {
	cd "${srcdir}/Drill"
	mkdir -p $pkgdir/opt/drill-search
	mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/{pixmaps,applications}

	chmod +x Drill-GTK
    
    # Binary
	cp Drill-GTK $pkgdir/opt/drill-search/drill-search
    # Assets
	cp -R assets/ $pkgdir/opt/drill-search/assets
    # Desktop file
	cp "${srcdir}/drill-search.sh" $pkgdir/usr/bin/drill-search
    cp "${srcdir}/me.santamorena.drill.desktop" "${pkgdir}/usr/share/applications/drill-search.desktop"
    ln -s /opt/drill-search/assets/icon.png "${pkgdir}/usr/share/pixmaps/drill-search.png"
}
