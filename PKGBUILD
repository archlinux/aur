# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

_gemname=sass-listen
pkgname=ruby-$_gemname
pkgver=4.0.0
pkgrel=2
pkgdesc="This fork of guard/listen provides a stable API for users of the Ruby Sass CLI"
arch=("i686" "x86_64")
url="https://github.com/sass/listen"
license=("MIT")
depends=("ruby")
options=("!emptydirs")
source=("${_gemname}-${pkgver}.tar.gz::https://github.com/sass/listen/archive/v$pkgver.tar.gz")
sha256sums=('5b09daf811df4ae3d8657cf919976b9795d275a3792ab08bdf3b1cccaecd3f4b')
sha512sums=('799e1e70f86b4be671c3286ae860cbcec83d8a1311d67fb37956dc527e2961888094439fd8377d50c78798c494f19ddbed3a412f02e76e429dcc1717c93b7e19')

prepare() {
	cd "${_gemname#sass-}-${pkgver}"
	sed -r 's|~>|>=|g' -i ${_gemname}.gemspec
	sed 's|git ls-files -z|find -type f -print0\|sed "s,\\\\./,,g"|' -i ${_gemname}.gemspec
}

build() {
	cd "${_gemname#sass-}-${pkgver}"
	gem build ${_gemname}.gemspec
}

package() {
	cd "${_gemname#sass-}-${pkgver}"
	local _gemdir="$(gem env gemdir)"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}*.gem
	install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
