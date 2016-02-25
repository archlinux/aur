# Maintainer: Jack Frost <fbt@fleshless.org>
# % Trigger: 1434983485 %

pkgname=watchman-sm
pkgdesc='A service manager for linux written in bash'
license=( 'custom:ISC' )
pkgver=1.13.1
_commit='9e21a7db78b709c0667d6419340cfc1a12e50a9f'
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

sha1sums=('fca3765786d7a6f038947c5b9ae8ad7625e8bb79')
