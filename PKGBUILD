# Maintainer: Mohamad Obeid <mobeid nine nine nine nine at gmail dot com>
# Contributor: Keo Ponleou Sok <dev.ponleousk@gmail.com>
pkgname=mixtapes-git
pkgver=2026.26.05.0
pkgrel=1
pkgdesc="A modern, Linux-first YouTube Music player"
arch=('any')
url="https://github.com/m-obeid/Mixtapes"
license=('GPL3')
# Note: webkitgtk-6.0 must come from the 'extra' repository. The CachyOS build
# is known to malfunction with Mixtapes - see the install hook below.
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'nodejs' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'yt-dlp' 'yt-dlp-ejs' 'python-requests' 'python-ytmusicapi' 'python-mprisify' 'python-mutagen')
makedepends=('git' 'clang')
optdepends=('ffmpeg: for downloading music')
provides=("mixtapes")
conflicts=("mixtapes")
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/m-obeid/Mixtapes.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  grep -oP '(?<=<release version=")[^"]+' com.pocoguy.Muse.metainfo.xml | head -1 | tr '-' '.'
}

build() {
  cd "$pkgname"
  glib-compile-resources --sourcedir=. src/muse.gresource.xml --target=src/muse.gresource

  # setup venv to use pip nuitka (instead of aur)
  python -m venv .venv
  source .venv/bin/activate
  pip install nuitka
  VENV_SITE_PACKAGES=$(python -c "import sysconfig; print(sysconfig.get_path('purelib'))")
  deactivate

  export PYTHONPATH="$VENV_SITE_PACKAGES:$PYTHONPATH"
  cd src
  
  # build with nuitka
  python -m nuitka --clang \
  --file-reference-choice=runtime \
  --include-package=ui \
  --include-package=api \
  --include-package=player \
  --include-module=logger \
  --output-filename=mixtapes \
  main.py
}

package() {
  cd "$pkgname"

  # install data files in the correct runtime directories
  install -d "$pkgdir/usr/lib/mixtapes"
  cp -r assets "$pkgdir/usr/lib/mixtapes/"

  install -d "$pkgdir/usr/lib/mixtapes/src"
  cp src/muse.gresource "$pkgdir/usr/lib/mixtapes/src/"
  cp src/mixtapes "$pkgdir/usr/lib/mixtapes/src/"

  install -d "$pkgdir/usr/lib/mixtapes/src/ui"
  cp src/ui/style.css "$pkgdir/usr/lib/mixtapes/src/ui/"
  
  # Install desktop file, metainfo and icons
  install -Dm644 com.pocoguy.Muse.desktop "$pkgdir/usr/share/applications/com.pocoguy.Muse.desktop"
  install -Dm644 com.pocoguy.Muse.metainfo.xml "$pkgdir/usr/share/metainfo/com.pocoguy.Muse.metainfo.xml"
  install -Dm644 assets/icons/hicolor/scalable/apps/com.pocoguy.Muse.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.pocoguy.Muse.svg"
  install -Dm644 assets/icons/hicolor/symbolic/apps/com.pocoguy.Muse-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.pocoguy.Muse-symbolic.svg"

  # symlink binary to exported path bin
  install -d "$pkgdir/usr/bin"
  ln -sf /usr/lib/mixtapes/src/mixtapes "$pkgdir/usr/bin/mixtapes"
  
  # Also provide 'muse' as an alias
  ln -sf /usr/bin/mixtapes "$pkgdir/usr/bin/muse"
}
