# Maintainer: chef <joshuaarmenta2008@gmail.com>
# This file is licensed under the terms of the MIT license.

pkgname=digits
pkgver=1.3.0
pkgrel=1
pkgdesc='Run T-Mobile DIGITS as a standalone application window on Linux'
arch=('any')
url='https://codeberg.org/chefberg/digits4linux'
license=('MIT')
depends=('xdotool')
optdepends=(
  'google-chrome: effectively required on Linux; the site accepts only Chrome or Edge'
  'microsoft-edge-stable-bin: alternative branded browser; untested here'
  'libnotify: desktop notifications with --watch'
)
makedepends=()

# Upstream is a single script plus two documents, all tracked in one git
# repository. Each is fetched from the immutable upstream commit that this
# pkgver refers to rather than from a version tag, so nothing but the PKGBUILD
# has to live in the AUR repository. To release, bump pkgver, replace the commit
# below, and refresh the three checksums with:
#
#   updpkgsums -r
#
_upstream='https://codeberg.org/chefberg/digits4linux/raw/commit/560d518adfd3766a6ef27677e28088ca5c3a687c'
source=("$pkgname::$_upstream/$pkgname"
        "LICENSE::$_upstream/LICENSE"
        "README.md::$_upstream/README.md")
sha256sums=('152c9ce8f037d4b9d705606b5d824f3d6ab2ac5bad9e6166102efd0f4977f8b1'
            '956e1905e63db22a3bef0a9b3336572800add9faa58fea8db2eae61a4e7c5480'
            '5de207ea42a03ee5272194739aa66e0960e41f84cfede3f1959896718330deda')
backup=()

# T-Mobile ships native DIGITS clients for Android, iOS, Windows and macOS but
# none for Linux, so this wraps the official web client in a chromeless browser
# window. There is no official DIGITS API or CLI; short-code and OTP messages
# are never delivered to DIGITS by carrier policy, which no client can change.
#
# google-chrome is an optdepend rather than a hard dependency because it is not
# in the official Arch repositories, only the AUR. It is still effectively
# required on Linux: the site gates on navigator.userAgentData.brands and accepts
# only Google Chrome or Microsoft Edge. Neither is in the official repositories,
# but both have AUR packages. On Windows and macOS T-Mobile ships native DIGITS
# clients, so this wrapper is only needed on Linux.

build() {
  cd "$srcdir"
  # Validate before install so a broken wrapper never lands in /usr/bin.
  bash -n "$pkgname"
}

check() {
  cd "$srcdir"
  bash -n "$pkgname"
  # The --help path reads its own header, so exercise it.
  bash "$pkgname" --help >/dev/null
}

package() {
  cd "$srcdir"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Desktop entry. Exec names the packaged binary rather than the script's
  # self-detected location so it resolves correctly for every user.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=DIGITS
GenericName=T-Mobile DIGITS
Comment=Text and call from your T-Mobile number without the phone
Exec=$pkgname
Icon=$pkgname
Terminal=false
Categories=Network;Telephony;
StartupNotify=true
Keywords=sms;text;message;phone;t-mobile;
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg" <<'EOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
  <path fill="#e20074" d="M4 2h16a2 2 0 0 1 2 2v16a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2z"/>
  <path fill="#fff" d="M7 8h10v2H7zm0 4h6v2H7zm0 4h10v2H7z"/>
</svg>
EOF
}
