# Maintainer: Jack L. Frost <fbt@fleshless.org>
# Contributor: Corelli <corelli AT sent DOT com>
# Contributor: BartÅ‚omiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: intelfx <intelfx100 [at] gmail [dot] com>
# Contributor: Behem0th <grantipak@gmail.com> 
# Contributor: zman0900 <zman0900@gmail.com>

pkgname=freshplayerplugin-git
pkgver=v0.3.4.r21.g7ba5f2d
pkgrel=1
pkgdesc='PPAPI-host NPAPI-plugin adapter.'
arch=( 'i686' 'x86_64' )
url='https://github.com/i-rinat/freshplayerplugin'
license=( 'MIT' )
depends=( 'pango' 'alsa-lib' 'freetype2' 'libevent' 'gtk3' 'libgl' 'v4l-utils' 'ffmpeg' )
makedepends=( 'cmake' 'ragel' 'git' )
conflicts=( 'freshplayerplugin' )
source=( "${pkgname}::git+${url}" "${pkgname}.install" )
install="${pkgname}.install"

optdepends=(
	'chromium-pepper-flash: for the necessary Pepper plugin'
	'chromium-pepper-flash-standalone: for the necessary Pepper plugin'
	'google-chrome: for the necessary Pepper plugin'
	'google-chrome-beta: for the necessary Pepper plugin'
	'google-chrome-dev: for the necessary Pepper plugin'
)

pkgver() {
	cd "$pkgname"

	if git_version=$( git describe --long --tags 2>/dev/null ); then
		IFS='-' read last_tag tag_rev commit <<< "$git_version"
		printf '%s.r%s.%s' "$last_tag" "$tag_rev" "$commit"
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd "$pkgname"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DWITH_GTK=3
	make
}

package() {
	cd "$pkgname"

	make DESTDIR="${pkgdir}" install

	install -Dm644 data/freshwrapper.conf.example "${pkgdir}/usr/share/${pkgname}/freshwrapper.conf.example"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha1sums=('SKIP'
          '331a3b3877249eaf1c3db917bde1dea6c4d374ab')
