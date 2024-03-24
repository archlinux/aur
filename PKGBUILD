# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: sanduhrs <stefan.auditor@erdfisch.de>
pkgname=gnome-shell-extension-caffeine-git
_uuid=caffeine@patapon.info
pkgver=50.r16.g8e60bbb
pkgrel=1
pkgdesc="Disable the screensaver and auto suspend"
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/eonpatapon/gnome-shell-extension-caffeine.git'
        'https://github.com/eonpatapon/gnome-shell-extension-caffeine/pull/317.patch')
sha256sums=('SKIP'
            'e9c0bd7fc1cf20e4fb094922f752a45aa581291a5eb1b2b806538d3316569fe3')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Port extension to GNOME 46
  patch -Np1 -i ../317.patch
}

build() {
  cd "${pkgname%-git}"
  make build
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dm644 "${_uuid}/schemas/org.gnome.shell.extensions.caffeine.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
