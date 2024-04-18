# Maintainer: Andrew Rabert <ar@nullsum.net>

_commit=9b5d1b2ffeec20c7b46aa89c0223d783c02762cf # master

pkgname=ttf-dejavu-emojiless
pkgver=2.37+18+g9b5d1b2f
pkgrel=1
pkgdesc='Derivate of DejaVu without characters listed as emoji, in order not to override color fonts'
arch=(any)
url='https://dejavu-fonts.github.io'
license=(custom)
makedepends=(fontforge
             git
             perl-font-ttf)
provides=(ttf-font ttf-dejavu)
conflicts=(ttf-dejavu)
source=("git+https://github.com/dejavu-fonts/dejavu-fonts.git#commit=$_commit"
        http://www.unicode.org/Public/emoji/1.0/emoji-data.txt
        cleaner.py)
sha256sums=('9d38fcff213462f880756a4c7005cc4b43e90f1ba59d2bcb61e18450d376601a'
            '4822fed8b857ca26490fe13ab504904a1da59ed18f34ed25cc27fcace0fdf88b'
            '67056b33de2550ecbb93d269eacd08d508f47892d5fc582d8bd0c211d5787b78')

pkgver() {
	cd dejavu-fonts
	git describe --tags |
		sed 's/^version_//;s/_/./;s/-/+/g'
}

build() {
	cd dejavu-fonts
	make full-ttf

    cd ..
    for ttf in dejavu-fonts/build/*.ttf; do
        fontforge -script cleaner.py "$ttf"
    done
}

package() {
	cd dejavu-fonts
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF" build/*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/fontconfig/conf.avail" fontconfig/*.conf
	mkdir -p "$pkgdir/usr/share/fontconfig/conf.default"
	ln -srt "$pkgdir/usr/share/fontconfig/conf.default" \
		"$pkgdir"/usr/share/fontconfig/conf.avail/*
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
