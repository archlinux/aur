# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=lintian
pkgver=2.114.0
pkgrel=1
pkgdesc="dissects Debian packages and tries to find bugs and policy violations"
arch=(any)
url="https://lintian.debian.org/"
license=('GPL2')
depends=(
	perl
	perl-aptpkg
	perl-config-tiny
	perl-data-dpath
	perl-data-validate-domain
	perl-data-validate-uri
	perl-devel-size
	perl-email-address-xs
	perl-file-find-rule
	perl-font-ttf
	perl-io-interactive
	perl-json-maybexs
	perl-list-someutils
	perl-list-utilsby
	perl-moox-aliases
	perl-namespace-clean
	perl-path-tiny
	perl-perlio-gzip
	perl-perlio-utf8-strict
	perl-proc-processtable
	perl-syntax-keyword-try
	perl-text-levenshteinxs
	perl-time-moment
	perl-xml-libxml
	perl-yaml-libyaml
)
makedepends=(
	perl-const-fast
	perl-file-basedir
	perl-html-html5-entities
	perl-ipc-run3
	perl-unicode-utf8
)
optdepends=()
options=('!emptydirs' purge)
source=("https://salsa.debian.org/lintian/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('3499b27bab13e52ef94b60b4e21a9b0f8642c5e686f85a55fdd2d594b48a29920c9dd59834e792c6eba1329a0f465f295724ce348ed276bec9487489cbfbf6f2')

prepare() {
	cd "$pkgname-$pkgver"

	/usr/bin/perl -p -i -e "s/my \\\$LINTIAN_VERSION;/my \\\$LINTIAN_VERSION = q{${pkgver}};/;" bin/*
}

build() {
	cd "$pkgname-$pkgver"

	podargs=(--center "Debian Package Checker" --release "Lintian v${pkgver}")
	( cd doc && LC_ALL=en_US.UTF-8 rst2html lintian.rst > lintian.html )
	mkdir -p man/man1/ man/man3/
	pod2man "${podargs[@]}" --name lintian --section=1 man/lintian.pod > man/man1/lintian.1
	for POD in man/*.pod; do
		BASENAME=$(basename "$POD" .pod)
		pod2man "${podargs[@]}" --section=1 "$POD" > "man/man1/$BASENAME".1
	done
	for POD in $(find doc/tutorial lib/Lintian lib/Test -type f '!' -path '*/Output/*' '!' -path '*/Check/*' '!' -path '*/Screen/*'); do
		BASENAME=$(echo "$POD" | perl -pe 's@^(doc/tutorial|lib)/@@; s@/@::@g; s/\.(pod|pm)$$//')
		pod2man "${podargs[@]}" --name="$BASENAME" --section=3 "$POD" > "man/man3/$BASENAME".3
	done
	private/generate-html-docs doc/api.html
}

package() {
	cd "$pkgname-$pkgver"

	_dir="$pkgdir/usr/share/lintian"
	mkdir -p "$pkgdir/etc" "$pkgdir/usr/bin" "$_dir"
	for dir in bin data lib .perlcriticrc profiles tags templates vendors; do
		cp -a $dir "$_dir"
	done
	install -Dt "$_dir/private/" private/latest-policy-version

	for binary in lintian lintian-explain-tags lintian-annotate-hints spellintian; do
		ln -rs "$_dir/bin/$binary" "$pkgdir/usr/bin/$binary"
	done
	ln -rs "$_dir/bin/lintian-annotate-hints" "$pkgdir/usr/bin/lintian-info"

	# Now for docs
	_doc="$pkgdir/usr/share/doc/lintian"
	mkdir -p "$_doc"
	cp -a README.md "$_doc/"
	for file in CREDITS api.html lintian.html lintian.rst; do
		cp -a doc/$file "$_doc/"
	done
	ln -rs "$_doc/lintian.rst" "$_doc/lintian.txt"

	mkdir -p "$pkgdir/usr/share/man/"
	cp -a man/man{1,3} "$pkgdir/usr/share/man/"
}
