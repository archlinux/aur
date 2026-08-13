# Maintainer: Scott Jones <scottajones@gmail.com>

pkgname=omarchy-webapp-theme
pkgver=0.3.3
pkgrel=1
pkgdesc="Make Slack, Discord, GitHub, Linear, Outlook and WhatsApp follow your Omarchy theme"
arch=('any')
url="https://github.com/scottjones/omarchy-webapp-theme"
license=('MIT')
# The host is pure bash + coreutils; coreutils is part of base, so bash is the
# only thing worth declaring. Omarchy 4+ is a hard runtime requirement, but it
# isn't a pacman package — omarchy-webapp-theme-setup enforces it at runtime.
depends=('bash')
optdepends=(
  'omarchy: Omarchy 4+ required -- provides the theme it reads and the theme-set hook'
  'chromium: supported browser'
  'brave-bin: supported browser'
  'google-chrome: supported browser'
)
# This package was omarchy-slack-theme through 0.2.x, before it grew packs for
# more sites than Slack.
replaces=('omarchy-slack-theme')
conflicts=('omarchy-slack-theme')
provides=('omarchy-slack-theme')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Pinned to the published v0.3.3 tag tarball. Regenerate with `updpkgsums` on
# every version bump — a stale sum fails the build for everyone.
sha256sums=('261b2efc13c3f03ebe1159a5a54b932cf44b88b6d68de9eeba3dfe7d92100ab8')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # The native-messaging host, at a stable path the system manifests point to.
  install -Dm755 native-host/omarchy-webapp-theme-host \
    "$pkgdir/usr/bin/omarchy-webapp-theme-host"

  # install.sh does double duty: ./install.sh in a checkout, and the per-user
  # setup command here. It detects which by looking for the repo layout beside
  # itself, so installed at this path it only does the per-user wiring.
  install -Dm755 install.sh "$pkgdir/usr/bin/omarchy-webapp-theme-setup"

  # The unpacked extension. Users get it via --load-extension, pointed here by
  # omarchy-webapp-theme-setup.
  install -dm755 "$pkgdir/usr/share/$pkgname/extension"
  install -Dm644 -t "$pkgdir/usr/share/$pkgname/extension" extension/*

  # The omarchy theme-set hook. Can't be installed into ~ from a package, so
  # omarchy-webapp-theme-setup links it into the user's hooks dir.
  install -Dm755 hooks/omarchy-webapp-theme \
    "$pkgdir/usr/share/$pkgname/hooks/omarchy-webapp-theme"

  # System-wide native-messaging manifests, so no per-user registration is
  # needed. Verified against the shipped binaries' compiled-in search paths:
  #   /etc/chromium/native-messaging-hosts   -> chromium AND brave
  #   /etc/opt/chrome/native-messaging-hosts -> google-chrome (brave reads it too)
  # Edge is best-effort: its path follows the same convention but is untested,
  # and an unused manifest is inert.
  local manifest
  manifest="$(sed 's|__HOST_PATH__|/usr/bin/omarchy-webapp-theme-host|' \
    native-host/com.omarchy.webapp_theme.json.template)"

  local d
  for d in /etc/chromium /etc/opt/chrome /etc/opt/edge; do
    install -dm755 "$pkgdir$d/native-messaging-hosts"
    printf '%s\n' "$manifest" \
      >"$pkgdir$d/native-messaging-hosts/com.omarchy.webapp_theme.json"
    chmod 644 "$pkgdir$d/native-messaging-hosts/com.omarchy.webapp_theme.json"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
