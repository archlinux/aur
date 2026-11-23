# Maintainer: teejer <teejer@localhost>
# KRDC with an integrated AI assistant panel: a right-hand chat dock that can
# screenshot the remote machine and drive its mouse and keyboard, with one
# conversation per connection. The AI code lives entirely in ai/ plus small
# hooks; upstream is otherwise untouched. Also carries a client-side dark mode
# filter (SmartInvert) and an opt-in RDP certificate verification bypass.
#
# The patch is generated from the source branches, not edited by hand:
#   https://github.com/Teejer/krdc-ai  branches ai-assistant + dark-mode-filter
# Combine them on top of the pinned upstream commit and diff, e.g.
#   git merge dark-mode-filter          # in a branch off ai-assistant
#   git diff <upstream-commit>..HEAD > krdc-ai.patch
# Editing the patch directly once worked, but it left the branches behind and
# nearly lost those fixes on the next refresh; land fixes on the branch first.
pkgname=krdc-ai
_commit=d47d17c86a88d437278c029b5c62b837c01d1e03
pkgver=27.03.70
pkgrel=1
pkgdesc="KDE Remote Desktop Client with an integrated AI assistant panel and a client-side dark mode filter"
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
