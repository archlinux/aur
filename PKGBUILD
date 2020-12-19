# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=blackeye-git

epoch=1
pkgver() { git -C "${pkgname%-git}" describe --tags | sed 's/^v//;s/-/.r/;s/-g/./'; }
pkgver=1.0.0.r3.db23b39
pkgrel=1

pkgdesc='The most complete phishing tool - 38 website templates, updated version with ngrok'
arch=('x86_64')
url="https://github.com/Blackeye2/${pkgname%-git}"
license=('GPL3')

makedepends=('git')
depends=('php')
optdepends=('ngrok: if not installed, the binary will be downloaded into the user cache'
            'wget: used to download the ngrok binary if none is found')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+$url.git" "${pkgname%-git}.patch" "${pkgname%-git}.patch.sig")
sha256sums=('SKIP'
            '9de0d9c6b07324fd334e8e7db5b9d965ecaee01d029e71d4a9a1ebc4d179bfde'
            'SKIP')
validpgpkeys=('7A194E3F7A8F867BEA8A5339023F078862ACFE50')


prepare() {
    cd "${pkgname%-git}"
    patch -Np1 <"../${pkgname%-git}.patch"
    # clean up
    rm -f sites/*/saved.{ip,usernames}.txt
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 "${pkgname%-git}.sh" -t"$pkgdir/usr/share/${pkgname%-git}/"
    cp -a --no-preserve=o sites "$pkgdir/usr/share/${pkgname%-git}/"
    install -Dm644 README.md -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/${pkgname%-git}" <<-EOF
		#!/bin/sh

		cp -sufr /usr/share/${pkgname%-git} "\${XDG_CACHE_HOME:-\$HOME/.cache}/"
		cd "\${XDG_CACHE_HOME:-\$HOME/.cache}/${pkgname%-git}"
		./${pkgname%-git}.sh
	EOF
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
