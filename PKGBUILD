# Maintainer: Szymon Morawski <szymorawski@gmail.com>
# Contributor: Damian "G'lek" Mulligan <glek@glektarssza.com>

pkgbase=gvfs-chomikuj-git
pkgname=gvfs-chomikuj-git
pkgver=1.62.1.r6794.ga92b44c5
pkgrel=1
pkgdesc="Chomikuj.pl backend for gvfs (gvfs fork with Mobile API v3 support)"
arch=(x86_64)
url="https://github.com/hamster-instrumentality-project/gvfs"
license=(LGPL-2.0-only)
depends=('gvfs' 'glib2' 'glibc' 'json-glib' 'libgcc' 'libsoup3')
makedepends=('dbus' 'git' 'glib2-devel' 'gsettings-desktop-schemas' 'libsecret' 'meson' 'python')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd gvfs
  # The fork carries no git tags, so derive the version from meson.build
  # (upstream release version) plus the commit count and short hash.
  printf '%s.r%s.g%s' \
    "$(sed -n "s/^ *version: '\([^']*\)',.*/\1/p" meson.build | head -n1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  # This is an add-on on top of the installed gvfs, so only build what the
  # Chomikuj backend needs: the in-tree daemon libraries and gvfsd-chomikuj.
  # All other backends are disabled to keep the build small. Drop the
  # corresponding -D flags if you want to build the whole thing.
  local meson_options=(
    -D admin=false
    -D afc=false
    -D bluray=false
    -D cdda=false
    -D chomikuj=true
    -D dnssd=false
    -D fuse=false
    -D gcr=false
    -D gcrypt=false
    -D goa=false
    -D gphoto2=false
    -D gudev=false
    -D http=false
    -D keyring=true
    -D libusb=false
    -D logind=false
    -D mtp=false
    -D nfs=false
    -D onedrive=false
    -D sftp=false
    -D smb=false
    -D systemduserunitdir=no
    -D tmpfilesdir=no
    -D udisks2=false
    -D wsdd=false
  )

  arch-meson gvfs build "${meson_options[@]}"
  meson compile -C build
}

package() {
  local _stage="$srcdir/_stage"

  # Install into a staging tree and pick out the only two files we ship, so we
  # never conflict with the files owned by the gvfs package.
  DESTDIR="$_stage" meson install -C build --no-rebuild

  install -Dm755 "$_stage/usr/lib/gvfsd-chomikuj" \
    "$pkgdir/usr/lib/gvfsd-chomikuj"
  install -Dm644 "$_stage/usr/share/gvfs/mounts/chomikuj.mount" \
    "$pkgdir/usr/share/gvfs/mounts/chomikuj.mount"
}

# vim:set sw=2 et:
