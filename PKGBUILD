# Maintainer: Florian Margaine <florian at margaine dot com>
pkgname=hermes
pkgver=1.8
pkgrel=1
pkgdesc="Authenticate on linux by plugging your USB stick!"
arch=(x86_64)
url="https://github.com/ralt/hermes"
license=('MIT')
depends=(pam)
makedepends=(sbcl wget buildapp libfixposix pam)
options=(!strip)
install=hermes.install
source=("https://github.com/ralt/$pkgname/archive/$pkgver.tar.gz")
md5sums=('9d3029dfb700ea51ab1f304971835f78')

build() {
        cd "$pkgname-$pkgver"
        make
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir" install
        # /lib is deprecated in arch
        mkdir -p $pkgdir/usr/lib/security
        mv $pkgdir/lib/security/pam_hermes.so $pkgdir/usr/lib/security/pam_hermes.so
        rm -rf $pkgdir/lib/

        mkdir -p $pkgdir/usr/share/licenses/hermes
        cat > $pkgdir/usr/share/licenses/hermes/LICENSE <<EOF
The MIT License (MIT)

Copyright (c) 2015 Florian Margaine

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
EOF
        echo "/!\\ ATTENTION /!\\"
        echo "Don't forget to enable hermes.service and the pam_hermes PAM module!"
        echo "/!\\ ATTENTION /!\\"
}
