# $Id$
# Maintainer: Nikolay Kuzin <develnk@gmail.com>

pkgname=asofe
pkgver=1.1.0
_commit=9c586dec02dce1204354dfb00e2fa30afab5cb60
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://asofe.org/'
license=('MIT')
depends=('libevent' 'zeromq')
makedepends=('cargo' 'cmake' 'git' 'gmock' 'python' 'wget')
checkdepends=('python' 'python2' 'python2-pyzmq')
source=("git+https://github.com/TheLightSide/asofe.git#commit=${_commit}"
        'asofed.service')
sha512sums=('SKIP'
            'bfc39352e50078c7897ae3b8167f06d152f26c52dc7199ae952bad85b99a9da4f9d25d63edfe52291ad27b6e08b828c5db205eb0dc6091ec3fc75dc2b1bfca19')

prepare() {
    cd ${pkgname}

    # Set gitattributes on src/clientversion.cpp
    git archive --format=tar ${_commit} -- src/clientversion.cpp | tar -xf -
}

build() {
    cd ${pkgname}

    HOST="$(./depends/config.guess)" BUILD="$(./depends/config.guess)" make -C ./depends/ V=1

    CPPFLAGS="${CPPFLAGS} -I$PWD/depends/${CARCH}-unknown-linux-gnu/include"
    LDFLAGS="${LDFLAGS} -L${PWD}/depends/${CARCH}-unknown-linux-gnu/lib -L${PWD}/depends/x86_64-unknown-linux-gnu/lib64"

    ./autogen.sh
    depends_prefix="${PWD}/depends/x86_64-unknown-linux-gnu" ./configure --prefix=/usr
    make -i
}

check() {
    cd ${pkgname}
    ./zcutil/fetch-params.sh
    # ./qa/zcash/full_test_suite.py
}

package() {
    cd ${pkgname}

    make DESTDIR="${pkgdir}" install

    for ext in '-cli' '-tx' 'd'; do
        install -Dm644 contrib/asofe${ext}.bash-completion \
            "${pkgdir}"/usr/share/bash-completion/completions/asofe${ext}
    done

    install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user ../asofed.service
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
