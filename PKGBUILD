# Maintainer: Nythera Dev <https://github.com/Nythera-Dev>
_pkgname=nythera-files
pkgname=${_pkgname}-git
pkgver=0.1.0.r23.gd3f8a4a12531
pkgrel=3
pkgdesc='Nythera Files native Wayland file manager'
arch=(x86_64)
url='https://github.com/Nythera-Dev/Nythera-Files'
license=(MIT)
depends=('nythera-lib-git>=0.1.0' 'nythera-lib-git<0.2.0' libnythera_lib.so
         desktop-file-utils gdk-pixbuf2 glib2 glibc jemalloc 'libarchive>=3.4.0' libgcc libstdc++
         libxkbcommon polkit shared-mime-info tomlplusplus wayland xz zlib)
optdepends=(
  '7zip: create and extract password-protected 7z archives'
  'gvfs: Wastebin (trash://), removable media mounting, and remote filesystem support'
  'gvfs-afc: Apple mobile device browsing'
  'gvfs-dnssd: DNS-SD network service discovery'
  'gvfs-gphoto2: digital camera browsing'
  'gvfs-smb: SMB/CIFS network share browsing'
  'gvfs-mtp: MTP device browsing'
  'gvfs-nfs: NFS network share browsing'
  'polkit-gnome: graphical Polkit authentication in sessions without an agent'
  'udisks2: removable drive discovery and unmounting'
  'ffmpeg: video stills, embedded audio artwork, and media metadata'
  'ffmpegthumbnailer: filmstrip borders for video thumbnails'
  'poppler: first-page PDF thumbnails and metadata'
  'fzf: fuzzy filename search'
  'ripgrep: search plain-text file contents'
  'ripgrep-all: search extracted document and archive contents'
)
makedepends=(git meson ninja pkgconf)
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("$_pkgname")
options=(!debug)
source=("${_pkgname}::git+${url}.git#branch=testing")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf '%s.r%s.g%s' "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=12 HEAD)"
}

build() {
  arch-meson "$srcdir/$_pkgname" "$srcdir/build" -Dtests=disabled -Darchives=enabled \
    -Djemalloc=enabled -Dnative_optimizations=false --libexecdir=lib
  meson compile -C "$srcdir/build"
}

package() {
  meson install -C "$srcdir/build" --no-rebuild --destdir "$pkgdir"
  install -Dm644 "$srcdir/$_pkgname/packaging/arch/dev.nythera.FileManager.desktop" \
    "$pkgdir/usr/share/applications/dev.nythera.FileManager.desktop"
  install -Dm644 "$srcdir/$_pkgname/files-assets/concepts/nythera-files-icon.png" \
    "$pkgdir/usr/share/pixmaps/dev.nythera.FileManager.png"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
