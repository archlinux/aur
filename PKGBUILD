# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='phpreport-report-git'
pkgdesc='A report generator for PhpReport'
pkgver=r107.96065f4
pkgrel=1
arch=('any')
license=('custom:MIT')
url='https://github.com/mrobinson/phpreport-report'
depends=('python-keyring')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^version\.//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	msg2 'Nothing to build'
}

package () {
	cd "${pkgname}"
	local py_ver=$(python3 -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')
	install -Dm755 phpreport-report \
		"${pkgdir}/usr/bin/phpreport-report"
	install -Dm644 phpreport.py \
		"${pkgdir}/usr/lib/python${py_ver}/site-packages/phpreport.py"
	python3 -m compileall \
		"${pkgdir}/usr/lib/python${py_ver}/site-packages/phpreport.py"
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

