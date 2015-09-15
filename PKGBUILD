# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Florian Léger <florian6 dot leger at laposte dot net>

set -u
pkgname='jwasm'
#_pkgname='JWasm211as'
pkgver='212s_140105'
pkgrel='1'
pkgdesc='a free MASM-compatible assembler'
arch=('i686' 'x86_64')
url='http://www.japheth.de/JWasm.html'
license=('custom')
depends=('glibc')
makedepends=('unzip') # much more reasonable than hd2u or dos2unix
_verwatch=('http://sourceforge.net/projects/jwasm/files/JWasm%20Source%20Code/' '\s\+JWasm\(.*\)\.zip.*' 'f')
source=("http://sourceforge.net/projects/jwasm/files/JWasm%20Source%20Code/JWasm${pkgver}.zip")
noextract=("${source[@]##*/}")
sha256sums=('2bef67d89c3d40d228ac2e24e3e41a60cd954cf0f1b7389680f7f03658b78f1c')

prepare() {
  set -u
  unzip -oaq -d "${pkgname}" "${noextract[0]}"
  cd "${pkgname}"
  sed -i -e 's:^c_flags =.*$:& -Wno-implicit-function-declaration:g' 'GccUnix.mak'
  test -r 'README.TXT' && mv 'README.TXT' 'Readme.txt'
  set +u
}

build() {
  set -u
  cd "${pkgname}"
  make -f 'GccUnix.mak' -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${pkgname}"
  install -Dpm755 'GccUnixR/jwasm' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'History.txt' 'Readme.txt' 'Doc/enh.txt' 'Doc/fixes.txt' 'Doc/gencode.txt' 'Doc/overview.txt' -t "${pkgdir}/usr/share/doc/jwasm/"
  install -Dpm644 'License.txt' -t "${pkgdir}/usr/share/licenses/jwasm/"
  set +u
}
set +u
