# Maintainer: karel

pkgname=ycmd-git
_gitname=ycmd
pkgver=r2177.ed8d17c2
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
        "git+https://github.com/davidhalter/jedi.git"
        "git+https://github.com/davidhalter/parso.git"
        "git+https://github.com/PythonCharmers/python-future.git"
        "git+https://github.com/requests/requests.git"
        "git+https://github.com/Pylons/waitress.git")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_gitname"
    git submodule init third_party/bottle \
        third_party/frozendict \
        third_party/jedi_deps/jedi \
        third_party/jedi_deps/parso \
        third_party/python-future \
        third_party/requests_deps/requests \
        third_party/waitress
    git config submodule.third_party/bottle.url $srcdir/bottle
    git config submodule.third_party/frozendict.url $srcdir/python-frozendict
    git config submodule.third_party/jedi_deps/jedi.url $srcdir/jedi_deps/jedi
    git config submodule.third_party/jedi_deps/parso.url $srcdir/jedi_deps/parso
    git config submodule.third_party/python-future.url $srcdir/python-future
    git config submodule.third_party/requests_deps/requests.url $srcdir/requests_deps/requests
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
   	cp -r "$srcdir/$_gitname/third_party/"{bottle,frozendict,jedi_deps,python-future,requests_deps,waitress} \
		    "$pkgdir/$trgtdir/third_party"
	  find "$pkgdir" -name .git -exec rm -fr {} +
   	rm -rf "$pkgdir/$trgtdir/ycmd/tests"
}
