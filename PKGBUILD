# Maintainer: Simon Schubert <simon@librem.one>
#
# Mail as an app: the QML tree in /usr/share/moarchy-mail, started by
# /usr/bin/moarchy-mail. That launcher opens it in the running Omarchy shell
# when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# Every word said to a mail server goes through /usr/lib/moarchy-mail/
# moarchy-mail, one run per request: Python with nothing but the standard
# library, because QML cannot open a TLS socket. It is a program, so it is in
# /usr/lib rather than beside the QML in /usr/share, and it is not on PATH:
# /usr/bin/moarchy-mail is the launcher.
#
# 0.1.0 was a shell plugin, copied onto the phone by a script and never
# packaged; 0.2.0 is the first package, reading and writing the same
# ~/.local/share/moarchy-mail.
pkgname=moarchy-mail
pkgver=0.2.0
pkgrel=1
pkgdesc='One email account over IMAP and SMTP, no HTML drawn, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The kit's icons are Nerd
# Font glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'python' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
optdepends=('xdg-utils: open links and saved attachments'
            'feedbackd: a sound when new mail comes'
            'libnotify: a notification when new mail comes, outside Omarchy')
# A release asset that packaging/release.sh builds from apps/mail at the tag,
# with shared/kit in place of the kit link -- not GitHub's generated archive,
# whose compression has moved under pinned checksums before.
source=("$url/releases/download/mail-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('8493a3618fd70f125fff114b74491b8fa08365097468204e5427fd7a12691dd7')

check() {
  cd "$pkgname-$pkgver"
  # The folder, the address and the message logic, then the helper's own
  # tests. The half of those that needs a mail server skips itself here;
  # tests/e2e.sh runs it against Dovecot.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
  (cd tests && PYTHONDONTWRITEBYTECODE=1 python3 -m unittest test_moarchy_mail)
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 libexec/moarchy-mail "$pkgdir/usr/lib/$pkgname/moarchy-mail"
  install -Dm755 bin/moarchy-mail "$pkgdir/usr/bin/moarchy-mail"
  install -Dm644 org.moarchy.Mail.desktop "$pkgdir/usr/share/applications/org.moarchy.Mail.desktop"
  install -Dm644 org.moarchy.Mail.compose.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Mail.compose.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Mail.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
