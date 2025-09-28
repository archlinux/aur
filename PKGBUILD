pkgname=clilog-git
pkgver=0.2.r2.g2dd2244 
pkgrel=1
pkgdesc="CLI To-do list manager built 100% in Bash with TUI support, adhering to XDG Base Directory Specification."
url="https://github.com/simeulinuxkaliaiwr/clilog"
license=('MIT')
arch=('any')
depends=('dialog')
makedepends=('git')

source=("${pkgname}::git+${url}" 
        'mit.txt::https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/mit.txt')

sha256sums=('SKIP'
            'e6919db13cacb3300f918d1048d996d0f4506e1f110b7caa21f31ea7ca3ef5b8') 

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' 2>/dev/null || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/clilog"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"

    sed -i 's|/usr/local/lib/clilog|/usr/lib/clilog|g' "bin/clilog" "src/interactive.sh"

    install -Dm755 "bin/clilog" "${pkgdir}/usr/bin/clilog"
    
    install -Dm644 "src/functions.sh" "${pkgdir}/usr/lib/clilog/functions.sh"
    install -Dm644 "src/interactive.sh" "${pkgdir}/usr/lib/clilog/interactive.sh"
    
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/mit.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
