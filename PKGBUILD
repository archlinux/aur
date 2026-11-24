# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Josep Bigorra <jjbigorra@gmail.com>

pkgname=maak
pkgver=1.4.1
pkgrel=1
pkgdesc="Command runner à la Make using Guile Scheme"

arch=('any')
license=('MIT')
url="https://github.com/jjba23/maak"

depends=(
	'bash'
	'coreutils'
	'guile'
	'util-linux'
)

makedepends=(
	'guile'
	'pkgconf'
)

# The tag is published on GitHub, which carries the repository, the pipeline
# and the release.
# `maak sync-version' writes $pkgver, and the checksum is updated afterwards
# from the published archive, which is the one thing no release task can know.
source=("$pkgname-$pkgver.tar.gz::https://github.com/jjba23/maak/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3829a36b0b848679ef788b32783ab361977da2fa6da735ce856b201f86cbad6d')

# Guile looks for byte-compiled modules under the site-ccache directory, which
# differs between distributions (and between a Guile installed system-wide and
# one from a profile), so ask Guile's pkg-config file instead of hard-coding
# Arch's /usr/lib/guile/3.0/site-ccache.
_site_dir() {
	pkg-config --variable=sitedir guile-3.0 2>/dev/null || echo /usr/share/guile/site/3.0
}

_compiled_dir() {
	pkg-config --variable=siteccachedir guile-3.0 2>/dev/null || echo /usr/lib/guile/3.0/site-ccache
}

build() {
	# `makepkg' unpacks the tag's archive, whose top directory is named after the
	# package and its version, not after the package alone.
	cd "$srcdir/$pkgname-$pkgver"

	# Byte-compile every module, mirroring the source tree under a staging
	# directory that package() copies into the compiled site directory.
	rm -rf "$srcdir/ccache"
	mkdir -p "$srcdir/ccache/maak"

	while IFS= read -r scm_file; do
		rel_path="${scm_file#src/}"
		go_file="$srcdir/ccache/${rel_path%.scm}.go"
		mkdir -p "$(dirname "$go_file")"
		guild compile -L src -o "$go_file" "$scm_file"
	done < <(find src/maak -name '*.scm')
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# The launcher resolves its modules and resources relative to its own
	# prefix, so the installed layout below is what it expects.
	install -Dm755 scripts/maak "$pkgdir/usr/bin/maak"

	site_dir="$(_site_dir)"
	install -d "$pkgdir${site_dir}/maak"
	cp -r src/maak/. "$pkgdir${site_dir}/maak/"

	ccache_dir="$(_compiled_dir)"
	install -d "$pkgdir${ccache_dir}/maak"
	cp -r "$srcdir/ccache/maak/." "$pkgdir${ccache_dir}/maak/"

	# Resources, completions and the manual page live at the paths the launcher
	# and the Debian and openSUSE recipes already use.
	install -Dm644 resources/help.txt "$pkgdir/usr/share/resources/help.txt"

	install -Dm755 scripts/maak-completion.bash \
	"$pkgdir/usr/share/bash-completion/completions/maak"
	install -Dm755 scripts/maak-completion.fish \
	"$pkgdir/usr/share/fish/vendor_completions.d/maak.fish"
	install -Dm755 scripts/maak-completion.zsh \
	"$pkgdir/usr/share/zsh/site-functions/_maak"

	install -Dm644 man/maak.1 "$pkgdir/usr/share/man/man1/maak.1"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.org "$pkgdir/usr/share/doc/$pkgname/README.org"
	install -Dm644 NEWS.org "$pkgdir/usr/share/doc/$pkgname/NEWS.org"
	cp -r docs "$pkgdir/usr/share/doc/$pkgname/docs"
}
