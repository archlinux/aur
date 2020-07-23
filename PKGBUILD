# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgbase=bigjubeldesktop-git
pkgname=bigjubeldesktop-git
_module='bigjubeldesktop'
pkgver=0.1.0.r1.g2b8b27b
pkgrel=1
pkgdesc="Desktop client for BigJubel: calculate current jubilees"
url="https://www.kabus.eu/git/bigjubeldesktop"
depends=('bigjubelweb' 'electron')
makedepends=('npm' 'git')
provides=('bigjubeldesktop')
conflicts=('bigjubeldesktop')
license=('GPL')
arch=('any')
source=(
	"bigjubeldesktop::git://www.kabus.eu/git/bigjubeldesktop"
	"exec.sh"
)
md5sums=('SKIP' 'SKIP')

# TODO
# desktop file
# icons

pkgver() {
    cd "${srcdir}/${_module}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" $(npm pack "${srcdir}/${_module}" | tail -1)

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

	mkdir -p "${pkgdir}/usr/local/bin"
	cp "${srcdir}/exec.sh" "${pkgdir}/usr/local/bin/bigjubeldesktop"
}
