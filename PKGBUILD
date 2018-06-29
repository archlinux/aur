# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=seiscomp3-git
pkgver=r1147.e32a75d5
pkgrel=1
pkgdesc="A seismological software for data acquisition, processing, distribution and interactive analysis."
arch=('x86_64')
url="https://github.com/SeisComP3/seiscomp3"
license=('custom')
depends=('boost-libs' 'libxml2' 'mariadb' 'ncurses' 'openssl' 'python2' 'python2-m2crypto' 'qt4')
makedepends=('boost' 'cmake' 'git' 'libmariadbclient' 'postgresql-libs' 'python2-sphinx')
optdepends=('postgresql: for using PostgreSQL database')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git"
        "seiscomp3.sh")
sha256sums=('SKIP'
            '06157296f7cbc1fda7c09254b91143fc0463fe238133ebbff6437165e3000761')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-git}"
	sed -i "s/python/python2/g" ./doc/CMakeLists.txt
	sed -i "s/sphinx-build/sphinx-build2/g" ./doc/build-doc.py
	if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
	cd "${pkgname%-git}/build"
	cmake .. \
    -DCMAKE_INSTALL_PREFIX='/opt/seiscomp3' \
    -DCMAKE_CXX_FLAGS='-fPIC' \
    -DCMAKE_SHARED_LINKER_FLAGS='-fPIC' \
    -DCMAKE_EXE_LINKER_FLAGS='-fPIC -lpthread' \
    -DPYTHON_EXECUTABLE='/usr/bin/python2' \
    -DSC_DOC_GENERATE='ON'
	make
}

package() {
	cd "${pkgname%-git}/build"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "${srcdir}/seiscomp3.sh" "${pkgdir}/etc/profile.d/seiscomp3.sh"
	install -Dm644 "${srcdir}/${pkgname%-git}/COPYING" \
	  "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
	find "${pkgdir}/opt/seiscomp3" -type f -exec sed -i "s/env python/env python2/g" '{}' \;
}
# vim:set ts=2 sw=2 et:
