# Maintainer: Jack Frost <fbt@fleshless.org>
# % Trigger: 1459428626 %

pkgname=watchman-sm
pkgdesc='A service manager for linux written in bash'
license=( 'custom:ISC' )
pkgver=1.13.2
_commit='bd0104db1ba17eef6da0c23f5f2487882578d9b1'
pkgrel=1
arch=( 'any' )
url='https://gitlab.com/fbt/watchman'

depends=( 'bash' )
optdepends=( 'watchman-sm-services-git: example scripts that mostly work out of the box on arch' )

source=( "https://gitlab.com/fbt/watchman/repository/archive.tar.gz?ref=$pkgver" )

build() {
	cd "watchman-${pkgver}-${_commit}"
	./make.sh
}

package() {
	install_prefix='/usr'

	cd "watchman-${pkgver}-${_commit}"
	DESTDIR="$pkgdir" USR="$install_prefix" ./make.sh install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# BASH completion
	install -Dm644 bash/completion/watchman "$pkgdir/usr/share/bash-completion/completions/watchman"
	ln -s /usr/share/bash-completion/completions/watchman "$pkgdir/usr/share/bash-completion/completions/service"

	# a link to provide a system-wide 'service' script
	cd "${pkgdir}${install_prefix}/bin"; ln -s watchman-service service
}

sha1sums=('4714b4fd7e409935e82433a257fac9fc8677c898')
