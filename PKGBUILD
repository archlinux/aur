# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=autosub-git
pkgver=r241.919059f
pkgrel=1
pkgdesc='Command-line utility for auto-generating subtitles for any video file'
arch=('any')
url='https://github.com/BingLingGroup/autosub'
license=('GPL2')
provides=('autosub')
depends=(
         'python-auditok'
         'python-pysubs2'
         'python-wcwidth'
         'python-fuzzywuzzy'
         'python-websocket-client'
         'python-requests'
         'python-progressbar'
         'python-googletrans'
         'python-google-cloud-speech'
         'python-levenshtein'
         )
makedepends=('python-setuptools' 'git')
optdepends=(
  'python-langcodes'
  'ffmpeg-normalize: for audio pre-processing'
)
source=("${pkgname%-git}::git+${url}.git#branch=alpha")
sha256sums=('SKIP')

prepare() {
  cd ${srcdir}/autosub
  sed -i 's|auditok==|auditok>=|' setup.py
  sed -i 's|except DistributionNotFound|except|' autosub/constants.py
  sed -i 's|sample_width=asource.get_sample_width(),|sample_width=2,channels=1,|' autosub/core.py
}

pkgver() {
  cd autosub
  ( set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd autosub
  python setup.py build
}

package() {
  cd autosub
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
