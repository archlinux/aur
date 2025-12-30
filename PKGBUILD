# Maintainer: ProgrammerGnome <te.email.cimed@example.com>
pkgname=rnote-latex-mod
_pkgname=rnote
pkgver=0.13.1.r2295.g646db7d8
pkgrel=1
pkgdesc="Sketch and take handwritten notes (Fork with experimental Gemini AI LaTeX export)"
arch=('x86_64')
url="https://github.com/programmergnome/rnote-latex-mod"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'poppler-glib' 'alsa-lib' 'glib2' 'openssl' 'gstreamer' 'gst-plugins-base')
makedepends=('git' 'meson' 'rust' 'cargo' 'clang')
optdepends=(
    'texlive-basic: minimum requirement for experimental LaTeX export'
    'texlive-full: strongly recommended for experimental LaTeX export'
)
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("git+https://github.com/programmergnome/rnote-latex-mod.git")
sha256sums=('SKIP')

pkgver() {
  cd "rnote-latex-mod"
  # Version: 0.13.1.r<num_of_commits>.g<hash>
  printf "0.13.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "rnote-latex-mod"
  # Download Cargo dep
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "rnote-latex-mod"
  export CARGO_HOME="$srcdir/cargo-home"
  
  arch-meson . build \
    -Dprofile=default \
    -Dcli=true
    
  meson compile -C build
}

package() {
  cd "rnote-latex-mod"
  meson install -C build --destdir "$pkgdir"
}
