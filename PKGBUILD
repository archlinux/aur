# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: qs9rx <that nick at enjoys dot it>
# Contributor: David Manouchehri <d@32t.ca>

pkgname=dump1090-git
_pkgname=${pkgname%-git}
pkgver=r386.bff92c4
pkgrel=5
pkgdesc="A simple Mode S decoder for RTLSDR devices. MalcolmRobb fork."
arch=('x86_64' 'aarch64')
url="https://github.com/MalcolmRobb/dump1090"
license=('BSD-3-Clause')
depends=('rtl-sdr')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
source=(
  "$_pkgname::git+$url.git"
  "$_pkgname.patch")
sha256sums=(
  'SKIP'
  'c5d6c2de9326686f88c0beea8f2ea3539187bc2b6f654fcc921517d9ccbce514')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # gcc10 tweaks
  patch -p1 -i "$srcdir/$_pkgname.patch"

  sed -i 's#./public_html#/usr/share/dump1090/public_html#g' dump1090.h
}

build() {
  cd "$srcdir/$_pkgname"
  make clean
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "dump1090" "$pkgdir/usr/bin/dump1090"
  install -Dm755 "view1090" "$pkgdir/usr/bin/view1090"
  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp -dpr --no-preserve=ownership public_html testfiles tools "$pkgdir/usr/share/$_pkgname/"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md TODO
  install -Dm644 "/dev/stdin" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << "EOF"
Copyright (c) 2013, Salvatore Sanfilippo
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
   may be used to endorse or promote products derived from this software without
   specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
EOF

}
