# Maintainer: teejer <teejer@localhost>
# KRDC with an integrated AI assistant panel: a right-hand chat dock that can
# screenshot the remote machine and drive its mouse and keyboard, with one
# conversation per connection. The AI code lives entirely in ai/ plus small
# hooks; upstream is otherwise untouched. Patch applies to the pinned commit;
# to refresh, re-diff against a newer upstream commit at ../krdc.
pkgname=krdc-ai
_commit=5876dc366adc24f0751eaae6ef81cee742ce04e6
pkgver=26.11.70
pkgrel=13
pkgdesc="KDE Remote Desktop Client with an integrated AI assistant panel (per-connection chat, screenshots, mouse/keyboard control)"
arch=('x86_64')
url="https://invent.kde.org/network/krdc"
license=('GPL-2.0-or-later')
depends=('glibc' 'libstdc++' 'qt6-base' 'qtkeychain-qt6' 'wayland'
         'kbookmarks' 'kcmutils' 'kcompletion' 'kconfig' 'kconfigwidgets'
         'kcoreaddons' 'kcrash' 'kdnssd' 'kguiaddons' 'ki18n' 'kio'
         'knotifyconfig' 'kstatusnotifieritem' 'kwidgetsaddons' 'kxmlgui'
         'libssh' 'freerdp' 'libvncserver')
makedepends=('git' 'extra-cmake-modules')
provides=("krdc=${pkgver}")
conflicts=('krdc')
replaces=('krdc')
source=("krdc::git+https://invent.kde.org/network/krdc.git#commit=${_commit}"
        'krdc-ai.patch')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd krdc
  # makepkg reuses this checkout on rebuilds; discard anything a previous
  # prepare()/build() left behind so the patch always applies cleanly.
  git checkout -f -- . 2>/dev/null || true
  git clean -ffd 2>/dev/null || true
  patch -Np1 -i ../krdc-ai.patch
}

build() {
  cmake -B build -S krdc \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_AI=YES \
    -DWITH_SPICE=NO
  cmake --build build --target all
}

package() {
  cmake --install build --prefix "$pkgdir/usr"

  # KRDC's CMake runs update-mime-database at install time, which generates a
  # compiled mime database inside $pkgdir. Only the source xml under
  # packages/ belongs to this package: the compiled database is owned by
  # shared-mime-info and regenerated system-wide by its pacman hook. extra/krdc
  # strips it the same way; shipping it causes "exists in filesystem" conflicts.
  find "$pkgdir/usr/share/mime" -mindepth 1 -maxdepth 1 ! -name packages -exec rm -rf {} +
}
