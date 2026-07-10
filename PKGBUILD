# Maintainer: Mohamad Obeid <mobeid nine nine nine nine at gmail dot com>
# Contributor: Keo Ponleou Sok <dev.ponleousk@gmail.com>
pkgname=mixtapes-git
pkgver=2026.26.05.0
pkgrel=1
pkgdesc="A modern, Linux-first YouTube Music player"
arch=('x86_64' 'aarch64')
url="https://github.com/m-obeid/Mixtapes"
license=('GPL3')
# Note: webkitgtk-6.0 must come from the 'extra' repository. The CachyOS build
# is known to malfunction with Mixtapes - see the install hook below.
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'nodejs' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'yt-dlp' 'yt-dlp-ejs' 'python-requests' 'python-ytmusicapi' 'python-mprisify' 'python-mutagen')
makedepends=('git' 'clang' 'python-pip')
optdepends=('ffmpeg: for downloading music')
provides=("mixtapes")
conflicts=("mixtapes")
install="${pkgname}.install"
_botguard_ver=0.1.2
source=("${pkgname}::git+https://github.com/m-obeid/Mixtapes.git")
source_x86_64=("rustypipe-botguard-${_botguard_ver}-x86_64.tar.xz::https://codeberg.org/ThetaDev/rustypipe-botguard/releases/download/v${_botguard_ver}/rustypipe-botguard-v${_botguard_ver}-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("rustypipe-botguard-${_botguard_ver}-aarch64.tar.xz::https://codeberg.org/ThetaDev/rustypipe-botguard/releases/download/v${_botguard_ver}/rustypipe-botguard-v${_botguard_ver}-aarch64-unknown-linux-gnu.tar.xz")
sha256sums=('SKIP')
sha256sums_x86_64=('4f2ec561e8f9fadece7deadc6ce0624fbdedd852222c3eb194c22153b1323129')
sha256sums_aarch64=('4d038857374a69aea9be8ded981d93a776dc88d4e254f5c6d292746099abf69a')

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

  # PO-Token provider binary _find_botguard_bin() in player.py probes this
  # exact path (/usr/lib/mixtapes/bin) so we don't collide with a standalone
  # rustypipe-botguard package on /usr/bin. The tarball is a single bare file.
  install -Dm755 "$srcdir/rustypipe-botguard" "$pkgdir/usr/lib/mixtapes/bin/rustypipe-botguard"

  # PO-Token provider plugins. Without these yt-dlp mints no PO token and
  # YouTube 403s the gated (seekable Opus / itag 251) formats. Neither is
  # cleanly installable from the AUR: the AUR `yt-dlp-get-pot` (the GetPOT
  # framework) hard-depends on an unsatisfiable virtual `YT-DLP-GET-POT-PROVIDER`
  # that nothing provides, and `yt-dlp-get-pot-rustypipe` (the glue that drives
  # our bundled rustypipe-botguard binary) isn't packaged at all. Both are
  # single pure-Python files whose only runtime dep is yt-dlp (already a
  # dependency), so install them straight from PyPI, without deps, into the
  # system site-packages the app's interpreter loads yt-dlp plugins from.
  # --ignore-installed is essential: `pip install --root` otherwise SKIPS a
  # package it considers "already satisfied" in whatever interpreter pip runs
  # under (e.g. a builder with an active venv), leaving $pkgdir without the
  # plugin files and shipping a package that silently 403s. Force the copy.
  pip install --root="$pkgdir" --prefix=/usr --no-deps --ignore-installed --break-system-packages \
    "yt-dlp-get-pot>=0.3.0" "yt-dlp-get-pot-rustypipe>=0.2.0"

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
