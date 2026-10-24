# Maintainer: Gergely Imreh <gergely at imreh dot net>
# Contributor: Alastair Feille <me at alastair dot se>

pkgname=wget-lua
pkgver=1.21.3_at.20231215.01
pkgrel=1
pkgdesc="Wget with Lua scripting"
url="http://archiveteam.org/index.php?title=Wget_with_Lua_hooks"
license=('GPL-3.0-or-later')
depends=('glibc' 'zlib' 'zstd' 'gnutls' 'nettle' 'libidn2' 'libpsl' 'pcre2' 'util-linux-libs' 'luajit')
optdepends=("ca-certificates: HTTPS Downloads")
makedepends=('git' 'perl' 'autoconf-archive' 'gettext' 'gperf')
checkdepends=('python' 'perl-http-daemon' 'perl-io-socket-ssl')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("git+https://github.com/ArchiveTeam/wget-lua#tag=v${pkgver//_/-}"
        "git+https://https.git.savannah.gnu.org/git/gnulib.git#commit=c5c11d644737e04258f411ab8584f5ed816135ab"
        "nettle4.patch"
        "testenv-ssl.patch"
        "tests-tls1-seclevel.patch")
sha256sums=('ce1a57cdda29b12da5f0e248e5bd051e2ca4b845bbf45d8b3ded950103b68a67'
            '09c51b4d181699142823c5b7bd0405fe224678d8f0bc6c0a54abc4a2c1106865'
            '33b00fc091b232411fa962208e6892ed00e0547d7b3b750abcc3b6409943c9e7'
            '00d8566eaf871e63b5f82a933d970825e5fc5121a9c9369b551e673874066ee1'
            'de4db9219a5f7ba5bf4c1367afcd3612a9b1040f8016ea879d662c6a339175bd')
b2sums=('5f5e52622a7981bb82abe648129dbf789c27f14641e32716af2a41447a0586b52dfa469de71a55af22a8852025f07691d148062e12f4ab6297deb56ea1dc4597'
        'b02e5809dde7b358b75ef88097c14c4477b26292d2c59d53e5fa947f83dac08719ad414eb37db967b42376e7e3b3d6e1ba7e903330823b10585aab60e2fd3671'
        '44d99e4c4dae598282ad37753b13fc2fdcf56d0bddb52805061d58c9412b2e325c5aebc00291594a0f33566a66804beaa02c70da775425d5f85f2515640c9ccb'
        'e6469dad156cf4c571cb94c5350526cf101d7bbea5ac2acaa79d824dc7da15b8656b7d8f4123c63f0bbfa0c4dbe8533faf2d40ba5e781b37e9e23c18a2ff61ed'
        'e3214738814c88b0874eeb10a5ddbd5230765f68b9609d7e8f7db0c69d2caf5a1c60a77e375af778e1dfd2771c8f752754d886c665ad3f8ccf99b870d532dfbc')

prepare() {
  cd "$srcdir/wget-lua/"
  git submodule init
  git config submodule.gnulib.url "$srcdir/gnulib"
  git -c protocol.file.allow=always submodule update
  patch -Np1 -i "$srcdir/nettle4.patch"
  # Python 3.12 removed ssl.wrap_socket, which the testenv HTTPS server uses
  patch -Np1 -i "$srcdir/testenv-ssl.patch"
  # Let the Perl TLS 1.0/1.1 tests' server accept those protocols again
  patch -Np1 -i "$srcdir/tests-tls1-seclevel.patch"
  # Don't fetch the "latest" translations at build time (only the binary is packaged):
  # --skip-po covers wget's own, the no-op wget stub covers gnulib-tool's unconditional fetch
  mkdir -p "$srcdir/nofetch"
  printf '#!/bin/sh\nexit 0\n' > "$srcdir/nofetch/wget"
  chmod +x "$srcdir/nofetch/wget"
  PATH="$srcdir/nofetch:$PATH" ./bootstrap --skip-po
  autopoint --force   # updates gnulib_po/Makefile.in.in to the newer system gettext version
}

build() {
  cd "$srcdir/wget-lua/"
  # Pin every auto-detected feature so the result doesn't depend on the build host
  ./configure \
    --with-ssl=gnutls \
    --with-libpsl \
    --with-libuuid \
    --with-zstandard \
    --enable-pcre2 --disable-pcre \
    --disable-nls
  # configure silently falls back to Lua 5.1 if LuaJIT isn't found
  grep -q -- '-lluajit-5.1' src/Makefile || { echo "LuaJIT not detected"; return 1; }
  make
}

check() {
  cd "$srcdir/wget-lua/"
  # The C unit tests don't build upstream (free_subnets_list is undefined), so only run the Perl ones
  make -C tests check check_PROGRAMS= 'TESTS=$(PX_TESTS)'
  make -C testenv check
}

package() {
  cd "$srcdir"/wget-lua/src
  install -Dm755 wget "$pkgdir/usr/bin/wget-lua"
}
