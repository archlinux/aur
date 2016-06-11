# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgnameu='InterCon-NetTool'
pkgname="${_pkgnameu,,}"
pkgver='1.8.55'
pkgrel='1'
pkgdesc='Administer SEH USB and parallel Print Servers'
arch=('i686' 'x86_64')
url='http://www.seh-technology.com/'
license=('custom')
depends_i686=('gcc-libs' 'fontconfig' 'freetype2' 'libx11' 'libxext' 'libxft' 'libxrender')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
# Debian: libc6 (>= 2.3.6-6~), libfontconfig1 (>= 2.8.0), libfreetype6 (>= 2.2.1), libgcc1 (>= 1:4.1.1), libstdc++6 (>= 4.2.1), libx11-6, libxext6, libxft2 (>> 2.1.1), libxrender1
_verwatch=("${url}services/downloads/download-printserver-extern/ps03a.html" 'InterCon-NetTool Version \([0-9\.]*\) for Linux.*' 't')
_srcdir="${_pkgnameu}-${pkgver}"
options=('!strip')
source=("${url}/fileadmin/user/downloads/tools/${_srcdir}.zip" 'intercon-nettool.desktop')
sha256sums=('cca62a130d52452b21d620c744a3c899edcee1e8c7575ec6e9dff47547a6bab3'
            '81149b190dd2373a6f8c8897ebd8593d76ddd92044eed79caf86249d4720e551')

prepare() {
  set -u
  cd "${_srcdir}"
  chmod 644 *
  local _ver="${pkgver/\./_}"
  _ver="${_ver/\./-}"
  bsdtar -x -f "${_pkgnameu}-${_ver}.i386.rpm"
  set +u
}

package() {
  set -u
  mv "${_srcdir}/usr" "${pkgdir}"
  cd "${pkgdir}/usr/"
  mv 'local' 'share'
  cd 'share'
  mv 'bin' 'lib' ..
  cd '../bin'
  sed -i -e 's:/usr/local/lib/:/usr/./././lib/:g' \
         -e 's:/usr/local/:/usr/share/:g' 'nettool'
  #mv 'nettool' 'intercon-nettool'
  cd "${srcdir}"
  install -Dpm644 'intercon-nettool.desktop' -t "${pkgdir}/usr/share/applications/"
  cd "${pkgdir}/usr/lib/nettool/"
  install -Dpm644 license*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
