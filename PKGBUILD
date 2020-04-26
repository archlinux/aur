# Maintainer: Johannes Wellhöfer <johannes.wellhoefer+aur@gmail.com>
# Contributor : Florian Hahn <flo@fhahn.com>

pkgname=boogie-git
pkgdesc='Boogie is an Intermediate Verification Language (IVL) for describing proof obligations to be discharged by a 
reasoning engine, typically an SMT solver'
license=('custom: Ms-Pl')
pkgver=0.r5030.8448ac1c
pkgrel=1
depends=('z3-git' 'mono')
makedepends=('mercurial' 'wget' 'nuget>=2.12' )
conflicts=('boogie')
provides=('boogie')
arch=('any')
url='https://github.com/boogie-org/boogie'
source=($pkgname::'git+https://github.com/boogie-org/boogie.git'
        execute_boogie.sh
        license.txt)
md5sums=('SKIP'
         '3c484f49455c24eb8984461b9d78d45f'
         'ab2e2e62d9befcc932895745749d4a54')


pkgver() {
    cd "$pkgname"
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}/"
    nuget restore Source/Boogie.sln
    xbuild Source/Boogie.sln
}

package() {
    install -Dm755 execute_boogie.sh "${pkgdir}/usr/bin/boogie"
    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/boogie/LICENSE"
    cd "${srcdir}/${pkgname}/Binaries"

    # install dll and exe files
    for dll in $(ls *.dll *.exe)
    do
        install -Dm644 "$dll" "${pkgdir}/usr/lib/boogie/$dll"
    done
    ln -s /usr/bin/z3 "${pkgdir}/usr/lib/boogie/z3.exe"
}
