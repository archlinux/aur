# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=rigetti-qvm-git
_pkgname=qvm
pkgver=r410.5f78341
pkgrel=1
pkgdesc="The @rigetti high-performance quantum virtual machine. "
arch=('x86_64' 'i686')
url="https://github.com/rigetti/qvm"
license=('Apache' 'AGPL3')
depends=('sbcl' 'quicklisp' 'rigetti-quilc-git' )
makedepends=( 'git' )
checkdepends=()
optdepends=()
options=(!strip)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/rigetti/qvm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
    git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
    sed -i "s/SBCL=\$(SBCL_BIN) --dynamic-space-size \$(QVM_WORKSPACE) --noinform --non-interactive --no-userinit --no-sysinit/SBCL=\$(SBCL_BIN) --dynamic-space-size \$(QVM_WORKSPACE) --noinform --non-interactive #--no-userinit --no-sysinit/" Makefile
    sed -i "s/(:version #:cl-quil \"1.16.0\")/(:version #:cl-quil \"1.15.0\")/" qvm-app.asd
    sed -i "s/(:version #:cl-quil \"1.16.0\")/(:version #:cl-quil \"1.15.0\")/" qvm.asd
    sed -i "s/(require 'asdf)/(require 'asdf)\n(ql:quickload \"cl+ssl\")/" build-app.lisp
}

build() {
	cd "$_pkgname"
	make qvm
}

check() {
	cd "$_pkgname"
	make test
}

package() {
	cd "$_pkgname"
    mkdir -p "$pkgdir/usr/bin"
    make DESTDIR="$pkgdir/usr" PREFIX="" install
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
