# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: lukasbecker2 [at] [common mail ending from the company with for the most used search engine in the us and the eu]
# Contributor: Manuel Mendez <mmendez534@gmail.com>
# Contributor: Robin Martinjak <rob@kingofnerds.net>

set -u
pkgname='makeself'
#pkgname+='-git'
pkgver=2.6.0
pkgrel=1
pkgdesc='Utility to create self-extracting packages'
arch=('any')
#url='http://megastep.org/makeself'
url='https://makeself.io/'
license=('GPL-2.0-or-later')
depends=('bash')
optdepends=(
  'gzip: compression support'
  'bzip2: compression support'
  'pbzip2: compression support'
  'xz: compression support'
  'lzop: compression support (lzo)'
  'lz4: compression support'
  'zstd: compression support'
  'pigz: compression support'
  # 'base64: encoding support' # coreutils
  'gnupg: encryption support'
  'openssl: encryption support'
  'ncompress: compression support'
  #'md5sum: digest support' # coreutils
  #'sha256sum: digest support' # coreutils
  'tar: archive support'
)
_srcdir="${pkgname%-git}-release-${pkgver%.r*}"
source=("${_srcdir}.tar.gz::https://github.com/megastep/${pkgname%-git}/archive/release-${pkgver%.r*}.tar.gz")
md5sums=('8eaa1239b39a44674bcf514216c9fbab')
sha256sums=('3af5218dfb80d20a156d3c50fa0d510c7b244d9676813659f8d220bc95405f07')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  _srcdir="${pkgname}"
  source[0]="${_srcdir}::git+https://github.com/megastep/makeself.git"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  conflicts=('makeself')
  provides=("makeself=${pkgver%%.r*}")
  makedepends+=('git')
pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^release-//;s/-/.r/;s/-/./g'
}
elif [ "${pkgver%%.r*}" != "${pkgver}" ]; then
pkgver() {
  printf '%s\n' "${pkgver%%.r*}"
}
fi

prepare() {
  cd "${_srcdir}"
  sed -e 's|^HEADER=.*|HEADER=/usr/share/makeself/makeself-header.sh|' -i 'makeself.sh'
}

package() {
  cd "${_srcdir}"
  install -Dpm644 'README.md' -t "${pkgdir}/usr/share/makeself/"
  install -Dpm644 'makeself.1' -t "${pkgdir}/usr/share/man/man1/"
  install -Dpm755 'makeself.sh' "${pkgdir}/usr/bin/makeself"
  install -Dpm755 'makeself-header.sh' -t "${pkgdir}/usr/share/makeself/"
}
set +u

# vim:set ts=2 sw=2 et:
