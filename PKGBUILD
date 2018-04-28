# Maintainer: karel

pkgname=ycmd-git
_gitname=ycmd
pkgver=r1969.1c190032
pkgrel=1
pkgdesc="A code-completion & code-comprehension server"
arch=('i686' 'x86_64')
url="https://github.com/Valloric/ycmd"
license=('GPLv3')
depends=('clang' 'python')
makedepends=('cmake' 'git')
provides=('ycmd')
conflicts=('ycmd')
source=("git+https://github.com/Valloric/ycmd.git"
        "git+https://github.com/bottlepy/bottle.git"
        "git+https://github.com/slezica/python-frozendict.git"
        "git+https://github.com/vheon/JediHTTP.git"
        "git+https://github.com/PythonCharmers/python-future.git"
        "git+https://github.com/requests/requests.git"
        "git+https://github.com/Pylons/waitress.git")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_gitname"
    git submodule init third_party/bottle \
        third_party/frozendict \
        third_party/JediHTTP \
        third_party/python-future \
        third_party/requests \
        third_party/waitress
    git config submodule.third_party/bottle.url $srcdir/bottle
    git config submodule.third_party/frozendict.url $srcdir/python-frozendict
    git config submodule.third_party/JediHTTP.url $srcdir/JediHTTP
    git config submodule.third_party/python-future.url $srcdir/python-future
    git config submodule.third_party/requests.url $srcdir/requests
    git config submodule.third_party/waitress.url $srcdir/waitress
    git submodule update
}

build() {
    cd "$srcdir/$_gitname"
    mkdir -p build
    cd build
    cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON -DUSE_PYTHON2=OFF . ../cpp/
    make ycm_core
}

package() {
    local trgtdir=usr/share/ycmd
    mkdir -p "$pkgdir/$trgtdir/third_party"
   	cp -r "$srcdir/$_gitname/"{ycmd,ycm_core.so,CORE_VERSION,cpp,clang_includes} \
		    "$pkgdir/$trgtdir"
   	cp -r "$srcdir/$_gitname/third_party/"{bottle,frozendict,JediHTTP,python-future,requests,waitress} \
		    "$pkgdir/$trgtdir/third_party"
	  find "$pkgdir" -name .git -exec rm -fr {} +
   	rm -rf "$pkgdir/$trgtdir/ycmd/tests"
}
