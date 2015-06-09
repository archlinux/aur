# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Aliaksiej Artamonaŭ <aliaksiej.artamonau@gmail.com>

pkgname=ruby-compass
pkgver=1.0.3
pkgrel=1
pkgdesc="A Real Stylesheet Framework"
arch=(i686 x86_64)
url="http://compass-style.org"
license=("MIT")
depends=("ruby" "ruby-bundler")
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/compass-${pkgver}.gem"
        "Gemfile"
        "Gemfile.lock"
        "bundler.patch")
noextract=("compass-$pkgver.gem")

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
	bundle install --deployment
	patch -p1 -i "$srcdir"/bundler.patch

	rm "$pkgdir"/usr/bin/compass
	ln -s "$_gemdir"/gems/compass-$pkgver/bin/compass "$pkgdir"/usr/bin/compass
}

sha256sums=('4c7884dc5349d59011fd6c5736a0404008d5609235037741feac9c8ff840d151'
            '2cd0895f4e54b14edd9eb599220900e6cf43a1f57754bfbd790b9a2ec2aab6b0'
            '65918ac12b7b0f97daea52bdb030cb3910b9a344f869173fb2cbbcdf9b9275e2'
            'fbee7344a019d115caddf00667e9473a4e82f2999bdff9c04ccc4aa31b979d72')
