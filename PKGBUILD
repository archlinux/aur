# Maintainer: Valentijn V. <deepnavy at waifu dot club>
# Contributor: Alastair Feille <me at alastair dot se>

pkgname=wget-lua
pkgver=1.21.3_at.20231213.03
pkgrel=1
pkgdesc="Wget with Lua scripting"
url="http://archiveteam.org/index.php?title=Wget_with_Lua_hooks"
license=('GPL')
depends=('gnutls' 'libidn' 'pcre' 'lua51')
optdepends=("ca-certificates: HTTPS Downloads")
makedepends=('git' 'perl' 'autoconf-archive' 'gettext' 'gperf' 'wget')
provides=('wget-lua')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("git+https://github.com/ArchiveTeam/wget-lua#tag=v${pkgver//_/-}"
        "git+https://git.savannah.gnu.org/git/gnulib.git#commit=c5c11d644737e04258f411ab8584f5ed816135ab")
sha1sums=('bad93dd33f8557ef0c81aadc9dc13506d74c1299'
          '3cc37ffe21690ddf1684ca40b285e7fd1953f851')

prepare() {
  cd "$srcdir/wget-lua/"
  git submodule init
  git config submodule.gnulib.url "$srcdir/gnulib"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/wget-lua/"
  ./bootstrap
  autopoint --force   # updates gnulib_po/Makefile.in.in to the newer system gettext version
  ./configure
  make
}

package() {
  cd "$srcdir"/wget-lua/src
  mkdir -p "$pkgdir/usr/bin/"
  cp wget "$pkgdir/usr/bin/wget-lua"
}

