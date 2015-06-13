# Maintainer: Kyle Manna

pkgname=kicad-library-ab2-git
_repo=KiCad
pkgver=669.86efa0c
pkgrel=1
pkgdesc="The schematic and 3D libraries supported by AB2 tech"
arch=('any')
url="https://github.com/ab2tech/KiCad"
license=('GPL')
makedepends=('cmake' 'git')
conflicts=('kicad-library-bzr')
source=("git+https://github.com/ab2tech/KiCad.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_repo"

    # Use `git describe` if repo was tagged, instead hack a monotonically
    # increasing pkg version:
    cnt=$(git rev-list HEAD --count)
    hash=$(git rev-parse --short HEAD)
    echo "$cnt.$hash"
}

package() {
    cd "$srcdir/${_repo}" 

    install -d "$pkgdir/usr/share/kicad/library"
    cp -r "library" "$pkgdir/usr/share/kicad"

    install -d "$pkgdir/usr/share/kicad/footprints"
    cp -r modules/* "$pkgdir/usr/share/kicad/footprints/"

    install -d "$pkgdir/usr/share/kicad/modules/packages3d"
    cp -r 3d_models/* "$pkgdir/usr/share/kicad/modules/packages3d/"

    # Delete .gitignore
    find "$pkgdir/usr/share/kicad/" -iname .git\* -o -iname \*.stl \
        -print0 | xargs -0 rm
}
