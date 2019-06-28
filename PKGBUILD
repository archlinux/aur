# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)


pkgname=blackeye-git
pkgver=r27.gdfcd597
pkgrel=2
pkgdesc='The most complete phishing tool, 32 website templates + 1 customizable'
arch=('any')
url='https://github.com/thelinuxchoice/blackeye'
license=('GPL3')
depends=('php' 'wget' 'coreutils' 'bash')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

install="${pkgname%-git}.install"
source=('git+https://github.com/thelinuxchoice/blackeye.git'
        "${pkgname%-git}".{install,sh.patch}{.sig,})
sha256sums=('SKIP'
            'SKIP'
            '9b33022a2e7c377013a60b07b96e250b0d677a6edaeee2ec81b09f0d3dbabd26'
            'SKIP'
            'c8fbd92fc18aea1a09f842c10ac2ab450680810542a96438d8ab7ef8ae1e0363')
validpgpkeys=('7A194E3F7A8F867BEA8A5339023F078862ACFE50')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch -Np1 -i "$srcdir/${pkgname%-git}.sh.patch"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -dm755 "$pkgdir"/usr/{bin,share/{,doc/}"${pkgname%-git}"}
    install -m755 "${pkgname%-git}.sh" "$pkgdir/usr/share/${pkgname%-git}/"
    cp -r --no-preserve=ownership README.md LICENSE sites "$pkgdir/usr/share/${pkgname%-git}/"
    ln -s "/usr/share/${pkgname%-git}/README.md" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cat >"$pkgdir/usr/bin/${pkgname%-git}" <<-EOF
		#!/bin/sh

		cp -sufr /usr/share/blackeye "\${XDG_CACHE_HOME:-\$HOME/.cache}/"
		cd "\${XDG_CACHE_HOME:-\$HOME/.cache}/blackeye"
		./blackeye.sh
		cd - >/dev/null
	EOF
    chmod +x "$pkgdir/usr/bin/${pkgname%-git}"
}

