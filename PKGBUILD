# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-git
pkgname=(freetype2-git freetype2-demos-git freetype2-docs-git)
pkgver=2.11.0+p0+g801cd842e
pkgrel=2
epoch=1
pkgdesc="Font rasterization library (from git)"
url="https://www.freetype.org/"
arch=(x86_64 i686)
license=(GPL)
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=(zlib bzip2 sh libpng harfbuzz brotli)
makedepends=(libx11 qt5-base meson git python-virtualenv)
source=(git+https://gitlab.freedesktop.org/freetype/freetype.git
        git+https://gitlab.freedesktop.org/freetype/freetype-demos.git
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        0005-Run-docwriter-via-venv.patch
        freetype2.sh)
sha256sums=('SKIP'
            'SKIP'
            'e606bdba5c0ee698902886140e4643551ffc8327b1b7d2b0c9129d1f93b1f36c'
            '17ab1609cdbcaba3c5975f5cf1ffd078e067d560f906d5507390d41997e6c468'
            '561d2f2503d180b796f868470612610f6d7fcb34efa0620ecab38fd39002e27a'
            '9c068a984e7b9a27ff9e709839d522b66815ac4e8c7a5bd4ea0224335f7f2ef6'
            '5b6f2292e7956510c6729c0de1a86be66886d9d10c8723fe399b6eb42003d8ac'
            'f7f8e09c44f7552c883846e9a6a1efc50377c4932234e74adc4a8ff750606467')
validpgpkeys=(58E0C111E39F5408C5D3EC76C1A60EACE707FDA5) # Werner Lemberg <wl@gnu.org>

pkgver() {
  local _tag _count

  cd freetype
  _tag=$(git describe --abbrev=0 )
  _count=$(git rev-list --count $_tag..HEAD)
  _tag=${_tag#VER-}
  echo ${_tag//-/.}+p$_count+g$(git rev-parse --short HEAD)
}

prepare() {
  python -m venv docwriter-venv
  docwriter-venv/bin/pip install docwriter

  cd freetype

  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../0005-Run-docwriter-via-venv.patch

  ln -sr . ../freetype-demos/subprojects/freetype2
}

build() {
  arch-meson freetype-demos build \
    -D freetype2:default_library=shared
  meson compile -C build

  DOCWRITER_PYTHON="$PWD/docwriter-venv/bin/python" \
    ninja -C build subprojects/freetype2/docs
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_freetype2-git() {
  provides=(libfreetype.so "freetype2=$pkgver")
  conflicts=(freetype2)
  install=freetype2.install
  backup=(etc/profile.d/freetype2.sh)

  meson install -C build --destdir="$pkgdir"
  install -Dt "$pkgdir/etc/profile.d" -m644 freetype2.sh
  install -Dt "$pkgdir/usr/share/aclocal" -m644 \
    freetype/builds/unix/freetype2.m4

  cd "$pkgdir"
  _pick demos usr/bin
  _pick demos usr/share/man/man1
}

package_freetype2-demos-git() {
  pkgdesc="Freetype tools and demos (from git)"
  depends=(freetype2-git libx11)
  optdepends=('qt5-base: ftinspect')
  provides=("freetype2-demos=$pkgver")
  conflicts=(freetype2-demos)
  mv demos/* "$pkgdir"
}

package_freetype2-docs-git() {
  pkgdesc="Freetype documentation (from git)"
  depends=(freetype2-git)
  provides=("freetype2-docs=$pkgver")
  conflicts=(freetype2-docs)

  mkdir -p "${pkgdir}/usr/share/doc"
  cp -r freetype/docs "$pkgdir/usr/share/doc/freetype2"
  cp -r build/subprojects/freetype2/docs/* "$pkgdir/usr/share/doc/freetype2"
}

# vim:set sw=2 et:
