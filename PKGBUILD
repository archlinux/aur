# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=pleaserun
pkgname=ruby-${_gemname}
pkgver=0.0.28
pkgrel=2
pkgdesc="pleaserun"
arch=('any')
depends=(
	'ruby' 'ruby-cabin' 'ruby-clamp' 'ruby-dotenv' 'ruby-insist' 'ruby-mustache'
	'ruby-stud'
)
makedepends=('ruby-bundler')
url="https://rubygems.org/gems/${_gemname}"
license=('Apache 2.0')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'36294017b019078eab9c1d9f37d36f254cd51435d718b1b431c0958d83d409b7'
)

prepare() {
	cd "${srcdir}"
	/usr/bin/tar zxf data.tar.gz
	rm -f metadata.gz checksums.yaml.gz data.tar.gz
}

build() {
	cd "${srcdir}"
	sed -i 's/"mustache", "0.99.8"/"mustache", ">= 1.0"/' ${_gemname}.gemspec
	gem build ${_gemname}.gemspec 2>/dev/null $1
}

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" ${srcdir}/${_gemname}-${pkgver}.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
