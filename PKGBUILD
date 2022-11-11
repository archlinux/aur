# Maintainer: pallxk <aur@pallxk.com>
# Inspired by PKGBUILD of AUR package sencha-cmd-6

pkgname=sencha-cmd
pkgver=7.6.0.87
pkgrel=1
pkgdesc='Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks'
url='https://www.sencha.com/products/extjs/cmd-download/'
arch=('x86_64')
license=('custom')
depends=('java-runtime>=8' 'java-runtime<=17' ruby fontconfig)
provides=(sencha-cmd-7)
conflicts=(sencha-cmd-5 sencha-cmd-6)
source=("https://trials.sencha.com/cmd/${pkgver%.*}/SenchaCmd-$pkgver-linux-amd64.sh.zip"
	"LICENSE")
sha512sums=(
	'faac38cd0ae8fb00aa6b1234aa162886c2b1ffdb83045f6797d675c9dd0e63395f32d2c1f8786e30056079ba792a3cfb074001db2286a31fc5e4749913c89a8c'
	'fda827d9cae0859f37c4b588ae4e1ad3e8e5b6316d23f070691db566291d5a10d17c03934c90d17a9ed9a88a6b80be9e2f4c74fcb25112fe0a3fce3154495915'
)
options=(!strip)

prepare() {
	rm -rf Sencha
	./SenchaCmd-$pkgver-linux-amd64.sh -q \
		-Dall=true \
		-V'addToPath$Integer'=1 \
		-dir "Sencha/Cmd/$pkgver"

	sed -i -e "s|$srcdir|/opt|g" Sencha/Cmd/$pkgver/.install4j/*
}

package() {
	install -d "$pkgdir/opt"
	cp -a Sencha "$pkgdir/opt"

	install -dm777 "$pkgdir/var/cache/$pkgname/repo"
	ln -s /var/cache/$pkgname/repo "$pkgdir/opt/Sencha/Cmd/repo"

	install -d "$pkgdir/usr/bin/"
	ln -s /opt/Sencha/Cmd/sencha "$pkgdir/usr/bin/sencha"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
