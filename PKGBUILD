# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-superliminal
pkgver=1.4
pkgrel=1
pkgdesc='First-person puzzle game based on forced perspective and optical illusions. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'bash'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'gtk3'
  'libglvnd'
  'pango'
  'zlib'
)
makedepends=('execstack' 'lgogdownloader' 'pv' 'unzip')
options=('!debug' '!strip')
_setup_basename="${_shortname}_${pkgver//./_}"

source=(
  "${_setup_basename}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)
noextract=("${_setup_basename}.sh")

sha512sums=(
  '1d002a851f6a4725ea382dc56dcbcbe3042390ec06577862a0fa25d34b9dff5946605ba35f6d0dd519b3ed7010b50e3e2a5ba901c0e1cdd829f0843ad9be050a'
  '3382308e1b7f0aebef5ea3d41d8de47164df9c353dec71173e2b148f86a25fce28b179bb85dd7a82e9e42cb7e537819a539177f617a486e137e9822659ebffc2'
  'c3cfbbec78227e36d31299565733766446a04ab32aee130921689785ec7d6a6c2ee7306879843df00d6cc14a591e27068e7c0e932708d387b06478b922ed2abc'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

_calculate_offset() {
  local installer_size script_size
  cd "${srcdir}"
  script_size="$(head -n 519 "${_setup_basename}.sh" | wc -c)"
  installer_size="$(
    head -n 519 "${_setup_basename}.sh" \
      | awk -F '"' '/^filesizes=/ { print $2 }'
  )"
  offset=$((script_size + installer_size))
}

prepare() {
  cd "${srcdir}"

  _calculate_offset
  zipfile="$(mktemp -t --suffix=.zip)"
  echo >&2 "Truncating ${offset} bytes"
  dd bs="${offset}" skip=1 if="${_setup_basename}.sh" \
    | pv -f -s "@${_setup_basename}.sh" > "${zipfile}"

  # Extract game files
  unzip "${zipfile}"
  rm -v "${zipfile}"

  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(awk 'NR==2' data/noarch/gameinfo)

  # Fix permissions
  find data -type f -exec chmod 644 '{}' +
  find data -regex '.*\.sh\|.*\.'"${CARCH}"'\|yad' -type f -exec chmod 755 '{}' +
  find data -type d -exec chmod 755 '{}' +
  chmod -R 755 data/noarch/game/Superliminal data/noarch/support/xdg-utils

  # Work around glibc 2.41 execstack issue
  # See also: https://sourceware.org/bugzilla/show_bug.cgi?id=32653
  execstack -c "data/noarch/game/SuperliminalGOG.${CARCH}"
  find data/noarch/game -name 'libfmod*.so' -exec execstack -c '{}' +

  # Remove unneeded 32-bit executable
  # Fixes false alarm in rebuild-detector
  rm -rfv data/noarch/support/yad/32
}

package() {
  echo >&2 'Packaging license'
  install -D -m 644 -T \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/End User License Agreement.txt"

  echo >&2 'Packaging game icon'
  install -D -m 644 -T \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging game data'
  mkdir -p "${pkgdir}/opt/${_shortname}"
  cp -R --preserve=mode \
    "${srcdir}"/data/noarch/* \
    "${pkgdir}/opt/${_shortname}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/${_shortname}.bash" \
    "${pkgdir}/usr/bin/${_shortname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
