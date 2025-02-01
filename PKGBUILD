# maintainer: harrietobrien <harrietobrien@protonmail.com>
pkgname=qlot
pkgver=1.6.0
pkgrel=1
pkgdesc="Common Lisp library manager"
url="https://github.com/fukamachi/qlot"
arch=('any')
license=('MIT')
depends=('sbcl')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0307e4880bc1f79b1c212ef7bafdda84cc415b390a7b7cec896e1eb52ea6064d')

build() {
	cd ${srcdir}/${pkgname}

	# required to generate some bundle lisp files (e.g. cl-unicode/methods.lisp)
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
