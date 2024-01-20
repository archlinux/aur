# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-another-window-session-manager-git
pkgver=41.r10.g938fcf4
pkgrel=1
pkgdesc="A GNOME shell extension to close open windows gracefully and save them as a session."
arch=('any')
url="https://github.com/nlpsuge/gnome-shell-extension-another-window-session-manager"
license=('GPL-3.0-or-later')
depends=('glib2' 'gnome-shell' 'libgtop' 'procps-ng')
makedepends=('git')
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
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
    --extra-source=closeSession.js \
    --extra-source=constants.js \
    --extra-source=indicator.js \
    --extra-source=moveSession.js \
    --extra-source=openWindowsTracker.js \
    --extra-source=prefsCloseWindow.js \
    --extra-source=prefsColumnView.js \
    --extra-source=prefsWidgets.js \
    --extra-source=prefsWindowPickableEntry.js \
    --extra-source=restoreSession.js \
    --extra-source=saveSession.js \
    --extra-source=windowTilingSupport.js \
    --force
}

package() {
  cd "${pkgname%-git}"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf "${uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/" --no-same-owner

  install -Dm644 schemas/org.gnome.shell.extensions.another-window-session-manager.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"

  # https://github.com/nlpsuge/gnome-shell-extension-another-window-session-manager#how-to-make-close-by-rules-work
  install -Dm644 "$srcdir/60-awsm-ydotool-uinput.rules" -t "$pkgdir/etc/udev/rules.d/"
}
