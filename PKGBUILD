
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=tinmop-git
_pkgname=${pkgname%-*}
pkgver=v0.9.2.r179.g662ff56
pkgrel=1
pkgdesc='Opinionated TUI client for gemini, pleroma and kami'
arch=('x86_64')
url='https://www.autistici.org/interzona/tinmop.html'
license=('GPL3')
depends=('openssl' 'sbcl' 'unzip')
makedepends=('git' 'gettext' 'sbcl')
source=(
	"git+https://notabug.org/cage/$_pkgname.git"
	'https://beta.quicklisp.org/quicklisp.lisp'
	'https://beta.quicklisp.org/quicklisp.lisp.asc'
	'git+https://github.com/McParen/croatoan'
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
validpgpkeys=('D7A3489DDEFE32B7D0E7CC61307965AB028B5FF7')
options=('!strip')

prepare() {
	cd "$srcdir"

	commit_hash=$(grep CROATOAN_COMMIT= "$_pkgname/quick_quicklisp.sh.in")
	commit_hash=$(printf '%s\n' "$commit_hash" | cut -d= -f2)

	cd "$srcdir/croatoan"
	git checkout "$commit_hash"
}

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/-/.r/;s/-/./'
}

_install_lisp_deps() {
	cd "$srcdir"

	sbcl_args=''

	if [ -r "quicklisp/setup.lisp" ]; then
		sbcl_args="$sbcl_args --load quicklisp/setup.lisp"
	else
		sbcl_args="$sbcl_args --load quicklisp.lisp"
		sbcl_args="$sbcl_args --eval \
			'(quicklisp-quickstart:install  :path \"quicklisp\")'"
	fi

	while read -r dep; do
	    sbcl_args="$sbcl_args --eval '(ql:quickload \"$dep\")'"
	done < "$_pkgname/lisp-dependencies"

	sbcl_args="$sbcl_args --eval '(sb-ext:quit)'"
	eval "sbcl --no-userinit $sbcl_args"

	ln -sft quicklisp/local-projects "$srcdir/croatoan"

	printf '(load "%s/quicklisp/setup.lisp")' "$srcdir" > sbclrc
}

build() {
	_install_lisp_deps

	cd "$srcdir/$_pkgname"
	autoreconf -fiv
	./configure --prefix='/usr' --sysconfdir='/etc'


	sed -i "s%LISP_COMPILER = .*%LISP_COMPILER = sbcl \
		--userinit '$srcdir/sbclrc'%" Makefile
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSES.org -t "$pkgdir/usr/share/licenses/$_pkgname"
}
