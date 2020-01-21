# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Hilinus <itahilinus at hotmail dot it>
# Contributor: Alucryd <alucryd at gmail dot com>

set -u
pkgname='teamviewer8'
pkgver=8.0.227120
pkgrel=1
pkgdesc='All-In-One Software for Remote Support and Online Meetings'
arch=('i686' 'x86_64')
url='https://www.teamviewer.com'
license=('custom')
depends_i686=('gcc-libs' 'alsa-lib' 'libxdamage' 'libxtst' 'zlib' 'freetype2')
depends_x86_64=("${depends_i686/#/lib32-}")
depends=('bash')
provides=("teamviewer=${pkgver%%.*}")
conflicts=('teamviewer')
options=('!strip')
install="${pkgname}.install"
source_i686=("teamviewer_linux-${pkgver}.deb::http://www.teamviewer.com/download/version_8x/teamviewer_linux.deb")
source_x86_64=("teamviewer_linux_x64-${pkgver}.deb::http://www.teamviewer.com/download/version_8x/teamviewer_linux_x64.deb")
md5sums_i686=('167fa982715f7832b3bd610f43f1f467')
md5sums_x86_64=('7d9940bc7d98fd5fde1dcb5178aa688f')
sha256sums_i686=('5e394d18b028de7721376fdbfe539fdbebcd9d4f5d79b829257890872b771e84')
sha256sums_x86_64=('eb880fa450ee347baee781b1581c9dd0daf1ede390f9605bbbbb19e1935c58c9')

#PKGEXT='.pkg.tar.gz'

pkgver() {
  sed -E -n -e 's:^TV_VERSION="([^"]+)"$:\1:p' 'opt/teamviewer8/tv_bin/script/tvw_config'
}

prepare() {
  set -u
  cd "${srcdir}"
  bsdtar -xf data.tar.?z
  set +u
}

package() {
  set -u
  cd "${srcdir}"

# Install
  cp -dr --no-preserve='ownership' 'etc' 'opt' 'usr' 'var' "${pkgdir}/"

# Additional files
  rm "${pkgdir}/opt/teamviewer8/tv_bin/xdg-utils/xdg-email"
  install -dm755 "${pkgdir}/usr"/{lib/systemd/system,share/applications,share/licenses/teamviewer}
  install -Dm644 "${pkgdir}/opt/teamviewer8/tv_bin/script/teamviewerd.service" -t "${pkgdir}/usr/lib/systemd/system/"
  ln -s '/opt/teamviewer8/tv_bin/desktop/teamviewer-teamviewer8.desktop' -t "${pkgdir}/usr/share/applications/"
  ln -s '/opt/teamviewer8/License.txt' "${pkgdir}/usr/share/licenses/teamviewer/LICENSE"
  set +u
}
set +u
