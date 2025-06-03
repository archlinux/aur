# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-unrest
pkgver=2.0.0.5
pkgrel=1
pkgdesc='Adventure RPG set in ancient India, focused on story and choices. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'alsa-lib'
  'bash'
  'dbus'
  'gcc-libs'
  'glib2'
  'glibc'
  'jack2'
  'libsndfile'
  'readline6'
  'sdl2'
  'sdl2_image'
  'sdl2_mixer'
  'sdl2_ttf'
)
makedepends=('lgogdownloader')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer1"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '50d600332b5934be4c386df452eea2da1fa4c128c4f3f0b7b36138b62190a3e025d575f9ed0248068e0e0298f439fc432ee45e6dc0afef4f2600238d4c1b3648'
  '0d66ef44bbabd583331c911dee6d79b618a68777f4b03f7bdaf3870b3a4270eadd08b8fb094e9502e570cd8c2143194d346ea10c1de78dfca8c2de37e8960dd6'
  '70275cfe2603c19990dfa2d7a7b57a5d77ebfa7043853f1e7d7305afb3c524cc0c841ff98a8c2301efd8e31de935e4c577d26666f9a87e9c088d3d49229d9d81'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(awk 'NR==2' data/noarch/gameinfo)

  # Remove vendored, outdated SDL libraries that depend on older versions
  # of system packages, which are no longer available on Arch repositories
  # nor the AUR
  rm -v data/noarch/game/lib/libSDL2*
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
