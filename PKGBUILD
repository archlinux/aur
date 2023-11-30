pkgname=qlot
pkgver=1.3.5
pkgrel=1
pkgdesc="Common Lisp library manager"
url="https://github.com/fukamachi/qlot"
arch=('any')
license=('MIT')
depends=('sbcl')
source=("https://github.com/fukamachi/${pkgname}/releases/download/1.3.5/${pkgname}-${pkgver}.tar.gz")
sha256sums=('656f43ee0e0a25102b048004284019c3a71b5c0dec7bff8b5bc19a8609bc694a')

build() {
	cd ${srcdir}/${pkgname}

	sbcl --noinform --no-sysinit --no-userinit --non-interactive \
	--load "${srcdir}/${pkgname}/.bundle-libs/bundle.lisp" \
	--eval "(asdf:load-asd #P\"${srcdir}/${pkgname}/qlot.asd\")" \
	--eval '(let ((*standard-output* (make-broadcast-stream)) (*trace-output* (make-broadcast-stream))) (mapc (function asdf:load-system) (list :qlot :qlot/cli :qlot/distify)))'

	printf '#!/bin/sh\nexec /usr/lib/%s/scripts/run.sh "$@"\n' "$pkgname" > "$srcdir/${pkgname}.sh"
}

package() {
	install -dm755 $pkgname "$pkgdir"/usr/lib
	cp -r $srcdir/${pkgname} ${pkgdir}/usr/lib/
	install -Dm755 $srcdir/${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
}
