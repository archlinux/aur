# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=wutag-git
pkgver=20220922.cf71b88
pkgrel=1
epoch=
pkgdesc="CLI tool for tagging files"
arch=('x86_64')
url="https://github.com/wojciechkepka/wutag"
license=('MIT')
depends=()
makedepends=('cargo' 'git' 'help2man' )
install=".install"
provides=("wutag")
conflicts=("wutag")
sha1sums=('SKIP')
source=("$pkgname::git+https://github.com/wojciechkepka/wutag")

build() {
	cd "$pkgname"
	cargo build --release --bins
    ./target/release/wutag print-completions bash > wutag.bash
    ./target/release/wutag print-completions fish > wutag.fish
    ./target/release/wutag print-completions zsh  > _wutag
	help2man target/release/wutag > wutag.1
}

pkgver() {
	cd "$pkgname"
	echo "$(git log -1 --format=%cd.%h --date=short|tr -d -)"
}

package() {
	cd "$pkgname"
    install -Dm755 "target/release/wutag" "$pkgdir/usr/bin/wutag"
    install -Dm755 "target/release/wutagd" "$pkgdir/usr/bin/wutagd"
    install -Dm644 "example/wutagd.service" "$pkgdir/etc/systemd/user/wutagd.service"

    install -Dm644 "wutag.1" "$pkgdir/usr/share/man/man1/wutag.1"
    install -Dm644 "wutag.bash" "$pkgdir/usr/share/bash-completion/completions/wutag"
    install -Dm644 "wutag.fish" "$pkgdir/usr/share/fish/vendor_completions.d/wutag.fish"
    install -Dm644 "_wutag" "$pkgdir/usr/share/zsh/site-functions/_wutag"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
