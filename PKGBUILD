# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=markless
pkgver=1.2.9
pkgrel=1
epoch=0
pkgdesc="Allows translating from and to Markless structured text files."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/shirakumo/cl-markless"
license=('zlib' 'BSD')
groups=()
options=("!strip")
makedepends=('sbcl')
source=("https://github.com/shirakumo/cl-markless/archive/v$pkgver.tar.gz"
       "https://beta.quicklisp.org/quicklisp.lisp")
b2sums=('ad5d79dd3f0a5a95c0ed8eba47700a16c3f37eafd76480ab529ac3bd8da78d20e9b1d984ca2ae5448c0b023d10be16efdd7c40bc219f91cf5d9a45fab885b0ea'
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
         --eval "(asdf:load-asd \"$(pwd)/cl-markless-$pkgver/cl-markless.asd\")" \
         --eval "(asdf:load-asd \"$(pwd)/cl-markless-$pkgver/plump/cl-markless-plump.asd\")" \
         --eval "(asdf:load-asd \"$(pwd)/cl-markless-$pkgver/epub/cl-markless-epub.asd\")" \
         --eval "(asdf:load-asd \"$(pwd)/cl-markless-$pkgver/markdown/cl-markless-markdown.asd\")" \
         --eval "(asdf:load-asd \"$(pwd)/cl-markless-$pkgver/latex/cl-markless-latex.asd\")" \
         --eval "(asdf:load-asd \"$(pwd)/cl-markless-$pkgver/standalone/cl-markless-standalone.asd\")" \
         --eval '(ql:quickload :cl-markless-standalone)' \
         --eval '(asdf:make :cl-markless)' \
         --eval '(quit)'
}

package() {
    mkdir -p "$pkgdir/usr/bin/"
    cp "cl-markless-$pkgver/standalone/cl-markless.run" "$pkgdir/usr/bin/markless"
}
