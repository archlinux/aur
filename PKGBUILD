# Maintainer: trektn <trekt at poopf dot art>
# Contributor: Joost Bremmer <toost dot b at gmail dot com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Mubashshir <ahmubashshir at gmail dot com>
# Derived from the trackma-git AUR PKGBUILD, adapted for the Hakubun+ fork.
# from: git

pkgname=hakubun-plus-git
pkgver=r1945.0e29e7f
pkgrel=3
pkgdesc="Multi-site anime/manga list manager; independent Trackma fork with Taiga mode"
arch=('any')
url="https://github.com/trektn/hakubun-plus"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-anitomy-ng-bin>=1.0.9'
  'opencc>=1.1'
)
conflicts=('hakubun-git')

makedepends=(
  desktop-file-utils
  git
  python-installer
  uv
)
optdepends=('python-cairo:      GTK frontend'
    'python-gobject:   GTK frontend'
    'gtk3:              GTK frontend'
    'python-pillow:    thumbnail images for GUI frontends'
    'python-pyqt6:     Qt frontend'
    'python-pyinotify: inotify-based tracker'
    'python-inotify:   inotify-based tracker alternative (AUR)'
    'python-jeepney:   MPRIS tracker'
    'python-anitopy-git: filename parsing via anitopy (AUR)'
    'python-pypresence: Discord Rich Presence support'
    'lsof:             polling tracker/pyinotify alternative')

source=(${pkgname}::"git+https://github.com/trektn/${pkgname%-git}.git"
    "anime-relations::git+https://github.com/erengy/anime-relations.git"
    "${pkgname%-git}-gtk.desktop"
    "${pkgname%-git}-qt.desktop")

sha256sums=('SKIP'
            'SKIP'
            'ff4df2c23bd80044d1e9067c7c375886b5fea30d4c6e81ba4a8aa19f8fa0d2da'
            '18148c4926423938b816503307763cc2e3ee80d298380bcd0adff7a2ced5b2fd')

pkgver() {
  cd ${pkgname}
  (
    set -o pipefail
    git describe --tags --long 2>/dev/null | sed \
      's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${pkgname}
  git submodule init
  git config submodule."hakubun/data/anime-relations".url "$srcdir/anime-relations"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${pkgname}
  # uv_build is understood natively by `uv build` (no network access needed
  # to fetch the build backend, unlike a generic PEP517 `python -m build`).
  uv build --wheel --offline -o dist
}

package() {
  cd ${pkgname}

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dvm644 "hakubun/data/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"

  desktop-file-validate "${srcdir}/${pkgname%-git}-gtk.desktop"
  desktop-file-validate "${srcdir}/${pkgname%-git}-qt.desktop"

  install -Dvm644 "${srcdir}/${pkgname%-git}-gtk.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname%-git}-gtk.desktop"

  install -Dvm644 "${srcdir}/${pkgname%-git}-qt.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname%-git}-qt.desktop"
}

# vim: sw=2 ts=2 tw=80 et:
