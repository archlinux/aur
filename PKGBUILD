# Maintainer: Taylor <taylor@taylorhardy.net>

pkgname=dec-fonts
pkgver=0.1.0alpha2
pkgrel=1
pkgdesc='DEC VT220 ROM-derived monospaced bitmap fonts'
arch=('any')
url='https://github.com/htayj/DEC-Fonts'
license=('MIT')
makedepends=(
  'bdf2psf'
  'git'
  'mkbold-mkitalic'
  'python'
  'xorg-fonttosfnt'
  'xorg-mkfontscale'
)
checkdepends=('fontconfig')
optdepends=('kbd: load the included PSF fonts on Linux virtual consoles')
options=('!strip' '!debug')
_upstream_tag='v0.1.0-alpha.2'
_tag_object='179fa71ada1f202b220c32030c695209ac9af996'
_project_revision='fb4435c01bf664841c546a1d28696a54cd35cfe3'
_source_date_epoch=1784466524
source=("DEC-Fonts::git+https://github.com/htayj/DEC-Fonts.git#commit=${_project_revision}")
sha256sums=('4c234c9add148eb1df6bba66aabc7c2728001c71aa57cf3efd75c0a4d11c4332')

prepare() {
  cd DEC-Fonts

  [[ $(git rev-parse "${_upstream_tag}^{tag}") == "${_tag_object}" ]]
  [[ $(git rev-parse "${_upstream_tag}^{}") == "${_project_revision}" ]]
}

build() {
  cd DEC-Fonts
  SOURCE_DATE_EPOCH="${_source_date_epoch}" ./convert.bash
}

check() {
  cd DEC-Fonts
  python3 scripts/check-bdf-metadata.py dist/fonts/bdf

  [[ $(find dist/fonts/bdf -maxdepth 1 -type f -name '*.bdf' | wc -l) -eq 12 ]]
  [[ $(find dist/fonts/otb -maxdepth 1 -type f -name '*.otb' | wc -l) -eq 3 ]]
  [[ $(find dist/fonts/psf -maxdepth 1 -type f -name '*.psf' | wc -l) -eq 3 ]]

  while IFS= read -r font; do
    fc-query --format '%{family}\n' "${font}" | grep -Eiq 'vt220|digital'
  done < <(find dist/fonts/otb -maxdepth 1 -type f -name '*.otb' | sort)
}

package() {
  cd DEC-Fonts
  scripts/stage-linux-package.sh --format arch --destdir "${pkgdir}"

  # Arch discovers /usr/share/fonts recursively and refreshes its caches with
  # package-manager hooks, so the upstream cross-distribution snippet is not
  # needed here.
  rm -f -- \
    "${pkgdir}/etc/fonts/conf.d/75-dec-fonts.conf" \
    "${pkgdir}/usr/share/fontconfig/conf.avail/75-dec-fonts.conf"
  rmdir --ignore-fail-on-non-empty -- \
    "${pkgdir}/etc/fonts/conf.d" \
    "${pkgdir}/etc/fonts" \
    "${pkgdir}/etc" \
    "${pkgdir}/usr/share/fontconfig/conf.avail" \
    "${pkgdir}/usr/share/fontconfig"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES.md \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
