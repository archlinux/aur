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
md5sums=('cc72a3086b4f07961bf75d96ec8739e7')

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
