# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Florian Léger <florian6 dot leger at laposte dot net>

set -u
pkgname='jwasm'
#_pkgname='JWasm211as'
pkgver='2.13'
pkgrel='1'
pkgdesc='a free MASM-compatible assembler'
arch=('i686' 'x86_64')
#url='http://www.japheth.de/JWasm.html'
#url='https://sourceforge.net/projects/jwasm/files/JWasm%20Source%20Code/'
url='https://github.com/JWasm/JWasm'
license=('custom')
depends=('glibc')
#_verwatch=('https://sourceforge.net/projects/jwasm/files/JWasm%20Source%20Code/' '\s\+JWasm\(.*\)\.zip.*' 'f')
_verwatch=("${url}/releases.atom" '\s\+<link rel="alternate" type="text/html" href=".*/'"${url##*/}"'/releases/tag/v*\([^"]\+\)"/>.*' 'f') # RSS
_srcdir="${url##*/}-${pkgver}"
source=("${_srcdir}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('82bc14860ec1d0552daeffbd202f83f9bba6a2756056b5e21ef81fabdb8e83a4')

build() {
  set -u
  cd "${_srcdir}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -f 'GccUnix.mak' -s -j "${_nproc}"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm755 'GccUnixR/jwasm' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'History.txt' 'Readme.txt' 'Doc/enh.txt' 'Doc/fixes.txt' 'Doc/gencode.txt' 'Doc/overview.txt' -t "${pkgdir}/usr/share/doc/jwasm/"
  install -Dpm644 'License.txt' -t "${pkgdir}/usr/share/licenses/jwasm/"
  set +u
}
set +u
