# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: pisuka <tekmon@gmail.com>

pkgname=heroku-toolbelt
pkgver=3.39.5
pkgrel=1
pkgdesc="Everything you need to get started using Heroku (including foreman)"
arch=('any')
url="https://toolbelt.heroku.com"
license=('MIT' 'APACHE' 'RUBY' 'PerlArtistic' 'GPL' 'custom')
depends=("ruby>=1.9")
makedepends=("ruby-bundler")
optdepends=('git')
conflicts=('ruby-heroku' 'ruby-foreman' 'heroku-client')
source=('Gemfile' 'Gemfile.lock')
sha256sums=('40408f90fb021e95253a07cc5972b2cad952e05d5f632a62b7bbdc34bb1ad7f1'
            '6e16c9f5dafe10ead8d9b3f7e47dc6b284d4f01a84ab1564446ecabdfc6d7806')

package() {
	cd "$pkgdir"
	mkdir -p "usr/lib/ruby/vendor_ruby/$pkgname" "usr/bin" "usr/share/man/man1"
	cd "usr/lib/ruby/vendor_ruby/$pkgname"

	#cp -R "$srcdir/heroku-client" .
	cp -L "$srcdir"/Gemfile* .

	#find "heroku-client/bin" -maxdepth 1 -type f -executable -printf "/usr/lib/ruby/vendor_ruby/$pkgname/heroku-client/bin/%f\n" | xargs ln -st "$pkgdir/usr/bin/"

	bundle install --standalone --deployment --binstubs="$pkgdir/usr/bin"

	cd "$pkgdir"

	find "usr/bin" -type f ! -name heroku ! -name foreman -execdir rm "{}" +

	find "usr/lib/ruby/vendor_ruby/heroku-toolbelt/vendor/bundle/ruby" -path "*/gems/*/man/*" -exec ln -st "usr/share/man/man1/" "/{}" \;
}
