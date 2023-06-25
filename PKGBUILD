# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=try-git
pkgver=r135.b2df6b6
pkgrel=1
pkgdesc="Run a command and inspect its effects before changing your live system."
arch=('any')
url="https://github.com/binpash/try"
license=('MIT')
depends=('bash')
makedepends=('git' 'make' 'pandoc')
optdepends=('bash-completion: to have CLI completions')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('try::git+https://github.com/binpash/try.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}/man"
    make
}

check() {
	cd "$srcdir/${pkgname%-git}/test"
    warning "Note that tests cannot be run on virtual filesystem, like tmpfs!"
	bash ./run_tests.sh
    bash ./exit_code.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"

    install -Dm755 "try" "$pkgdir/usr/bin/try"
    install -Dm644 "man/try.1" "$pkgdir/usr/share/man/man1/try.1"
    install -Dm644 "completions/try.bash" "$pkgdir/etc/bash_completion.d/try"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
