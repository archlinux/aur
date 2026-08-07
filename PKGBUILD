# Maintainer: Esteban Rodriguez <esarodriguezme@gmail.com>

# Papers is proprietary software. The ReadCube Terms of Use forbid creating
# derivative works ("modify, translate, adapt or create derivative works"), so
# this package deliberately does NOT unpack or restructure the application.
#
# Per the Wine package guidelines, when a licence does not permit repackaging,
# "all the installing process must be done in the post_install phase [and] the
# build phase will only be for copying the install files". The upstream
# installer is therefore shipped verbatim and executed, unmodified, on first
# run. Because a Wine prefix is per-user state that root cannot create at
# pacman time, "post_install" here means the first launch of /usr/bin/readcube.
#
# Nothing is redistributed: the AUR carries only this PKGBUILD, and each user
# fetches the installer from Digital Science directly.

pkgname=readcube-wine
_appname=readcube
pkgver=5.0.32
pkgrel=1
pkgdesc="Reference and citation manager for academic research, via Wine"
arch=('x86_64')
url="https://www.papersapp.com/"
license=('LicenseRef-ReadCube-Terms')
depends=('wine' 'ttf-dejavu' 'ttf-liberation' 'hicolor-icon-theme')
makedepends=('icoutils' 'imagemagick')
provides=("$_appname")
conflicts=("$_appname")
install="${_appname}.install"
options=('!strip' '!debug')

# Immutable, versioned upstream artifact. New releases are announced in
#   https://update.readcube.com/desktop5/updates/win32/x64/latest.yml
# which carries both the version and the upstream sha512.
source=("${_appname}-${pkgver}.exe::https://update.readcube.com/desktop5/updates/win32/x64/Papers_v${pkgver}.exe"
        'readcube.sh'
        'readcube.desktop'
        'readcube.install'
        'readcube-fonts.reg')
sha256sums=('5f72771a7ef87e1bce8d70c28512905305970fcfbbbe3341333fd92af93ac517'
            '52a427d7d61c388585ddc031ee69952f72560490296bbc018b0938c482a59b99'
            '08bce2bc75e7c2b9c7147443ef924b27affcba17b482d1b1a4e1de477801aeb1'
            '70e307c95917012d3f0bea62fe283f36c2e19ec4df071cfed3191a307564dad5'
            'da81ebea6f7fa7fb01e0fc3c73191760c8351df7afc57d361ac60b25c965c8c3')
noextract=("${_appname}-${pkgver}.exe")

build() {
  cd "$srcdir"
  rm -rf icons
  install -d icons

  # Desktop-integration artwork only. The icon is read from the installer's own
  # PE resources; the application itself is never unpacked. icotool is not used
  # to split it because the largest members are PNG-compressed, which it
  # rejects ("incorrect total size of bitmap"), silently losing everything
  # above 64px.
  wrestool -x -t 14 -o icons "${_appname}-${pkgver}.exe"
  magick icons/*.ico 'icons/readcube-%d.png'
}

package() {
  cd "$srcdir"

  # Upstream installer, byte-for-byte as published.
  install -Dm644 "${_appname}-${pkgver}.exe" \
    "$pkgdir/usr/share/$_appname/${_appname}-installer.exe"

  install -Dm755 readcube.sh        "$pkgdir/usr/bin/$_appname"
  install -Dm644 readcube-fonts.reg "$pkgdir/usr/share/$_appname/fonts.reg"
  install -Dm644 readcube.desktop   "$pkgdir/usr/share/applications/$_appname.desktop"

  for png in icons/readcube-*.png; do
    size=$(magick identify -format '%w' "$png")
    install -Dm644 "$png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_appname.png"
  done

  # Upstream ships no licence file in the installer; point at the terms that
  # actually govern use, so the package still documents its licence.
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  printf '%s\n' \
    'Papers by ReadCube is proprietary software of Digital Science.' \
    'Use is governed by the ReadCube Terms of Use:' \
    '' \
    '    https://about.readcube.com/terms/' \
    '' \
    'No part of the application is redistributed by this package: the' \
    'upstream installer is downloaded from Digital Science at build time' \
    'and executed unmodified on first run.' \
    > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
