# Maintainer: B.C. van Zuiden <zuiden@ilorentz.org>
_pkgname=aflplusplus
pkgname=${_pkgname}-git
pkgver=5.03c.r23.gd00707292
pkgrel=1
pkgdesc="Coverage-guided fuzzer, community-maintained successor of afl, with QEMU mode (git version)"
arch=('x86_64')
url="https://github.com/AFLplusplus/AFLplusplus"
license=('AGPL-3.0-or-later' 'Apache-2.0')
depends=('bash' 'capstone' 'clang' 'glib2' 'glibc' 'libatomic' 'libgcc' 'libstdc++' 'lld' 'llvm' 'python' 'zlib')
makedepends=('git' 'ninja')
checkdepends=('cmocka')
optdepends=('gnuplot: for afl-plot')
provides=('afl' 'afl++')
conflicts=('afl' 'afl++')
options=('!lto')
source=("git+https://github.com/AFLplusplus/AFLplusplus.git"
        "git+https://github.com/AFLplusplus/qemuafl.git"
        "git+https://gitlab.com/qemu-project/capstone.git"
        "slirp::git+https://gitlab.com/qemu-project/libslirp.git"
        "git+https://gitlab.com/qemu-project/keycodemapdb.git"
        "git+https://gitlab.com/qemu-project/berkeley-softfloat-3.git"
        "git+https://gitlab.com/qemu-project/berkeley-testfloat-3.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd AFLplusplus
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    cd AFLplusplus
    git submodule init qemu_mode/qemuafl
    git config submodule.qemu_mode/qemuafl.url "${srcdir}/qemuafl"
    git -c protocol.file.allow=always submodule update qemu_mode/qemuafl

    cd qemu_mode/qemuafl
    local _mod
    for _mod in capstone slirp ui/keycodemapdb tests/fp/berkeley-softfloat-3 tests/fp/berkeley-testfloat-3; do
        git submodule init "${_mod}"
        git config "submodule.${_mod}.url" "${srcdir}/${_mod##*/}"
    done
    git -c protocol.file.allow=always submodule update
}

build()
{
    cd AFLplusplus
    CFLAGS=${CFLAGS/-fcf-protection/} make PREFIX="/usr"
    (cd qemu_mode && unset CFLAGS CXXFLAGS && NO_CHECKOUT=1 ./build_qemu_support.sh)
}

check()
{
    cd AFLplusplus
    CFLAGS= CXXFLAGS= sh test/test-all.sh
}

package()
{
    cd AFLplusplus
    CFLAGS=${CFLAGS/-fcf-protection/} make install PREFIX="/usr" DESTDIR="${pkgdir}"
}
