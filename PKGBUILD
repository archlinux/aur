# Mantainer: Alberto Santini <santini.alberto at upf dot edu>

# This PKGBUILD assumes that you want to use Cplex as the
# LP Solver. If you want to use Gurobi or QSopt, you need
# to change this PKGBUILD and the Makefile.patch file.
# The script also assumes that Cplex was installed via
# AUR, so its related files are under /usr. If you used
# IBM's binary installed, once more you have to edit this
# PKGBUILD and Makefile.patch to point to the installation
# dir (usually under /opt/...).

pkgname='exactcolors-git'
pkgdesc='A library to solve graph colouring and max-weighted stable set problems. Upstream repo by GitHub user heldstephan.'

_git_repo='exactcolors'
_cpx_major=$(pacman -Q cplex | awk '{ print $2 }' | awk -F "." '{ print $1 }')
_cpx_minor=$(pacman -Q cplex | awk '{ print $2 }' | awk -F "." '{ print $2 }' | awk -F "-" '{ print $1 }')

pkgver='r180.297c667'
pkgver() {
  cd "$srcdir/$_git_repo"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

pkgrel='1'
arch=('x86_64')
url='https://github.com/heldstephan/exactcolors'
license=('unknown')
depends=('cplex')
makedepends=('git')

source=("$srcdir/$_git_repo::git+https://github.com/heldstephan/exactcolors.git"
        'Makefile-cplex.patch'
        'Makefile-cplex-128.patch')

md5sums=('SKIP'
         '4c1854eef1f2499152153d5e06a1ebcc'
         '56bc71b1902ce0f07ec01f7e17ef5239')

prepare() {
    cd "$srcdir/$_git_repo"
    patch < "$srcdir/Makefile-cplex.patch"

    # Starting from Cplex 12.8 you need to explicitly link -ldl
    if [[ "$_cpx_major" = "12" && "$_cpx_minor" > "7" ]]; then
        patch < "$srcdir/Makefile-cplex-128.patch"
    fi
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
