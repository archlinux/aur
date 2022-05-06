# Former maintainers:
# * Orivej Desh <smpuj@bk.ru>
# * Stefan Husmann <stefan-husmann@t-online.de>

# Maintainer: Vitrum <wqdxosty1yhj@bk.ru>

pkgname=latin-words
pkgver=1.97FC
pkgrel=7
pkgdesc="William Whitaker's Latin-English-Latin intelligent dictionary and Latin text analyser."
arch=("i686" "x86_64")
url="http://archives.nd.edu/whitaker/words.htm"
license=('custom')
depends=('bash')
makedepends=('gcc-ada')
source=("$pkgname-$pkgver.zip::http://archives.nd.edu/whitaker/old/wordsall.zip")
sha256sums=('592134d7602879e0937b6f977a6f63aa1d14b813edaf6de04a1d8596a9a2c18e')

# Alternative source:
#source=("$pkgname-$pkgver::git://github.com/dsanson/Words.git")
#sha256sums=('SKIP')

prepare() {
	cd "$srcdir"
	sed -i 's/PAUSE_IN_SCREEN_OUTPUT      => TRUE/PAUSE_IN_SCREEN_OUTPUT      => FALSE/g' developer_parameters.adb
}

build() {
	cd "$srcdir"
	gnatmake -O3 words
	gnatmake makedict && echo "g" | ./makedict
	gnatmake makestem && echo "g" | ./makestem
	gnatmake makeefil && ./makeefil
	gnatmake makeinfl && ./makeinfl
}

package() {
	cd "$srcdir"

	# main application
	install -D words "$pkgdir/usr/share/words-$pkgver/words"
	install -m644 ADDONS.LAT DICTFILE.GEN EWDSFILE.GEN INDXFILE.GEN \
	              INFLECTS.SEC STEMFILE.GEN UNIQUES.LAT \
	              "$pkgdir/usr/share/words-$pkgver/"

	# documentation
	install -Dm644 wordsdoc.htm "$pkgdir/usr/share/doc/words-$pkgver/wordsdoc.htm"

	# starting script
	cat > words.sh <<-EOF
		#!/bin/bash
		pushd /usr/share/words-$pkgver >/dev/null
		./words "\$@"
		popd >/dev/null
EOF
	install -Dm755 words.sh "$pkgdir/usr/bin/words"

	# license
	cat > LICENSE <<-EOF
		Quoting from wordsdoc.htm:

		This is a free program, which means it is proper to copy it and pass it on to
		your friends. Consider it a developmental item for which there is no charge.
		However, just for form, it is Copyrighted (c). Permission is hereby freely
		given for any and all use of program and data. You can sell it as your own,
		but at least tell me.

		and later in the same document:

		Licence

		All parts of the WORDS system, source code and data files, are made freely
		available to anyone who wishes to use them, for whatever purpose.
EOF
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/latin-words/LICENSE"
}
