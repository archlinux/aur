# Maintainer : Faerbit <faerbit at gmail dot com>

pkgname=pdf-aas-git
_pkgname=${pkgname%-git}
pkgver=4.a2f5460
pkgrel=1
pkgdesc="Little webservice which converts office documents to PDF files."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.org/faerbit/pdf-aas"
license=('MIT')
depends=('python3' 'python-flask' 'unoconv')
makedepends=('git')
source=("git+https://github.com/faerbit/pdf-aas.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
    # License
    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    # Webapp
    install -D -m644 server.py "$pkgdir/usr/share/webapps/${_pkgname}/server.py"

    install -d -m755 "$pkgdir/usr/share/webapps/${_pkgname}/templates"
    for file in $(find templates -type f ); do
        install -D -m644 "${file}" "$pkgdir/usr/share/webapps/${_pkgname}/templates"
    done
    install -d -m755 "$pkgdir/usr/share/webapps/${_pkgname}/static"
    for file in $(find static -type f ); do
        install -D -m644 "${file}" "$pkgdir/usr/share/webapps/${_pkgname}/static"
    done

    chown -R root:http "$pkgdir/usr/share/webapps/${_pkgname}"
}
