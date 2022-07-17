# Maintainer: Joe Pentland <joe.pentland at gmail dot com>
pkgname=rtl-git
_pkgname=${pkgname%-git}
pkgver=v0.12.3.r0.f84719e2
pkgrel=19
pkgdesc="RTL is a full function, device agnostic, web user interface to help manage lightning node operations."
arch=('any')
url="https://www.ridethelightning.info/"
license=('MIT')
groups=()
depends=('nodejs')
makedepends=('git' 'npm')
optdepends=('lnd: Lightning Network Daemon')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=
source=('RTL::git+https://github.com/Ride-The-Lightning/RTL.git#branch=master'
        "RTL.service"
        "Sample-RTL-Config.json"
        "Use-RTL_LOG_PATH-for-logfiles.patch")
noextract=()
sha256sums=('SKIP'
            'cabf574f045a316a36679f1f9afe2f2ccf244b9ff75a452f873ef72b392462ea'
            '979acec0c296dc726a1ae32cfb69d0908c6348443cd55eae4bcbd3fa57868d6a'
            'd7ba77f211043a63c3dca42397731ee10af029fde0232fe88e7e107d4c3ba065')

pkgver() {
	cd "$srcdir/RTL"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/RTL"
    patch -p1 < ../Use-RTL_LOG_PATH-for-logfiles.patch
}

build() {
	cd "$srcdir/RTL"
    npm install --omit=dev --legacy-peer-deps
}

package() {
	cd "$srcdir/RTL"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 .github/README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    cp -r .github/screenshots "${pkgdir}/usr/share/doc/${_pkgname}/"
    cp -r .github/docs "${pkgdir}/usr/share/doc/${_pkgname}/"
    install -Dm644 "${srcdir}/Sample-RTL-Config.json" "${pkgdir}/etc/RTL/Sample-RTL-Config.json"

    rm -r .github
    rm .dockerignore
    rm .editorconfig
    rm .eslintrc.json
    rm .gitattributes
    rm .gitignore
    rm LICENSE
    rm Sample-RTL-Config.json

    mkdir -p "${pkgdir}/opt/${_pkgname}"
    cp -r * "${pkgdir}/opt/${_pkgname}"
    chmod -R 755 "${pkgdir}/opt/${_pkgname}"

    # Systemd Service
    install -Dm644 "${srcdir}/RTL.service" "${pkgdir}/usr/lib/systemd/system/RTL.service"
}
