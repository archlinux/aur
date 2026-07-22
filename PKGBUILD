# Maintainer: Taylor <taylor@taylorhardy.net>

pkgbase=genera-fonts
pkgname=('genera-fonts-latin' 'genera-fonts-symbols')
pkgver=0.1.1
pkgrel=1
pkgdesc='Unicode-encoded Symbolics Genera 8.5 bitmap fonts'
arch=('any')
url='https://github.com/htayj/genera-fonts'
license=('BSD-3-Clause' 'LicenseRef-Typeface-as-Typeface')
makedepends=('git' 'python' 'xorg-fonttosfnt')
checkdepends=('python-fonttools')
options=('!strip')
_tag_object='2e9113cea8d28c840000aabe6c1596049374aecd'
_project_revision='30625ea84506a18ab63028f4ce50a7248ccadf97'
_source_date_epoch=1784671066
source=("genera-fonts::git+https://github.com/htayj/genera-fonts.git#commit=${_project_revision}")
sha256sums=('c28e93765e77b4605ed8324b0c3fdcaaed1015e4c748a8c509531d2d4937ce34')

prepare() {
  cd genera-fonts

  [[ $(git rev-parse "v${pkgver}^{tag}") == "${_tag_object}" ]]
  [[ $(git rev-parse "v${pkgver}^{}") == "${_project_revision}" ]]
}

build() {
  cd genera-fonts
  make release \
    VERSION="v${pkgver}" \
    SOURCE_DATE_EPOCH="${_source_date_epoch}"
}

check() {
  cd genera-fonts
  make check-release \
    VERSION="v${pkgver}" \
    SOURCE_DATE_EPOCH="${_source_date_epoch}"
}

_package_group() {
  local group=$1
  local package_name=$2

  cd genera-fonts
  scripts/stage-linux-package.sh \
    --format arch \
    --group "${group}" \
    --destdir "${pkgdir}" \
    --version "v${pkgver}" \
    --no-fontconfig

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${package_name}/LICENSE"
  install -Dm644 NOTICE.md \
    "${pkgdir}/usr/share/licenses/${package_name}/NOTICE.md"
}

package_genera-fonts-latin() {
  pkgdesc='Unicode Symbolics Genera bitmap fonts containing Latin letters'
  _package_group latin genera-fonts-latin
}

package_genera-fonts-symbols() {
  pkgdesc='Unicode Symbolics Genera specialty bitmap fonts'
  _package_group symbols genera-fonts-symbols
}
