# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=pthreadpool-git
pkgver=r55.13da0b4
pkgrel=1
pkgdesc='A pthread-based thread pool implementation for C/C++ (git version)'
arch=('i386' 'x86_64')
url='https://github.com/Maratyszcza/pthreadpool/'
license=('BSD')
makedepends=(
    # binary repositories:
        'git' 'python2' 'ninja'
    # AUR:
        'confu2-git'
)
provides=('pthreadpool')
conflicts=('pthreadpool')
options=('staticlibs')
source=("$pkgname"::'git+https://github.com/Maratyszcza/pthreadpool.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    
    confu2 setup
    python2 ./configure.py #--enable-shared
    sed -i '/cflags[[:space:]]=[[:space:]]/s/$/ -fPIC/'   build.ninja # add -fPIC
    sed -i '/cxxflags[[:space:]]=[[:space:]]/s/$/ -fPIC/' build.ninja # add -fPIC
    ninja
}

package() {
    cd "${pkgname}"
    
    # headers
    mkdir -p "${pkgdir}/usr/include"
    install -D -m644 include/*.h "${pkgdir}/usr/include"
    
    # lib
    install -D -m644 lib/libpthreadpool.a "${pkgdir}/usr/lib"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
