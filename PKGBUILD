# Maintainer: Keith Scroggs <very amused at pm dot me>
# Contributor: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=otf-font-awesome-pro
provides=('ttf-font-awesome')
replaces=('ttf-font-awesome')
pkgver=7.1.0
pkgrel=1
pkgdesc='The Pro Version of the famous FontAwesome Icons. Requires an active Subscription!'
arch=('any')
url='https://fontawesome.com'
license=('custom:Font Awesome Pro License')
makedepends=(
	'grep'
	'npm'
	'python-fonttools'
	'python-brotli'
)
_fonts=(fa-brands-400.otf fa-duotone-900.otf fa-light-300.otf fa-regular-400.otf fa-solid-900.otf)

prepare() {
	getToken=0
	npm config get | grep '//npm.fontawesome.com/:_authToken' > /dev/null 2>&1 || getToken=1

	if [ $getToken != 0 ]; then
		echo "Please enter your 'Pro npm Package Token'. You may find it under https://fontawesome.com/account"
		echo -n "Token: "
		read token

		npm config set "@fortawesome:registry" https://npm.fontawesome.com/
		npm config set "//npm.fontawesome.com/:_authToken" $token
	fi
}

build() {
	rm -rf "${srcdir}"
	mkdir -p "${srcdir}"
	cd "${srcdir}"
	npm init -y
	npm install @fortawesome/fontawesome-pro@${pkgver}

	webfont_dir="${srcdir}/node_modules/@fortawesome/fontawesome-pro/webfonts"
	for font in "${_fonts[@]}"; do
		# We need to convert to the	TTX intermediate format between WOFF2 and OpenType
		ttx -o "${webfont_dir}/${font%.*}.ttx" "${webfont_dir}/${font%.*}.woff2"
		ttx -o "${webfont_dir}/${font}" "${webfont_dir}/${font%.*}.ttx"
	done
}

package() {
	mkdir -p "${pkgdir}/usr/share/fonts/OTF/"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"

	webfont_dir="${srcdir}/node_modules/@fortawesome/fontawesome-pro/webfonts"
	for font in "${_fonts[@]}"; do
		install "${webfont_dir}/${font}" "${pkgdir}/usr/share/fonts/OTF/"
	done
	install "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
