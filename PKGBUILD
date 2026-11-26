# Maintainer: AlexDevFlow <107987666+AlexDevFlow@users.noreply.github.com>
# Contributor: cypress-exe
#
# Bleeding-edge package: builds from `main` and self-versions on the user's
# machine via pkgver(), so `makepkg -si` (or a `yay -Syu`) always gets the
# latest commit — no per-commit push needed. For tagged releases use
# `fileconverter`.
pkgname=fileconverter-git
pkgver=1.4.1.r40.g98f37af
pkgrel=1
pkgdesc="Right-click file conversion for your Linux file manager (ffmpeg / ImageMagick / LibreOffice) — git build"
arch=('any')
url="https://github.com/AlexDevFlow/Media-Converter"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-yaml'
  'ffmpeg'
  'imagemagick'
)
optdepends=(
  'python-gobject: GTK progress and settings windows'
  'gtk4: GTK progress and settings windows'
  'libadwaita: GTK progress and settings windows'
  'tk: fallback GUI when GTK is unavailable'
  'ghostscript: PDF processing'
  'libreoffice-still: document conversions (docx, xlsx, pptx, epub, ...)'
  'python-nautilus: right-click menu in Nautilus (GNOME)'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('fileconverter')
conflicts=('fileconverter')
source=("$pkgname::git+https://github.com/AlexDevFlow/Media-Converter.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # Prefer the last tag (v1.4.0 → 1.4.0.rNN.gSHA); fall back to a commit count.
  # Asked first and piped second: in `git describe | sed || printf` the status
  # is sed's, which never fails, so the fallback could not run and a checkout
  # with no reachable tag got an empty pkgver.
  local described
  if described="$(git describe --long --tags 2>/dev/null)"; then
    printf '%s' "$described" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# After installing, set up the right-click menu for your file manager with:
#   fileconverter --install
