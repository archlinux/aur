# Maintainer: Edmund Lodewijks <e .lodewijks @ gmail. com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>

# Note that the regular `gnubg` does not have sound effects.
# They rely on `libcanberra-gtk2`, which would replace system
# `libcanberra`, which would probably wreck your system's audio.
# For sound, and a smaller footprint, install the gtk3 version.
# Thanks to AUR user `ligel`.

pkgbase=gnubg
pkgname=('gnubg' 'gnubg-gtk3')
pkgver=1.08.003
pkgrel=3
pkgdesc="World class backgammon application"
arch=('x86_64')
url="https://www.gnu.org/software/gnubg/"
makedepends=('gtk2' 'gtkglext' 'gtk3' 'libcanberra' 'python' 'curl' 'glib2' 'sqlite' 'gmp' 'readline' 'tango-icon-theme') 
license=('GPL-3.0-or-later')
source=(https://ftp.gnu.org/gnu/gnubg/gnubg-release-${pkgver}-sources.tar.gz{,.sig}
        "gnubg.desktop"
        "gnubg-gtk3-icons.patch"
        )
validpgpkeys=('39FC530C20B9B8C627E71BAC973B63D4ECB3B8BD')
b2sums=('6cb9ddcfbc71dbb4461daebb191046f02986a116e45acf09f219598fea6b066c38080c3a2b051de424eadcbe3a6c8a6e30794381d9edfb03dcc36102ed641e05'
        'SKIP'
        'e0dd8bf4408b55f8bca24674b778c453382d373eb49eb5752f98c6980171e4f05bdfbe60d3d495ce5da37c25dd3f033a31516a0a45e8c1b0f569b0c084cb27b3'
        '56f5e69c212c474e99788e78040cb515998912401ef7a0246fa5ef933fbe69e65da7ab59d5f0e3e08f0217b496ef6e923f917e50883923ce7f80fa085ab7cadd'
        )

prepare() {
  cd "gnubg-$pkgver"
  sed -i 's/-f/-fn/' doc/Makefile.in doc/Makefile.am

  # Run autogen before duplicating the build dir
  ./autogen.sh
  
  # Duplicate the source folder for a clean GTK3 build
  rm -rf "$srcdir/gnubg-gtk3"
  cp -r "$srcdir/gnubg-$pkgver" "$srcdir/gnubg-gtk3"

  # Make the GTK3 toolbar look for its own bundled icons first (so New/
  # Open/Save/Undo/Analyse/Analyse File don't depend on the system icon
  # theme), and give the toolbar a fixed dark background so those icons
  # - several of which are light/white themselves - stay legible no
  # matter what GTK theme the user has active. See gnubg-gtk3-icons.patch.
  cd "$srcdir/gnubg-gtk3"
  patch -Np3 -i "${srcdir}/gnubg-gtk3-icons.patch"
}

build() {
  # --- 1. Build Classic GTK2 + 3D Variant ---
  cd "$srcdir/gnubg-$pkgver"
  ./configure \
	  --prefix=/usr \
	  --bindir=/usr/bin \
	  --sysconfdir=/etc \
	  --mandir=/usr/share/man
  make

  # --- 2. Build GTK3 (No 3D) Variant ---
  cd "$srcdir/gnubg-gtk3"
  ./configure \
	  --prefix=/usr \
	  --bindir=/usr/bin \
	  --sysconfdir=/etc \
	  --mandir=/usr/share/man \
      --with-gtk3 \
      --without-board3d
  make
}

package_gnubg() {
  pkgdesc="GNU Backgammon (Classic GTK2 GUI with 3D board)"
  depends=('glibc' 'glib2' 'gtk2' 'gtkglext' 'libcanberra' 'python' 'curl' 'sqlite' 'gmp' 'readline')
  conflicts=('gnubg-gtk3')
  provides=('gnubg')

  cd "$srcdir/gnubg-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/gnubg.desktop \
    "$pkgdir"/usr/share/applications/gnubg.desktop
}

package_gnubg-gtk3() {
  pkgdesc="GNU Backgammon (GTK3 GUI without 3D board)"
  depends=('glibc' 'glib2' 'gtk3' 'libcanberra' 'python' 'curl' 'sqlite' 'gmp' 'readline')
  conflicts=('gnubg')
  provides=('gnubg')

  cd "$srcdir/gnubg-gtk3"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/gnubg.desktop \
    "$pkgdir"/usr/share/applications/gnubg.desktop

  # Bundle fixed-contrast copies of the few toolbar icons gnubg still
  # resolves via GTK_STOCK_* (New/Open/Save/Undo/Analyse/Analyse File),
  # sourced from tango-icon-theme (public domain), so they're legible
  # regardless of the user's installed icon theme. See prepare() /
  # gnubg-gtk3-icons.patch, which points GTK at this directory first.
  for pair in actions/document-new:actions/document-new \
              actions/document-open:actions/document-open \
              actions/document-save:actions/document-save \
              actions/edit-undo:actions/edit-undo \
              actions/system-run:actions/media-playback-start \
              places/folder:places/folder \
              actions/gtk-edit:actions/gtk-edit; do
    dest="${pair%%:*}"
    src="${pair#*:}"
    for size in 16x16 24x24; do
      if [[ -f "/usr/share/icons/Tango/$size/$src.png" ]]; then
        install -Dm644 "/usr/share/icons/Tango/$size/$src.png" \
          "$pkgdir/usr/share/gnubg-gtk3/icons/hicolor/$size/$dest.png"
      fi
    done
  done
}

