# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Micha Alt <micha.tucker at gmail dot com>

pkgname=gulp-cli
pkgver=2.3.0
pkgrel=1
pkgdesc='The streaming build system'
arch=(any)
url='http://gulpjs.com/'
license=(MIT)
depends=(nodejs)
makedepends=(yarn npm)
replaces=(gulp)
provides=(gulp)
conflicts=(gulp)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('0a5a76e5be9856edf019fb5be0ed8501a8d815da1beeb9c6effca07a93873ba4')

build() {
	cd "$srcdir/package"
	yarn --ignore-scripts --production  # ignore prepublish
}

package() {
	cd "$srcdir/package"
	
	install -Dm755 'bin/gulp.js' "$pkgdir/usr/lib/node_modules/gulp-cli/bin/gulp.js"
	for f in index.js package.json README.md; do
		install -Dm644 "$f" "$pkgdir/usr/lib/node_modules/gulp-cli/$f"
	done
	for d in lib node_modules; do
		find "$d" -type f -exec install -Dm644 {} "$pkgdir/usr/lib/node_modules/gulp-cli/{}" \;
	done
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 gulp.1 "$pkgdir/usr/share/man/man1/gulp.1"
	install -d "$pkgdir/usr/bin"
	ln -s '/usr/lib/node_modules/gulp-cli/bin/gulp.js' "$pkgdir/usr/bin/gulp"
	
	install -Dm644 completion/bash "$pkgdir/usr/share/bash-completion/completions/gulp"
	install -Dm644 completion/fish "$pkgdir/usr/share/fish/completions/gulp.fish"
	sed -i 's|#!/bin/zsh|#compdef gulp|; s/compdef \(_gulp_completion\) gulp/\1 "$@"/' completion/zsh
	install -Dm644 completion/zsh "$pkgdir/usr/share/zsh/site-functions/_gulp"
	# TODO powershell completions seem to be impossible since no profile.d type thing exists, only one file:
	# https://docs.microsoft.com/de-de/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.2
}
