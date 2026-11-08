# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Contributor: Chrys <chrys@linux-a11y.org>

# makepkg supplies these variables and reads the package metadata.
# shellcheck disable=SC2034,SC2154

_gitname='fenrir'
pkgname="${_gitname}"
pkgver=2026.10.31
pkgrel=3
epoch=1
pkgdesc='A user space console screen reader written in Go'
arch=('x86_64' 'aarch64')
url="https://git.stormux.org/storm/fenrir"
license=('GPL-3.0-or-later')
depends=('glibc' 'alsa-lib' 'libevdev' 'libx11' 'libvterm')
optdepends=(
  'python: Codex message bridge'
  'speech-dispatcher: Default speech driver'
  'pulseaudio: PulseAudio sound server'
  'pipewire-pulse: PulseAudio-compatible sound server'
  'enchant: Spell checking (also requires a language dictionary)'
  'libusb: DECtalk USB speech synthesizer'
  'socat: Control running Fenrir screen reader'
  'xclip: X clipboard synchronization')
makedepends=('git' 'go>=1.27.2' 'pkgconf')
conflicts=('fenrir-git')
backup=(
  'etc/fenrirscreenreader/settings/settings.toml'
  'etc/fenrirscreenreader/keyboard/desktop.toml'
  'etc/fenrirscreenreader/keyboard/laptop.toml'
  'etc/fenrirscreenreader/punctuation/de.toml'
  'etc/fenrirscreenreader/punctuation/default.toml'
  'etc/fenrirscreenreader/punctuation/en.toml'
  'etc/fenrirscreenreader/punctuation/es.toml'
  'etc/fenrirscreenreader/punctuation/fr.toml'
  'etc/fenrirscreenreader/punctuation/pl.toml'
  'etc/fenrirscreenreader/punctuation/rhvoice-en.toml')
source=("git+https://git.stormux.org/storm/${_gitname}.git#tag=${pkgver}"
        'fenrirscreenreader.service')
install=fenrir.install
sha512sums=('SKIP'
            'f5fa96eae68d84c60a71d30a82a5bfd40b81c4d0f67c84e660f4a465e796e94a607de0c0cd1be2c9fc19a576a96495e94b8350b60be201ece8047767d0e55984')

build()
{
  cd "$srcdir/$_gitname" || return
  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/go-mod"
  # Allow makepkg -c to remove downloaded modules after packaging.
  go build -trimpath -buildmode=pie -mod=readonly -modcacherw \
    -ldflags "-linkmode=external" \
    -o fenrir ./cmd/fenrir
}

check()
{
  cd "$srcdir/$_gitname" || return
  ./fenrir --config config/settings/settings.toml --check-config
}

package()
{
  cd "$srcdir/$_gitname" || return
  install -Dm755 fenrir "$pkgdir/usr/bin/fenrir"
  install -Dm644 config/settings/settings.toml \
    "$pkgdir/etc/fenrirscreenreader/settings/settings.toml"
  install -Dm644 config/keyboard/*.toml -t "$pkgdir/etc/fenrirscreenreader/keyboard/"
  install -Dm644 config/punctuation/*.toml -t "$pkgdir/etc/fenrirscreenreader/punctuation/"
  install -d "$pkgdir/usr/share/sounds/fenrirscreenreader"
  cp -r config/sound/. "$pkgdir/usr/share/sounds/fenrirscreenreader/"
  install -Dm755 config/scripts/* -t "$pkgdir/usr/share/fenrirscreenreader/scripts/"
  install -Dm755 tools/*.sh tools/*.py -t "$pkgdir/usr/share/fenrirscreenreader/tools/"
  install -Dm644 docs/fenrir.1 "$pkgdir/usr/share/man/man1/fenrir.1"
  install -Dm644 README.md CREDITS docs/user.md docs/user.txt \
    -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 docs/audio-recovery.md \
    "$pkgdir/usr/share/doc/$pkgname/docs/audio-recovery.md"
  install -Dm644 "$srcdir/fenrirscreenreader.service" \
    "$pkgdir/usr/lib/systemd/system/fenrirscreenreader.service"
}

# vim: set ts=2 sw=2 et:
