# Maintainer: N. Izumi - izmntuk
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jan Fader <jan.fader@web.de>
pkgname=keynav-git
pkgver=0.+r200.20150729
pkgrel=2
pkgdesc="Ingenious and fast way to move the mouse pointer on the screen with keystrokes."
url="http://www.semicomplete.com/projects/keynav/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('xdotool' 'cairo')
makedepends=('git')
source=('git+https://github.com/jordansissel/keynav')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%%-*}"
	echo '0.+r'$(git rev-list --count HEAD).$(git log -1 --pretty='%cd' --date=short | sed 's|-||g')
}

prepare() {
	cd "${srcdir}/${pkgname%%-*}"
	sed 's|/usr/local/|/usr/|g' -i Makefile
}

build() {
	cd "${srcdir}/${pkgname%%-*}"
	make keynav
	pod2man -c 'General Commands Manual' keynav.{pod,1}
}

package() {
	cd "${srcdir}/${pkgname%%-*}"
	install -d "${pkgdir}"/usr/{bin,share/{{doc,licenses}/${pkgname%%-*},man/man1}}
	install -p keynav "${pkgdir}/usr/bin"
	install -pm644 keynavrc README CHANGELIST "${pkgdir}/usr/share/doc/${pkgname%%-*}"
	install -pm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname%%-*}"
	install -pm644 keynav.1 "${pkgdir}/usr/share/man/man1"
}
