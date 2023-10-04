# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

_reponame=rpc-wine
pkgname=discord-rpc-wine-git
pkgver=1.0.0.r2.ge432eb6
pkgrel=1
pkgdesc="discord-rpc implementation for Wine allowing Wine games to interact with native Discord"
arch=('x86_64' 'i686')
url="https://github.com/mellowagain/rpc-wine"
license=('MIT')
depends=('rapidjson' 'wine')
makedepends=('git' 'make')
options=('!buildflags')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=discord-rpc-wine.install
source=("git+https://github.com/mellowagain/rpc-wine"
        "discord-rpc-wine.sh")
sha256sums=('SKIP'
            '9dd85cb4ccd7524b7416c29967dcc0640c2784aaa9561ccc6799c81866b1cffc')

pkgver() {
	cd "$srcdir/${_reponame}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_reponame}"
	./build.sh
}

package() {
	cd "$srcdir/${_reponame}"
	if [ $CARCH == 'x86_64' ]; then
		install -D bin64/discord-rpc.dll.so $pkgdir/usr/lib/discord-rpc-wine/x86_64/discord-rpc.dll.so
	fi
	install -D bin32/discord-rpc.dll.so $pkgdir/usr/lib/discord-rpc-wine/i686/discord-rpc.dll.so
	install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
	cd "$srcdir"
	install -Dm 755 discord-rpc-wine.sh $pkgdir/etc/profile.d/discord-rpc-wine.sh
}

