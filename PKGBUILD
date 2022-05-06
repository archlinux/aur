# Maintainer: AtticFinder65536 <atticventilation-aur at protonmail dot com>

pkgname=('ytsubconverter-git')
_gitname=('YTSubConverter')
pkgver=1.6.2.r6.gff65b3f
pkgrel=3
pkgdesc="A tool for creating styled YouTube subtitles (srv3) and converting them back to ass"
url="https://github.com/arcusmaximus/YTSubConverter"
license=('MIT')
source=('git+https://github.com/arcusmaximus/YTSubConverter.git'
	'YTSubConverter.slnf'
	'ytsubconverter-git')
b2sums=('SKIP'
	'617637a03656876c55a6cee521fabda985ffe837c4636673e1986d206700e144494e867b1de81aa6126c76230fe4b82421e4b87de6a2a5fda7cfa20f3128a33f'
	'25a3b36f5e2e3743456726714f7f9adac2f3174c623e52f6827b26623e2380db7b2ccd3887782f3ee92bdc0e7493ab5738d06e134a2ab7afbc3e6a547ebdfe0c')
arch=('any')
depends=('mono')
makedepends=('git' 'mono-msbuild' 'nuget')
optdepends=('ttf-ms-fonts: to provide Comic Sans MS, Courier New, Lucida Console, and Times New Roman which are used in YouTube subtitles and reverse-converted YouTube subtitles'
            'ttf-carrois-gothic-sc: to provide Carrois Gothic SC which is used in YouTube subtitles and reverse-converted YouTube subtitles'
            'ttf-monotype-corsiva: to provide Monotype Corsiva which is used in YouTube subtitles and reverse-converted YouTube subtitles'
            'ttf-roboto: to provide Roboto which is used in YouTube subtitles and reverse-converted YouTube subtitles')
# Not conflicting because my git PKGBUILDs are sometimes designed to be independent of non git versions, like this one.
provides=('ytsubconverter')
options=('!strip')

pkgver(){
	cd "${_gitname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
	cd "${_gitname}"

	# Maybe it would be technically quicker to patch YTSubConverter.sln instead of
	# using YTSubConverter.slnf on msbuild, because nuget can't use YTSubConverter.slnf
	# and might be getting stuff related to UI.Mac, UI.Win, and Tests which we aren't using.
	nuget restore YTSubConverter.sln
}

build(){
	cd "${_gitname}"

	msbuild -t:build -restore -property:Configuration=Release "${srcdir}"/YTSubConverter.slnf
}

package(){
	cd "${_gitname}"

	# Install license
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Install launcher
	install -Dm755 "${srcdir}"/ytsubconverter-git "${pkgdir}"/usr/bin/ytsubconverter-git

	# Install application
	cd YTSubConverter.UI.Linux/bin/Release
	find . -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/lib/${pkgname}/{}" \;
}
