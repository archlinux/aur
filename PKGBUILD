# Maintainer: Zoey Mertes (zmertes at zmertes dot net)
# shellcheck shell=bash disable=SC2034,SC2154

# release 1.1.0 notes
# * yay finally a proper packaging, no more nabbing it out of the macos version
# * yay svg icon!
# * for some reason they think their app binary being `mirror` is okay, we're moving it back to `PlaydateMirror`
# * the /usr/share/doc/mirror/README.md contains nothing of value, so we don't package it
# * they put the udev rule in /etc instead of /usr/lib, so we move it to the right spot
# * though, their udev rule is wayyyy too broad, so we're using our own
# * the app always tries to read gamecontrollerdb.txt from /usr/share/mirror/gamecontrollerdb.txt, so we're stuck putting the file there
#   (sorta felt like a wrapper env var script for that might be overkill)

# side note: are the playdate devs reading my pkgbuilds? because they did nearly every change I did in my original pkgbuild
# if so, can you make the binary named PlaydateMirror from the beginning pretty please? thanks <3

pkgname=playdate-mirror
pkgver=1.1.0
pkgrel=1
pkgdesc='Screen viewer and controller for the Playdate console'
arch=('x86_64')
url='https://play.date/mirror/'
license=('custom:proprietary')
depends=(
  'gtk3'
  'webkit2gtk'
)
makedepends=()
optdepends=()
options=()

source=(
  "https://download-cdn.panic.com/mirror/Linux/Mirror-${pkgver}.x86_64.deb"
  "50-playdate-mirror.rules"
)

sha512sums=(
  'c79ae1e7f7090e7746acb6ba85735449f44ea8b401ecbf13aebd9e0c160311cf66fc24cfa82ed3e18d678c9128ae538d3f61544df6e34697b51c4c8b2641e8c3'
  '84d348266722753a81bdf95e17917f4c4665c484fdb3ac258b0f46d5e3e92c62aff0df91b78c0e1d43ace9f2e15f3a9a6a24726a37302ddbf40499f5ca60864c'
)

build() {
  echo >&2 "Extracting the deb"
  cd "${srcdir}" || exit 2
  tar xvf "${srcdir}/data.tar.xz"

  echo >&2 "Patching the desktop file"
  sed -i -e 's|/usr/bin/mirror|/usr/bin/PlaydateMirror|' \
         -e 's/Name=Mirror/Name=Playdate Mirror/' \
   ./usr/share/applications/date.play.mirror.desktop
}

package() {
  # make needed directories
  # mkdir -p "${pkgdir}/usr/bin" \
  #   "${pkgdir}/usr/share/licenses/playdate-mirror/"

  echo >&2 'Packaging the mirror binary'
  install -D -m 755 "${srcdir}/usr/bin/mirror" "${pkgdir}/usr/bin/PlaydateMirror"

  echo >&2 'Packaging the mirror assets'
  mkdir -p "${pkgdir}/usr/share/"
  cp -vr "${srcdir}/usr/share/mirror" "${pkgdir}/usr/share/mirror"

  echo >&2 'Packaging the license'
  install -D -m 644 "${srcdir}/usr/share/doc/mirror/LICENSE.md" "${pkgdir}/usr/share/licenses/playdate-mirror/LICENSE.md"

  echo >&2 'Packaging the icon svg'
  install -D -m 644 -T \
    "${srcdir}/usr/share/icons/hicolor/scalable/apps/date.play.mirror.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/date.play.mirror.svg"

  echo >&2 'Packaging the udev rule'
  install -D -m 644 -T \
    "${srcdir}/50-playdate-mirror.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/50-playdate-mirror.rules"

  echo >&2 'Packaging the desktop file'
  install -D -m 755 -T \
    "${srcdir}/usr/share/applications/date.play.mirror.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}

