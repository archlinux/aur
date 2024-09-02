pkgname=qlot
pkgver=1.5.10
pkgrel=1
pkgdesc="Common Lisp library manager"
url="https://github.com/fukamachi/qlot"
arch=('any')
license=('MIT')
depends=('sbcl')
source=("https://github.com/fukamachi/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9b6c18271c09daae8f1525a6aca1ff95f07b833bbbb729bb246e9da55ff28da0')

build() {
	cd ${srcdir}/${pkgname}

	# requred to generate some bundle lisp files (e.g. cl-unicode/methods.lisp)
	sbcl --noinform --no-sysinit --no-userinit --non-interactive \
	--load "${srcdir}/${pkgname}/.bundle-libs/bundle.lisp" \
	--eval "(asdf:load-asd #P\"${srcdir}/${pkgname}/qlot.asd\")" \
	--eval '(let ((*standard-output* (make-broadcast-stream)) (*trace-output* (make-broadcast-stream))) (mapc (function asdf:load-system) (list :qlot :qlot/subcommands :qlot/cli :qlot/fetch)))'

	printf '#!/bin/sh\nexec /usr/lib/%s/scripts/run.sh "$@"\n' "$pkgname" > "$srcdir/${pkgname}.sh"
}

package() {
	install -dm755 $pkgname "$pkgdir"/usr/lib
	cp -r $srcdir/${pkgname} ${pkgdir}/usr/lib/
	install -Dm755 $srcdir/${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
}
