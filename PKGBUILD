# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Danny Bautista <pyrolagus at gmail.com>
# Contributor: Agustin Borgna <hello[at]aborgna.com.ar>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Renan Birck <renan.ee.ufsm at gmail.com>

_pkgbase='logisim-evolution'
pkgbase="${_pkgbase}-git"
pkgname="${_pkgbase}-git"
pkgver=4.0.0+1.r5590.20250907.41bab056d
pkgrel=1
provides=("${_pkgbase}=${pkgver}")
conflicts=("${_pkgbase}")
pkgdesc='An educational tool for designing and simulating digital logic circuits.'
arch=('any')
url="https://github.com/reds-heig/logisim-evolution"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'java-runtime'
  'sh'
)
makedepends=(
  'git'
  'gradle>=8.5'
  # 'java-environment>=21'  # Versioned dependency seems not to be honoured here; `yay` wants to install jdk-openjdk version 17 which gives 'gradle' error.
  'jdk-openjdk>=21'
  'zopflipng-parallel'
)

source=(
  "${_pkgbase}::git+${url}.git"
  'logisim-evolution.xml'
  'logisim-evolution.desktop'
  'logisim-evolution.sh'
)
sha256sums=(
  'SKIP'                                                              # Main git source
  'f90c3709748af806a33c14e81c8bf91dc06c3a4f58fe00cfe14a8f1842e09dec'  # logisim-evolution.xml
  '086851b07012f669743080dc4f059cf7727b19200384070852b34e142533385b'  # logisim-evolution.desktop
  '35b6b4da515f1c5619d35bbedc1469e5ec5b823bf486efdfbb5b705b65e10656'  # logisim-evolution.sh
)

prepare() {
  cd "$srcdir/${_pkgbase}"

  git log > git.log
}

pkgver() {
  cd "$srcdir/${_pkgbase}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "$srcdir/${_pkgbase}"

  gradle --gradle-user-home "${srcdir}/.gradle" --no-daemon shadowJar

  zopflipng-parallel -m -- build/resources/main/resources/logisim/img/*.png
}

package() {
  cd "$srcdir/${_pkgbase}"

  _appver="$(grep -oP '(?<=^version = ).*$' gradle.properties | tr -d '-')"
  install -Dvm644 build/libs/logisim-evolution-${_appver}-all.jar \
      "${pkgdir}/usr/share/java/logisim-evolution/logisim-evolution.jar"

  install -Dvm644 "${srcdir}/logisim-evolution.xml" "${pkgdir}/usr/share/mime/packages/logisim-evolution.xml"
  install -Dvm644 "${srcdir}/logisim-evolution.desktop" "${pkgdir}/usr/share/applications/logisim-evolution.desktop"

  for _icon in build/resources/main/resources/logisim/img/logisim-icon-[0-9]*.png; do
    _SIZE="$(basename "${_icon}" .png | awk -F- '{print $3}')"
    install -Dvm644 "build/resources/main/resources/logisim/img/logisim-icon-${_SIZE}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_SIZE}x${_SIZE}/apps/logisim-evolution.png"
  done

  install -Dvm755 "${srcdir}/logisim-evolution.sh" "${pkgdir}/usr/bin/logisim-evolution"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" git.log README.md CHANGES.md CITATION.cff
  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgbase}/"

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/doc/${_pkgbase}/LICENSE.md"
}
