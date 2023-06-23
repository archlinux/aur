# Maintainer: pallxk <aur@pallxk.com>
# Inspired by PKGBUILD of AUR package sencha-cmd-6

pkgname=sencha-cmd
pkgver=7.7.0.36
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
	'c77f696f189b5fc2b9b608df6f99544fe31cb68cf3aef419c27dff706053902f9c9c4eb28f72bb1e70746faf9fb10b59d72cae680016bae5c0275bafdc122ab2'
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
