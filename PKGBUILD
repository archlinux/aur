# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-another-window-session-manager-git
pkgver=51.r1.gcf23fef
pkgrel=3
pkgdesc="A GNOME shell extension to close open windows gracefully and save them as a session."
arch=('any')
url="https://github.com/nlpsuge/gnome-shell-extension-another-window-session-manager"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'gnome-shell'
  'libgtop'
  'procps-ng'
)
makedepends=(
  'git'
  'jq'
)
optdepends=('ydotool: to make Close by rules work')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/nlpsuge/gnome-shell-extension-another-window-session-manager.git'
        '60-awsm-ydotool-uinput.rules')
sha256sums=('SKIP'
            '9f3e96fd1d964f3e6564e0ef859f5e4f5b59059aa89b2654bb3fe2c9abed4f27')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  gnome-extensions pack \
    --extra-source=dbus-interfaces/ \
    --extra-source=icons/ \
    --extra-source=model/ \
    --extra-source=template/ \
    --extra-source=ui/ \
    --extra-source=utils/ \
    $(find . -maxdepth 1 -name '*.js' -printf '--extra-source=%f ') \
    --force
}

package() {
  cd "${pkgname%-git}"
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"

  # https://github.com/nlpsuge/gnome-shell-extension-another-window-session-manager#how-to-make-close-by-rules-work
  install -Dvm644 "$srcdir/60-awsm-ydotool-uinput.rules" -t \
    "$pkgdir/usr/lib/udev/rules.d/"
}
