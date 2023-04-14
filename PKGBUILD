# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=monitor
_auxname=("pantheon-system-${_gitname}")
pkgname=("${_auxname}-git")
pkgver=r983.4a555e3
pkgrel=2
pkgdesc="Manage processes and monitor system resources. 
        Designed for elementary OS."
arch=('i686' 'x86_64')
url="https://github.com/stsdc/${_gitname}"
license=('GPL3')
depends=('granite' 'gtk3' 'bamf' 'glib2' 'glibc' 'libgee' 'libgtop'
	    'libhandy' 'libwnck3' 'json-glib' 'udisks2' 'wingpanel')
optdepends=('lib32-glib2')
makedepends=('git' 'meson' 'sassc' 'vala')
provides=("${_auxname}")
conflicts=("${_auxname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${_gitname}/"
    cd subprojects
    git clone https://github.com/elementary/stylesheet
    cd stylesheet
    git checkout da0c4196ce246c6506a8a709f4140a098796fd4f
    cd ..
    git clone https://github.com/lcallarec/live-chart
    cd live-chart
    git checkout 5f8ddce715f6a9130955bc5f08437050265a317c
    cd ../..
    meson builddir --prefix=/usr -Dindicator-wingpanel=enabled
    ninja -C _build
}

package() {
    cd "${_gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}
