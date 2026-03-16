# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: fatalis <fatalis@fatalis.pw>

pkgname=lzbench
pkgver=2.2
pkgrel=3
pkgdesc='An in-memory benchmark of open-source compressors'
arch=(aarch64 armv7h riscv64 x86_64)
url='https://github.com/inikep/lzbench'
license=(
    '0BSD'                                          # xz
    'Apache-2.0'                                    # glza, kanzi-cpp, libbsc, tamp, yappy
    'BSD-2-Clause'                                  # lizard, lz4, lzlib, lzsse
    'BSD-2-Clause OR GPL-2.0-or-later'              # lzf
    'BSD-3-Clause'                                  # gipfeli, lzfse, snappy, zling
    'BSD-3-Clause OR GPL-2.0-only'                  # fast-lzma2, zstd
    'bzip2-1.0.6'                                   # bzip2
    'CC0-1.0'                                       # wflz
    'CDDL-1.0'                                      # lzjb
    'GPL-1.0-only OR GPL-2.0-only OR GPL-3.0-only'  # quicklz
    'GPL-2.0-only'                                  # ucl
    'GPL-2.0-only OR GPL-3.0-only'                  # lzbench
    'GPL-2.0-or-later'                              # lzmat, lzo
    'GPL-3.0-or-later'                              # tornado
    'LGPL-3.0-or-later'                             # bzip3
    'LicenseRef-Public-Domain'                      # 7-zip, crush, lzrw, lzham
    'MIT'                                           # brotli, fastlz, libdeflate, lzav, slz
    'MIT OR Apache-2.0'                             # density
    'MIT AND Unlicense'                             # zpaq
    'Unlicense'                                     # csc, yalz77
    'Zlib'                                          # brieflz, liblzg, zlib, zlib-ng
)
depends=(glibc libgcc libgomp libstdc++)
makedepends=(cargo chrpath gcc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('69389958cb2016a1dbbd462fff603057339d772902b055b8299f6759f1f9a8cbadf31489254bb93f967ca6863e2db32e8da8bfe429cf5dfc4a4b61280164f4e5')

build() {
    cd $pkgname-$pkgver
    export CARGO_PROFILE_RELEASE_DEBUG=true
    make USER_CFLAGS="$CFLAGS" USER_CXXFLAGS="$CXXFLAGS" USER_LDFLAGS="$LDFLAGS"
    chrpath -d lzbench
}

package() {
    cd $pkgname-$pkgver

    install -Dm755 lzbench "$pkgdir/usr/bin/lzbench"
    install -Dm755 misc/density/src/target/release/libdensity_rs.so "$pkgdir/usr/lib/libdensity_rs.so"

    install -Dm644 doc/lzbench.7.txt "$pkgdir/usr/share/man/man7/lzbench.7"

    local license_dir="$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 bwt/bzip2/LICENSE            "$license_dir/bzip2-LICENSE"
    install -Dm644 lz/brieflz/LICENSE           "$license_dir/brieflz-LICENSE"
    install -Dm644 lz/brotli/LICENSE            "$license_dir/brotli-LICENSE"
    install -Dm644 lz/fast-lzma2/LICENSE        "$license_dir/fast-lzma2-LICENSE"
    install -Dm644 lz/gipfeli/COPYING           "$license_dir/gipfeli-COPYING"
    install -Dm644 lz/libdeflate/COPYING        "$license_dir/libdeflate-COPYING"
    install -Dm644 lz/lizard/LICENSE            "$license_dir/lizard-LICENSE"
    install -Dm644 lz/lz4/lib/LICENSE           "$license_dir/lz4-LICENSE"
    install -Dm644 lz/lzav/LICENSE              "$license_dir/lzav-LICENSE"
    install -Dm644 lz/lzfse/LICENSE             "$license_dir/lzfse-LICENSE"
    install -Dm644 lz/lzlib/COPYING             "$license_dir/lzlib-COPYING"
    install -Dm644 lz/lzsse/LICENSE             "$license_dir/lzsse-LICENSE"
    install -Dm644 lz/slz/LICENSE               "$license_dir/slz-LICENSE"
    install -Dm644 lz/snappy/COPYING            "$license_dir/snappy-COPYING"
    install -Dm644 lz/xz/COPYING                "$license_dir/xz-COPYING"
    install -Dm644 lz/zlib/LICENSE              "$license_dir/zlib-LICENSE"
    install -Dm644 lz/zlib-ng/LICENSE.md        "$license_dir/zlib-ng-LICENSE.md"
    install -Dm644 lz/zstd/LICENSE              "$license_dir/zstd-LICENSE"
    install -Dm644 misc/density/src/LICENSE-MIT "$license_dir/density-LICENSE"
    install -Dm644 misc/zpaq/COPYING            "$license_dir/zpaq-COPYING"

    # Compressors without dedicated LICENSE files
    cat > "$license_dir/fastlz-LICENSE" <<'EOF'
FastLZ - Byte-aligned LZ77 compression library
Copyright (C) 2005-2020 Ariya Hidayat <ariya.hidayat@gmail.com>

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

    cat > "$license_dir/liblzg-LICENSE" <<'EOF'
liblzg
Copyright (c) 2010-2013 Marcus Geelnard

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would
   be appreciated but is not required.

2. Altered source versions must be plainly marked as such, and must not
   be misrepresented as being the original software.

3. This notice may not be removed or altered from any source
   distribution.
EOF

    cat > "$license_dir/libzling-LICENSE" <<'EOF'
libzling - light-weight lossless data compression utility
Copyright (C) 2012-2013 by Zhang Li <zhangli10 at baidu.com>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the name of the project nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE PROJECT AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE PROJECT OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.
EOF

    cat > "$license_dir/lzf-LICENSE" <<'EOF'
liblzf
Copyright (c) 2000-2010 Marc Alexander Lehmann <schmorp@schmorp.de>

Redistribution and use in source and binary forms, with or without modifica-
tion, are permitted provided that the following conditions are met:

  1.  Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.

  2.  Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MER-
CHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPE-
CIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTH-
ERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
OF THE POSSIBILITY OF SUCH DAMAGE.

Alternatively, the contents of this file may be used under the terms of
the GNU General Public License ("GPL") version 2 or any later version,
in which case the provisions of the GPL are applicable instead of
the above. If you wish to allow the use of your version of this file
only under the terms of the GPL and not to allow others to use your
version of this file under the BSD license, indicate your decision
by deleting the provisions above and replace them with the notice
and other provisions required by the GPL. If you do not delete the
provisions above, a recipient may use your version of this file under
either the BSD or the GPL.
EOF
}
