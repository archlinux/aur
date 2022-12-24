# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=zafiro-icon-theme-git
pkgver=1.3.r26.gb501dfa
pkgrel=1
pkgdesc="Icon pack flat with light colors"
arch=('any')
url="https://github.com/zayronxio/Zafiro-icons"
license=('GPL3')
options=(!strip)
makedepends=('git')
conflicts=('zafiro-icon-theme')
provides=('zafiro-icon-theme')
source=("${pkgname}::git+https://github.com/zayronxio/Zafiro-icons")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
	cd "${srcdir}/${pkgname}"

	msg "Checking filenames for any non-ascii characters..."
	while read file; do
		msg2 "$(mv -vf "$file" "$(tr -cd '\000-\177' <<<$file)")"
	done < <( find . -type f | grep -P "[^\x00-\x7F|\x80-\xFF]" )

	install -dm755 "${pkgdir}/usr/share/icons/Zafiro"
	cp -a * "${pkgdir}/usr/share/icons/Zafiro"

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
