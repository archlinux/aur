# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Aliaksiej Artamonaŭ <aliaksiej.artamonau@gmail.com>

pkgname=ruby-compass
pkgver=1.0.3
pkgrel=5
pkgdesc="A Real Stylesheet Framework"
arch=(any)
url="http://compass-style.org"
license=("MIT")
depends=("ruby" "ruby-bundler1")
makedepends=("rubygems" "ruby-rdoc")
source=("https://rubygems.org/downloads/compass-${pkgver}.gem"
        "Gemfile"
        "Gemfile.lock"
        "bundler.patch")
noextract=("compass-$pkgver.gem")
sha256sums=('4c7884dc5349d59011fd6c5736a0404008d5609235037741feac9c8ff840d151'
            '752e400aa7ee7acef419d7f41134a05d9ea3de99eff065a61cb1fa0b34a65ad7'
            '1bf83163d7a7394c49f030065cdc98fcba1d707716854fc2d6e1a17eba916a3d'
            'fbee7344a019d115caddf00667e9473a4e82f2999bdff9c04ccc4aa31b979d72')

package() {
	cd "$srcdir"
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin compass-$pkgver.gem
	rm "$pkgdir$_gemdir"/cache/compass-$pkgver.gem

	install -d -m755 "$pkgdir"/usr/share/licenses/$pkgname
	install -D "$pkgdir$_gemdir"/gems/compass-$pkgver/LICENSE.markdown \
	           "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$pkgdir$_gemdir"/gems/compass-$pkgver
	cp "$srcdir"/Gemfile{,.lock} .
	bundle1 install --deployment
	patch -p1 -i "$srcdir"/bundler.patch

	rm "$pkgdir"/usr/bin/compass
	ln -s "$_gemdir"/gems/compass-$pkgver/bin/compass "$pkgdir"/usr/bin/compass
}
