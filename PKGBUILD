# Maintainer: Laura Demkowicz-Duffy

pkgname=pascal-fc
pkgver=5
pkgrel=2
pkgdesc="An implementation of pascal with extra constructs for teaching concurrent programming"
arch=('x86_64')
url="https://www-users.york.ac.uk/~ab38/pf.html"
license=('GPL-2.0-or-later')
depends=(bash)
makedepends=(git fpc ghostscript patchelf)
source=("$pkgname-$pkgver-fpc::git+https://github.com/lexbailey/Pascal-FC#commit=b1bd078511879f8b678c8f7395d727953415926f"
	"$pkgname-$pkgver-gnu.zip::https://www-users.york.ac.uk/~ab38/pfc/pfc-pc.zip"
	'install_script.patch')
md5sums=('f122e04b509c26896cb2493af815f8c8'
         '01478053aa44a6c4c4cfe82540386df8'
         '3884ea9df562df762d19be18b0349885')
noextract=($pkgname-$pkgver-gnu.zip)

prepare() {
	cd "$pkgname-$pkgver-fpc"
	patch --forward --strip=1 --input="$srcdir/install_script.patch"
	mkdir -p "$srcdir/$pkgname-$pkgver-gnu"
	cd "$srcdir/$pkgname-$pkgver-gnu"
	bsdtar -x -f ../$pkgname-$pkgver-gnu.zip
}

build() {
	cd "$pkgname-$pkgver-fpc"
	# unwrap LDFLAGS from -Wl, syntax
	LDFLAGS_UNWRAPPED="$(echo "$LDFLAGS" \
		| sed 's/-z[ ,]/-z/g' \
		| sed 's/-Wl,//g' \
		| sed 's/,/ /g' \
	)"
	# add the -k prefix to all of them
	FPC_LDFLAGS="-k$(echo "$LDFLAGS_UNWRAPPED" | sed 's/[[:space:]]\+/ -k/g')"
	# enable debugging if it's in CFLAGS
	if [[ "$CFLAGS" =~ ".*-g.*" ]]; then
		DEBUGFLAGS="-g"
	fi
	FPC_FLAGS="$DEBUGFLAGS $FPC_LDFLAGS -k-pie -k-zshstk -XS"
	make "FPC_FLAGS=$FPC_FLAGS" all
	# patch the interpreter since FPC seems to assume the existence of
	# /lib/ld64.so.1
	patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 pint pfccomp

	cd "$srcdir/$pkgname-$pkgver-gnu/doc"
	ps2pdf lrm.ps
	ps2pdf pc_ug.ps
}

check() {
	echo "Running PCSem example..."
	./$pkgname-$pkgver-fpc/pfccomp \
		"$pkgname-$pkgver-gnu/ex/sems/pcsem.pfc" listing objfile
}

package() {
	# install executables
	cd "$pkgname-$pkgver-fpc"
	_fpcver=$(fpc -iV)
	install -Dm0755 -t "$pkgdir/usr/bin" pfc pfccomp pint
	install -Dm0644 -t "$pkgdir/usr/lib/fpc/$_fpcver/units/$arch-linux/$pkgname" pfccomp.o pint.o

	# install documentation
	cd "$srcdir/$pkgname-$pkgver-gnu/doc"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" lrm.pdf pc_ug.pdf
	cd "$pkgdir/usr/share/doc/$pkgname"
	ln -sr lrm.pdf language_reference_manual.pdf
	ln -sr pc_ug.pdf user_guide_for_pc_compatibles.pdf
}
