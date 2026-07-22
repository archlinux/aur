# Maintainer: Taylor <taylor@taylorhardy.net>

pkgbase=cadr-fonts
pkgname=('cadr-fonts-latin' 'cadr-fonts-symbols')
pkgver=0.1.2
pkgrel=1
pkgdesc='Unicode-encoded MIT CADR bitmap fonts'
arch=('any')
url='https://github.com/htayj/CADR-fonts'
license=('BSD-3-Clause')
makedepends=('git' 'python' 'xorg-fonttosfnt')
options=('!strip')
_tag_object='8b59bfce015878cc50954008648303abf34c59ef'
_project_revision='abc875fc903eccc47c359f814b102d9a7af10c7d'
_cadr_revision='8e978d7d1704096a63edd4386a3b8326a2e584af'
_source_date_epoch=1784674272
source=(
  "CADR-fonts::git+https://github.com/htayj/CADR-fonts.git#commit=${_project_revision}"
  "mit-cadr-system-software::git+https://github.com/mietek/mit-cadr-system-software.git#commit=${_cadr_revision}"
)
sha256sums=('2aa6d35a7aabdacc9576b4a8f201e939f53341676926ec31d0fb9056e936eed5'
            'db5d3b8af94777573e0a1a0fd7aa24fb6cab142ef24f0eaa5ef10fa3596fe9a7')

prepare() {
  cd CADR-fonts

  [[ $(git rev-parse "v${pkgver}^{tag}") == "${_tag_object}" ]]
  [[ $(git rev-parse "v${pkgver}^{}") == "${_project_revision}" ]]

  # makepkg acquired both immutable Git sources. Redirect the submodule to the
  # local CADR checkout, then let the tagged superproject select its pinned
  # historical revision without another network fetch.
  git config \
    submodule.sources/mit-cadr-system-software.url \
    "${srcdir}/mit-cadr-system-software"
  git -c protocol.file.allow=always submodule update --init
}

build() {
  cd CADR-fonts
  make release \
    VERSION="v${pkgver}" \
    SOURCE_DATE_EPOCH="${_source_date_epoch}"
}

check() {
  cd CADR-fonts
  python scripts/check_release_dist.py --release-dir dist/release
}

_package_group() {
  local group=$1
  local package_name=$2

  cd CADR-fonts
  scripts/stage-linux-package.sh \
    --format arch \
    --group "${group}" \
    --destdir "${pkgdir}" \
    --version "v${pkgver}" \
    --no-fontconfig

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${package_name}/LICENSE.project"
  install -Dm644 LICENSE.source \
    "${pkgdir}/usr/share/licenses/${package_name}/LICENSE.source"
}

package_cadr-fonts-latin() {
  pkgdesc='Unicode MIT CADR proportional and monospaced bitmap fonts'
  _package_group latin cadr-fonts-latin
}

package_cadr-fonts-symbols() {
  pkgdesc='Unicode MIT CADR bitmap symbol and drawing fonts'
  _package_group symbols cadr-fonts-symbols
}
