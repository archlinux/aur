#!/bin/bash
# Maintainer: 3bd <3bd3bdr@gmail.com>
# Mindcode Mlog Compiler

pkgname=mindcode-bin
pkgver=3.16.3
pkgrel=1
pkgdesc="Mindcode/Schemacode command-line compiler"
arch=('any')
url="https://github.com/cardillan/mindcode"
license=('MIT')
provides=(mindcode)
_jre=24
depends=("java-runtime>=$_jre.0")
source=("https://github.com/cardillan/mindcode/releases/download/v$pkgver/mindcode.jar")
sha512sums=('304374b501c2e3e8925db5592504721a795ffa3888d5f9201316ce6099471e06f7c569bd71dd3588be25da979440ed6ff23f0601dcc9709f6296b8f5240b4345')

build(){ :; }

package(){
	mkdir -p -- "$pkgdir"/usr/bin "$pkgdir"/usr/share/java/mindcode
	cp -- mindcode.jar "$pkgdir"/usr/share/java/mindcode/
	java=
	while read ver name;do
		[ "$ver" -ge "$_jre" ] || continue
		java=/usr/lib/jvm/$name
	done <<-EOF
		$(archlinux-java status |
			sed '1d
			s/^[[:space:]]*//
			s/ (default)$//
			h
			s/^[[:alpha:]]*-\([[:digit:]]*\)-.*$/\1/
			G;s/\n/ /'
		)
	EOF
	if [ ! "$java" ];then
		echo 'Could not find a suitable version of Java.'
		echo 'Install Java 24 and try again (e.g., jre-openjdk>=24.0).'
		exit 1
	fi
	cat >"$pkgdir"/usr/bin/mindcode <<-EOF
		#!/bin/sh --
		exec $java/bin/java -jar /usr/share/java/mindcode/mindcode.jar "\$@"
	EOF
	chmod +x "$pkgdir"/usr/bin/mindcode
	mkdir -p -- "$pkgdir"/usr/share/licenses/mindcode-bin
	cat >"$pkgdir"/usr/share/licenses/mindcode-bin/LICENSE <<-'EOF'
		Copyright (c) 2021 François Beausoleil <francois@teksol.info>
		Copyright (c) 2023-2026 Cardillan (https://github.com/cardillan)

		Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

		The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	EOF
}
