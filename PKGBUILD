# Maintainer: Guilherme leonsombrio244@gmail.com

pkgname=clilog-git
pkgver=0.3.r28.gc1ceec6
pkgrel=1
pkgdesc="CLI To-do list manager built in Bash with TUI and Python for Web interface support, adhering to XDG Base Directory Specification."
url="https://github.com/simeulinuxkaliaiwr/clilog"
license=('MIT')
arch=('any')
depends=('bash' 'dialog' 'python' 'python-flask')  
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
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/zsh/site-functions"
    install -d "${pkgdir}/usr/share/fish/vendor_completions.d"

    sed -i 's|/usr/local/lib/clilog|/usr/lib/clilog|g' "bin/clilog" "src/interactive.sh" "src/functions.sh"

    install -Dm755 "bin/clilog" "${pkgdir}/usr/bin/clilog"
    install -Dm644 "src/functions.sh" "${pkgdir}/usr/lib/clilog/functions.sh"
    install -Dm644 "src/interactive.sh" "${pkgdir}/usr/lib/clilog/interactive.sh"
    install -Dm755 "src/clilog_web.py" "${pkgdir}/usr/lib/clilog/clilog_web.py"

    install -Dm644 "completions/clilog.bash" "${pkgdir}/usr/share/bash-completion/completions/clilog"
    install -Dm644 "completions/clilog.zsh" "${pkgdir}/usr/share/zsh/site-functions/_clilog"
    install -Dm644 "completions/clilog.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/clilog.fish"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/mit.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

