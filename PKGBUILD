# Maintainer: Tom Hale <tom[noodle]hale[point]ee>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=nixnote2
pkgname=${_pkgname}-git
pkgver=2.1.1.r3.gf5e206dd
pkgrel=1
pkgdesc='Evernote clone (formerly Nevernote) - git checkout'
url="https://github.com/robert7/$_pkgname"
arch=(x86_64)
license=(GPL3)
depends=(hunspell java-runtime hicolor-icon-theme poppler-qt5 tidy qt5-webkit)
makedepends=(boost gcc git qt5-tools)
provides=("nixnote=${pkgver%.r*}" "$_pkgname=${pkgver%.r*}")
replaces=(nevernote nixnote nixnote-beta)
source=("git+${url}.git"  tidy-source-dir-location.patch)
sha256sums=(SKIP  75410b80f3c06ca61842eade4e2da1fb869a3da7c269116a4b5a7703a196e621)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # Patch needed as Debian has additional leading tidy/ in the include path
  # Support `makepkg -e`: `patch` doesn't support skipping an already applied patch file.
  # Only apply the patch if it couldn't be cleanly reversed with --dry-run
  if ! patch -p1 -d "$_pkgname" --reverse --force --dry-run < tidy-source-dir-location.patch &> /dev/null; then
    patch -p1 -d "$_pkgname" < tidy-source-dir-location.patch
  fi
  cd "$srcdir/$_pkgname"
  qmake PREFIX=/usr
  make -j $(( 1 + ($(nproc)-1) / 2 ))  # Use ceil(#processors / 2) jobs
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/" CONTRIBUTING.md debian/changelog
  # shortcuts.txt is referenced in doc:
  # https://github.com/robert7/nixnote2/wiki/HowTo---Customize-keyboard-shortcuts
  install -Dm644 -t "${pkgdir}/usr/share/${_pkgname}/" shortcuts.txt
}
