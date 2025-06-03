# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-slay-the-princess
pkgver=2025.0305.105240
pkgrel=1
pkgdesc='Choice-driven psychological horror visual novel. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'bash'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'libglvnd'
  'pango'
  'python'
)
makedepends=('lgogdownloader' 'libxml2' 'pv' 'unzip')
options=('!strip')
_setup_basename="${_shortname}_${pkgver//./_}"

source=(
  "${_setup_basename}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)
noextract=("${_setup_basename}.sh")

sha512sums=(
  '1983c944fc915e726034388e1579b0c8029dc5c6df1e026e9d9c0fd0bd3ef0120cb02b92beae064b5064b48c1f88147c0c9ef30067a4feecb4e3249901e87b93'
  '053dadf56f087d73b8eb29d77779ce0c40c974c8dd93d17d8835f7d447e54e7fb6d784d250b4a0087e936be49c31427da67245514f5cb36cbe93ad6586c3a1cb'
  '31aa2a5d6ea3038e18011452e6da9826d6ff0b8eb7b6ad4df3ead21027887800d12842614e2ec9c930de3045c0f0e7d8fb011a5e09316f5155c7df7df2a1c0ad'
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

  # Extract game files, skipping the Ren'Py archive for now.
  # Going to unzip and concatenate the latter in a single pass later on.
  unzip "${zipfile}" -x 'data/noarch/game/game/archive.rpa.split*'

  echo >&2 "Splicing together the Ren'Py archive"
  archive_size="$(unzip -l "${zipfile}" | awk 'END { print $1 }')"
  for part in split0{0,1,2}; do
    unzip -p "${zipfile}" "data/noarch/game/game/archive.rpa.${part}"
  done \
    | pv -f -s "${archive_size}" \
    | dd iflag=fullblock of=data/noarch/game/game/archive.rpa bs=1M status=none
  rm -v "${zipfile}"

  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(
      xmllint \
        -xpath '/plist/dict/key[text()="CFBundleVersion"]/following-sibling::string[1]/text()' \
        data/noarch/game/SlaythePrincess.app/Contents/Info.plist
    )

  echo >&2 'Removing unneeded files meant for other OSes'
  rm -rfv data/noarch/support/yad/32  # fixes false alarm in rebuild-detector
  rm -rfv data/noarch/game/lib/py3-windows-x86_64
  rm -fv data/noarch/game/._SlaythePrincess.app
  rm -rfv data/noarch/game/SlaythePrincess.app
  rm -fv data/noarch/game/SlaythePrincess.exe
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
