# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=multiposter
pkgver=2.1.0
pkgrel=1
epoch=0
pkgdesc="An application to post to multiple services at once."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/shinmera/multiposter"
license=('zlib' 'BSD')
groups=()
options=("!strip")
makedepends=('sbcl')
source=("https://github.com/shinmera/$pkgname/archive/v$pkgver.tar.gz"
       "https://beta.quicklisp.org/quicklisp.lisp")
b2sums=('befda3a0a3881bc1713c8dfb9ec9289dd08bea95cc98192b557b72afeae77a62475dfc83d776d03a80bb735ac8e74d2fd4027ff3c0769774fe3cc3d5ce2a3051'
        '57d0d29e08d77176fea4f01e644fc11bdb96e9efbd132cbb9720192d3b47599f5ce3c6e0307b44c33add06bd70c28004b8efb8968f1d9deb881a2db4ac615772')

prepare() {
    if [ ! -d "quicklisp" ]; then
        sbcl --disable-debugger --no-sysinit --no-userinit \
             --load "quicklisp.lisp" \
             --eval '(quicklisp-quickstart:install :path "quicklisp/")' \
             --eval '(ql-dist:install-dist "http://dist.shirakumo.org/shirakumo.txt" :prompt NIL)' \
             --eval '(quit)'
    fi
}

build() {
    sbcl --disable-debugger --no-sysinit --no-userinit \
         --load "quicklisp/setup.lisp" \
         --eval "(asdf:load-asd \"$(pwd)/$pkgname-$pkgver/multiposter.asd\")" \
         --eval '(ql:quickload :multiposter)' \
         --eval '(asdf:make :multiposter)' \
         --eval '(quit)'
}

package() {
    mkdir -p "$pkgdir/usr/bin/"
    cp "$pkgname-$pkgver/multiposter" "$pkgdir/usr/bin/"
}
