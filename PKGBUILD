# Maintainer: Eduardo Leggiero <https://www.leggiero.uk/>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: mirandir <mirandir@orange.fr>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=skype4pidgin-git
pkgver=r771.ba5483c
pkgrel=2
pkgdesc="A Skype plugin for libpurple clients (Pidgin, Empathy, Finch, etc)"
arch=("i686" "x86_64")
url="https://github.com/EionRobb/skype4pidgin"
license=('GPL3')
depends=('libpurple' 'skype')
makedepends=('pkgconfig' 'git')
conflicts=('skype4pidgin' 'skype4pidgin-svn' 'skype4pidgin-svn-dbus' 'skype4finch' 'skype4finch-svn' 'skype4empathy' 'skype4empathy-svn')
replaces=('skype4pidgin' 'skype4pidgin-svn' 'skype4pidgin-svn-dbus' 'skype4finch' 'skype4finch-svn' 'skype4empathy' 'skype4empathy-svn')
provides=('skype4pidgin')
source=("$pkgname::git+https://github.com/EionRobb/skype4pidgin"
        'Makefile.patch'
	'https://repo.dray.be/package-files/skype_icons_empathy.tar.xz')
md5sums=('SKIP'
         '8848134ab5babbc46549ae627365ff20'
         '5728aa01ac674fca2c01348719fe8672')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname}"
	patch -Np0 -i "${srcdir}/Makefile.patch"
	temp=$(sed -n "/\[Skype\]/,/^&/p" theme | sed 's/\[Skype\]/\[Skype (D-Bus)\]/')
	echo "$temp" >> theme
}

build() {
	cd "${pkgname}"
	make all
}

package() {
	cd "${pkgname}"

	install -D -m 0755 libskype.so "${pkgdir}$(pkg-config --variable=plugindir purple)/libskype.so"
	install -D -m 0755 libskype_dbus.so "${pkgdir}$(pkg-config --variable=plugindir purple)/libskype_dbus.so"

	install -d -m 0755 "${pkgdir}/usr/share/empathy/icons"
	cp -r "${srcdir}/hicolor" "${pkgdir}/usr/share/empathy/icons/"
	install -D -m 0644 icons/16/skype.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/16/skype.png"
	install -D -m 0644 icons/22/skype.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/22/skype.png"
	install -D -m 0644 icons/48/skype.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/48/skype.png"
	install -D -m 0644 theme "${pkgdir}/usr/share/pixmaps/pidgin/emotes/skype/theme"
}
