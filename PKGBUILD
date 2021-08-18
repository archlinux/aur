# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=flatpak-builder-tools-git
pkgver=r269.38be01a
pkgrel=1
pkgdesc="Various helper tools for flatpak-builder"
arch=(any)
url=https://github.com/flatpak/flatpak-builder-tools
license=(unknown)
depends=('flatpak-builder'
         'python>=3.6'
         'python-toml'
         'python-aiohttp'
         'python-requirements-parser'
         'perl'
         'cpanminus'
         'perl-json-maybexs'
         'perl-lwp-protocol-https'
         'perl-capture-tiny'
         'ruby')
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# Prefix for tool script
	_binprefix="$pkgdir/usr/bin/${pkgname%-git}"
	# Prefix for docs dir
	_docdir="$pkgdir/usr/share/doc/${pkgname%-git}"

	# Install json2yaml
	install -Dm755 "flatpak-json2yaml.py" "$_binprefix-json2yaml"
	install -Dm644 "readme.md" -t "$_docdir"

	# Find all tools
	for _toolname in $(find -type d -regex '^\.\/\w*$' | sed 's,\.\/,,'); do
		# Find python scripts
		for _scriptname in $(find "$_toolname" -type f -regex '.*\.py$' | sed "s,$_toolname/flatpak-\\(.*\\)\.py,\1,"); do
			install -Dm755 "$_toolname/flatpak-$_scriptname.py" "$_binprefix-$_scriptname"
		done

		# Find perl scripts
		for _scriptname in $(find "$_toolname" -type f -regex '.*\.pl$' | sed "s,$_toolname/flatpak-\\(.*\\)\.pl,\1,"); do
			install -Dm755 "$_toolname/flatpak-$_scriptname.pl" "$_binprefix-$_scriptname"
		done

		# Find ruby scripts
		for _scriptname in $(find "$_toolname" -type f -regex '.*\.rb$' | sed "s,$_toolname/flatpak_\\(.*\\)\.rb,\1,"); do
			install -Dm755 "$_toolname/flatpak_$_scriptname.rb" "$_binprefix-$_scriptname"
		done

		# Find all documentation files for tool
		for _docname in $(find "$_toolname" -type f -regex '.*\.md$'); do
			install -Dm644 "$_docname" -t "$_docdir/$_toolname"
		done
	done
}
