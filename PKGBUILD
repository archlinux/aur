# Maintainer: 4ztex <furkan.ahmet@kuika.com>
#
# AUR -git paketi. `pkgver()` her makepkg'da güncellenir → ana branch'in
# son commit'inden derler. Stabil release için ana repo'nun
# `packaging/PKGBUILD`'ini kullan.
#
# AUR submission rehberi: docs/RELEASING.md

pkgname=4ztexdock-git
_pkgname=4ztexdock
pkgver=0.1.0.r0.g9d54225
pkgrel=1
pkgdesc="Wayland layer-shell taskbar/launcher for KDE Plasma (git)"
arch=('x86_64')
url="https://github.com/furkann-ahmet/4ztexDock"
license=('GPL-3.0-or-later')
depends=(
  'qt6-base'
  'qt6-wayland'
  'layer-shell-qt'
  'networkmanager'
  'pipewire-pulse'
)
makedepends=(
  'qt6-base'
  'qt6-wayland'
  'qt6-tools'
  'layer-shell-qt'
  'git'
  'pkgconf'
)
optdepends=(
  'spectacle: screenshot shortcut'
  'kcmshell6: settings shortcuts'
  'powerprofilesctl: power profile tile (laptops only)'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install=4ztexdock.install

source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # En son tag varsa onu kullan: vX.Y.Z-COUNT-gHASH formatından pkgver çevir.
  # Tag yoksa: 0.0.0.rREV.gHASH (revision = commit count).
  ( git describe --long --tags 2>/dev/null \
      | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ) \
  || printf "0.0.0.r%s.g%s" \
       "$(git rev-list --count HEAD)" \
       "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Eski build artefactlarını temizle (git checkout'tan sonra yine olabilir).
  rm -f *.o moc_*.cpp moc_*.h Makefile 4ztexDock .qmake.stash
}

build() {
  cd "$srcdir/$_pkgname"
  lrelease6 translations/4ztexDock_tr.ts translations/4ztexDock_en.ts
  qmake6 4ztexDock.pro
  make -j$(nproc)
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 4ztexDock "$pkgdir/usr/bin/4ztexDock"
  install -Dm644 style/dock.qss "$pkgdir/usr/share/4ztexDock/style/dock.qss"
  # Icon klasörü
  for f in icons/*; do
    [ -f "$f" ] || continue
    install -Dm644 "$f" "$pkgdir/usr/bin/icons/$(basename "$f")"
  done
  # hicolor app ikonu
  if [ -f icons/4ztex-icon.svg ]; then
    install -Dm644 icons/4ztex-icon.svg \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/4ztex-icon.svg"
  fi
  # .desktop
  sed "s|@PREFIX@|/usr|g" packaging/4ztexDock.desktop.in \
    > "$srcdir/4ztexDock.desktop"
  install -Dm644 "$srcdir/4ztexDock.desktop" \
    "$pkgdir/usr/share/applications/com.4ztex.dock.desktop"
  install -Dm644 "$srcdir/4ztexDock.desktop" \
    "$pkgdir/etc/xdg/autostart/com.4ztex.dock.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/config.ini.example \
    "$pkgdir/usr/share/doc/$pkgname/config.ini.example"
}
