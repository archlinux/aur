# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=plane-theme-git
pkgver=r183.41f07309
pkgrel=1
pkgdesc="A modern icon theme for gnome linux versions."
arch=('any')
url="https://github.com/wfpaisa/plane-theme"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'gulp' 'npm' 'python2' 'nodejs-lts-fermium')
source=("${pkgname}::git+https://github.com/wfpaisa/plane-theme"
        "gulp4.patch::https://github.com/vantu5z/plane-theme/commit/ece2d15b4c492aed991735a72e99cf1e2fcaa47d.patch")
sha256sums=('SKIP'
            '8c6c4dfa9b22406de10f9e065c2a1186f2033d290e6cf9f90f2cc809eab70e52')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
	patch -Np1 -i ../gulp4.patch
}
build() {
	cd "${srcdir}/${pkgname}"

	npm install
	gulp
}

package() {
	cd "${srcdir}/${pkgname}"

	cd "build"
	for i in $(ls -d *); do
		find "$i" -type f -exec install -D -m 644 '{}' "${pkgdir}"/usr/share/themes/'{}' \; ;
	done
}
