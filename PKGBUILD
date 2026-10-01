# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=ai-usagebar-bin
_pkgname=ai-usagebar
pkgver=1.30.0
pkgrel=1
pkgdesc="Omarchy/Waybar widgets + TUI for AI plan usage (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/ai-usagebar"
license=('MIT')
depends=('gcc-libs')
optdepends=(
    'waybar: status bar that hosts the widget'
    'libnotify: desktop notifications on hard auth failures'
    # No plasma-desktop/plasma5support entries — see PKGBUILD. This variant
    # could not ship the plasmoid even if we wanted it to: its source is the
    # released binary tarball, which carries only the two binaries, the config
    # example, README and LICENSE.
)
provides=("$_pkgname=$pkgver")
# Conflict with both the source variant AND its auto-generated debug split.
# Without listing `ai-usagebar-debug` explicitly, swapping from source → bin
# leaves an orphan debug package that fights us over /usr/lib/debug paths.
conflicts=("$_pkgname" "$_pkgname-debug")
# The release tarball ships a pre-stripped binary, so re-stripping is a
# no-op and the auto-generated -debug split would be empty AND would
# collide with the source variant's `ai-usagebar-debug` package.
options=('!strip' '!debug')
validpgpkeys=('AE42EF5D73DD92E248815C95B65CCCAF64A99438') # AkitaOnRails <boss@akitaonrails.com>

# Per-arch sources — pacman picks the matching one for the host arch.
# The detached .sig accompanies each tarball so makepkg verifies source
# signatures against validpgpkeys (#282).
source_x86_64=(
    "$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz"
    "$_pkgname-$pkgver-x86_64.tar.gz.sig::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz.sig"
)
source_aarch64=(
    "$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz"
    "$_pkgname-$pkgver-aarch64.tar.gz.sig::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz.sig"
)
sha256sums_x86_64=('f00e677321cdfc5374ae70ab91e14c04762b7889c883d2dd70eadb3ef4102a79' 'SKIP')
sha256sums_aarch64=('37095922ce29aa39bab95fb33fa9ebe776da2201f3e7b156a1ceae1cbd2d9427' 'SKIP')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                "ai-usagebar"
    install -Dm0755 -t "$pkgdir/usr/bin/"                "ai-usagebar-tui"
    install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/"    "config.example.toml"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
