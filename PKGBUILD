# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: fatalis <fatalis@fatalis.pw>

pkgname=lzbench
pkgver=2.4
pkgrel=1
pkgdesc='An in-memory benchmark of open-source compressors'
arch=(aarch64 armv7h riscv64 x86_64)
url='https://github.com/inikep/lzbench'
license=(
    '0BSD'                                          # xz
    'Apache-2.0'                                    # glza, kanzi-cpp, libbsc, libsais (bundled in bzip3), tamp, yappy
    'BSD-2-Clause'                                  # lizard, lz4, lzlib, lzsse, xxhash (bundled in aceapex, openzl)
    'BSD-2-Clause OR GPL-2.0-or-later'              # lzf
    'BSD-3-Clause'                                  # gipfeli, lzfse, openzl, snappy, zling, zxc
    'BSD-3-Clause OR GPL-2.0-only'                  # fast-lzma2, fse (bundled in lizard, openzl), huf (bundled in lizard), zstd
    'bzip2-1.0.6'                                   # bzip2
    'CC0-1.0'                                       # wflz
    'CDDL-1.0'                                      # lzjb
    'GPL-1.0-only OR GPL-2.0-only OR GPL-3.0-only'  # quicklz
    'GPL-2.0-only OR GPL-3.0-only'                  # lzbench
    'GPL-2.0-or-later'                              # lzmat, lzo, ucl
    'GPL-3.0-or-later'                              # lbzip2, pulsar, tornado
    'LGPL-3.0-or-later'                             # bzip3
    'LicenseRef-Public-Domain'                      # 7-zip, crush, lzham, lzrw, ppmd8
    'MIT'                                           # aceapex, brotli, fastlz, libdeflate, lzav, mbrotli, memlz, misa77, rapidhash (bundled in zxc), skim, slz
    'MIT OR Apache-2.0'                             # density, fearless_simd, thiserror
    'MIT AND Unlicense'                             # zpaq
    'Unlicense'                                     # csc, yalz77
    'Zlib'                                          # brieflz, liblzg, pdqsort (bundled in openzl), zlib, zlib-ng
)
depends=(glibc libgcc libgomp libstdc++)
makedepends=(cargo chrpath gcc zig)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver-fastlz-LICENSE::https://raw.githubusercontent.com/ariya/FastLZ/0.5.0/LICENSE.MIT
        $pkgname-$pkgver-liblzg-LICENSE::https://gitlab.com/mbitsnbites/liblzg/-/raw/182b56cb36843720f38eff2ec30db1deac4e85bd/LICENSE.txt
        $pkgname-$pkgver-memlz-LICENSE::https://raw.githubusercontent.com/rrrlasse/memlz/5fe7ccd56d04231a1e0f44ad108fc6b6e6b9c158/LICENSE
        $pkgname-$pkgver-xxhash-LICENSE::https://raw.githubusercontent.com/Cyan4973/xxHash/v0.8.3/LICENSE
        $pkgname-$pkgver-zxc-LICENSE::https://raw.githubusercontent.com/hellobertrand/zxc/v0.14.1/LICENSE
        rustflags.patch)
b2sums=('5a9ca51b4323db8cb8fe211a943c0cbb80002b1a21967e908c4cffb7335d217dbe8b01f5d7b34f9a057887ffdd23faceea08a03d541f73f4a906e97d53f5edbb'
        '4aef9b1eaff06cb7af4afe4be4815014f90bf8658441c37b21f9216673f54a356e7f4924e79f84cf76bd696536bee564fe1e9548e8336cca1e9d5c51cb43d2db'
        'b5c06bea9633a9e84116d64e21a3ee93e9294a6174a3917acf570a1ddbde6ce89229e61663189a0ba8e31bc8293a9050189d645d229a55533392dff8bbcb27a5'
        '0d1d139c217eda4a7f35beb32364bbf6c6d4b8bc23e83f7444c75c2f89a29a0835485e507786875f4a4c896989dc87a9e1a01bc38b5ad693c260323d009b8826'
        '55f75e0aa3d672e43562c1adf514f18ba145528d137c9848021d5f1a631d448e2e7d7102d892ce192c87050c926fe6bf2d85c2b75ab0ea08fba05a38d3b1b2c6'
        '64d6a86c8ac43bd1da62fce95c05a396cf281398ba887c6ca9a03365f32b3b8aa75d4eafe131f6fe1d9c075f7db26edfed6649bce3c0c63105785c11233f82a5'
        '24fc02c7ca72f6a03cbcd4dd3bdbd48f5d959fd7300e574de7dc51463621fd269ab5d1d7dbfaa1c165086bc27ea6c812c9de5f841dfc1b5de66533c8e81be48e')

prepare() {
    cd $pkgname-$pkgver
    patch -Np1 -i ../rustflags.patch
}

build() {
    cd $pkgname-$pkgver
    export CARGO_PROFILE_RELEASE_DEBUG=true
    make USER_CFLAGS="$CFLAGS" USER_CXXFLAGS="$CXXFLAGS" USER_LDFLAGS="$LDFLAGS"
    chrpath -d lzbench
}

package() {
    cd $pkgname-$pkgver

    install -Dm755 lzbench -t "$pkgdir/usr/bin"
    if [[ $CARCH != armv7h ]]; then
        install -Dm755 misc/rust-codecs/target/release/liblzbench_rust.so -t "$pkgdir/usr/lib"
    fi

    install -Dm644 doc/lzbench.7.txt "$pkgdir/usr/share/man/man7/lzbench.7"

    local license_dir="$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 bwt/bzip2/LICENSE                                  "$license_dir/bzip2-LICENSE"
    install -Dm644 lz/brieflz/LICENSE                                 "$license_dir/brieflz-LICENSE"
    install -Dm644 lz/brotli/LICENSE                                  "$license_dir/brotli-LICENSE"
    install -Dm644 lz/fast-lzma2/LICENSE                              "$license_dir/fast-lzma2-LICENSE"
    install -Dm644 lz/gipfeli/COPYING                                 "$license_dir/gipfeli-COPYING"
    install -Dm644 lz/libdeflate/COPYING                              "$license_dir/libdeflate-COPYING"
    install -Dm644 lz/lizard/LICENSE                                  "$license_dir/lizard-LICENSE"
    install -Dm644 lz/lz4/lib/LICENSE                                 "$license_dir/lz4-LICENSE"
    install -Dm644 lz/lzav/LICENSE                                    "$license_dir/lzav-LICENSE"
    install -Dm644 lz/lzfse/LICENSE                                   "$license_dir/lzfse-LICENSE"
    install -Dm644 lz/lzham/LICENSE                                   "$license_dir/lzham-LICENSE"
    install -Dm644 lz/lzlib/COPYING                                   "$license_dir/lzlib-COPYING"
    install -Dm644 lz/lzsse/LICENSE                                   "$license_dir/lzsse-LICENSE"
    install -Dm644 lz/mbrotli/LICENSE                                 "$license_dir/mbrotli-LICENSE"
    install -Dm644 lz/mbrotli/NOTICE                                  "$license_dir/mbrotli-NOTICE"
    install -Dm644 lz/misa77/LICENSE                                  "$license_dir/misa77-LICENSE"
    install -Dm644 lz/openzl/LICENSE                                  "$license_dir/openzl-LICENSE"
    install -Dm644 lz/slz/LICENSE                                     "$license_dir/slz-LICENSE"
    install -Dm644 lz/snappy/COPYING                                  "$license_dir/snappy-COPYING"
    install -Dm644 lz/xz/COPYING                                      "$license_dir/xz-COPYING"
    install -Dm644 lz/xz/COPYING.0BSD                                 "$license_dir/xz-COPYING.0BSD"
    install -Dm644 lz/zlib/LICENSE                                    "$license_dir/zlib-LICENSE"
    install -Dm644 lz/zlib-ng/LICENSE.md                              "$license_dir/zlib-ng-LICENSE.md"
    install -Dm644 lz/zstd/LICENSE                                    "$license_dir/zstd-LICENSE"
    install -Dm644 misc/density/src/LICENSE-MIT                       "$license_dir/density-LICENSE"
    install -Dm644 misc/rust-codecs/vendor/fearless_simd/LICENSE-MIT  "$license_dir/fearless_simd-LICENSE"
    install -Dm644 misc/rust-codecs/vendor/thiserror/LICENSE-MIT      "$license_dir/thiserror-LICENSE"
    install -Dm644 misc/skim/LICENSE                                  "$license_dir/skim-LICENSE"
    install -Dm644 misc/zpaq/COPYING                                  "$license_dir/zpaq-COPYING"

    # Licenses absent in the lzbench tarball
    install -Dm644 "$srcdir/$pkgname-$pkgver-fastlz-LICENSE" "$license_dir/fastlz-LICENSE"
    install -Dm644 "$srcdir/$pkgname-$pkgver-liblzg-LICENSE" "$license_dir/liblzg-LICENSE"
    install -Dm644 "$srcdir/$pkgname-$pkgver-memlz-LICENSE"  "$license_dir/memlz-LICENSE"
    install -Dm644 "$srcdir/$pkgname-$pkgver-xxhash-LICENSE" "$license_dir/xxhash-LICENSE"
    install -Dm644 "$srcdir/$pkgname-$pkgver-zxc-LICENSE"    "$license_dir/zxc-LICENSE"

    # License files not provided or only in source code
    cat > "$license_dir/aceapex-LICENSE" <<'EOF'
Copyright (c) 2026 yasha1971-coder

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

    cat > "$license_dir/libzling-LICENSE" <<'EOF'
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


    cat > "$license_dir/lzsse-platform-LICENSE" <<'EOF'
Copyright (c) 2016, Brian Marshall
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
EOF

    cat > "$license_dir/pdqsort-LICENSE" <<'EOF'
Copyright (c) 2021 Orson Peters

This software is provided 'as-is', without any express or implied warranty.
In no event will the authors be held liable for any damages arising from the
use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software in a
   product, an acknowledgment in the product documentation would be appreciated
   but is not required.

2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.

3. This notice may not be removed or altered from any source distribution.
EOF
}
