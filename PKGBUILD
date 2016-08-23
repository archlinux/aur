# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=timew
pkgver=1.0.0
pkgrel=1
pkgdesc="Timewarrior is a command line time tracking application"
arch=('i866' 'x86_64')
url="http://taskwarrior.org/docs/timewarrior/"
license=('MIT')
makedepends=('cmake' 'gcc-libs')
optdepends=('task: Taskwarrior integration')
provides=('timew')
conficts=('timew-git')

install=timew.install
source=("http://taskwarrior.org/download/timew-${pkgver}.tar.gz"
        "timew-refresh-python2.patch")
sha256sums=('ac027910e1e8365bdd218a8b42389b26d017d38d3c96516c408db6d5a44e0bb5'
            'be49866d0998c8a62245c843d3244883aba4256a878ab72e277aef4ca59b2885')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/timew-refresh-python2.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}


package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    make DESTDIR=${pkgdir} VERBOSE=1 install

    chmod 755 "${pkgdir}/usr/share/doc/timew/doc/holidays/refresh"
    ln -sv "/usr/share/doc/timew/doc/holidays/refresh" "${pkgdir}/usr/bin/timew-refresh-holidays"
}
