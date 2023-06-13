# Maintainer: mojo-hakase <aur@mojo.hakase.de>
_pkgname=passmate
pkgname="${_pkgname}"
pkgver=0.2.r6.g07a8820
pkgrel=1
epoch=
pkgdesc="a cross-platform, open-source password manager"
arch=('i686' 'x86_64')
url="https://github.com/TobiasKaiser/passmate"
license=('Apache')
groups=()
depends=('python>=3.7' 'python-scrypt>=0.8.6' 'python-prompt_toolkit>=3.0.9'
         'python-toml>=0.10.0' 'python-jsonschema>=3.2.0')
makedepends=('git' 'sed' 'python-flit' 'python-pip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/TobiasKaiser/passmate.git)
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	flit build --format wheel
}

package() {
	cd "${srcdir}/${_pkgname}"
	VERSION="$(python -Bc 'import passmate;print(passmate.__version__)')"
	WHEELFILE="./dist/${_pkgname}-${VERSION}-py3-none-any.whl"
	pip install "${WHEELFILE}" --root "${pkgdir}" --no-deps --no-index \
	            --no-warn-script-location  --root-user-action=ignore
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
