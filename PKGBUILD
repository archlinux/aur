# Mantainer: Alberto Santini <santini.alberto at upf dot edu>

# This PKGBUILD assumes that you want to use Cplex as the
# LP Solver. If you want to use Gurobi or QSopt, you need
# to change this PKGBUILD and the Makefile.patch file.
# The script also assumes that Cplex was installed via
# AUR, so its related files are under /usr. If you used
# IBM's binary installed, once more you have to edit this
# PKGBUILD and Makefile.patch to point to the installation
# dir (usually under /opt/...).

_git_repo='exactcolors'

pkgname='exactcolors-git'
pkgdesc='A library to solve graph colouring and max-weighted stable set problems. Upstream repo by GitHub user heldstephan.'

pkgver='r180.297c667'
pkgrel='1'
arch=('x86_64')
url='https://github.com/heldstephan/exactcolors'
license=('unknown')
depends=('cplex')
makedepends=('git')

source=("git+https://github.com/heldstephan/exactcolors.git"
        'Makefile-cplex.patch'
        'Makefile-cplex-128.patch')

sha256sums=('SKIP'
            '0d0d2a15fc0b2a651dc24b4541476e9fc8bd3b0ed90a6eddbcd18198c28dde8b'
            'f7eea9471b0f1205969ed3d8986d86ec990713b3a52f2c6a02166cbc9300a672')

pkgver() {
  cd "$srcdir/$_git_repo"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd "$srcdir/$_git_repo"
    patch < "$srcdir/Makefile-cplex.patch"

    # Patch required for CPLEX >= 12.8 (harmless otherwise)
    patch < "$srcdir/Makefile-cplex-128.patch"
}

build() {
    cd "$srcdir/$_git_repo"
    make
}

package() {
    cd "$srcdir/$_git_repo"

    install -dm755 "$pkgdir/usr/include/exactcolors/mwis_sewell"
    install -m644 *.h "$pkgdir/usr/include/exactcolors"
    install -m644 mwis_sewell/*.h "$pkgdir/usr/include/exactcolors/mwis_sewell"

    install -dm755 "$pkgdir/usr/bin"
    for exe_file in $(find . -perm -111 -type f | grep -v test | grep -v .git); do
        install -m755 "$exe_file" "$pkgdir/usr/bin/exactcolors-$(basename $exe_file)"
    done
    
    install -dm755 "$pkgdir/usr/lib"
    install -m755 libexactcolor.a "$pkgdir/usr/lib"
    install -m755 mwis_sewell/libsewell.a "$pkgdir/usr/lib"

    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -m644 README "$pkgdir/usr/share/doc/$pkgname"
    install -m644 FAQ "$pkgdir/usr/share/doc/$pkgname"
}
