# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgbase=lv2
pkgbase=$_pkgbase-git
pkgname=($pkgbase lv2-docs-git lv2-example-plugins-git)
pkgver=1.18.11.r1503.79c318c
pkgrel=1
pkgdesc='Plugin standard for audio systems (git version)'
arch=(x86_64)
url="https://lv2plug.in/"
license=(ISC)
makedepends=(
  asciidoc
  codespell
  doxygen
  flake8
  git
  gtk2
  libsamplerate
  libsndfile
  meson
  pygmentize
  python-black
  python-lxml
  python-markdown
  python-pygments
  python-pylint
  python-rdflib
  serd
  sord
)
source=("$_pkgbase::git+https://gitlab.com/lv2/lv2.git")
sha256sums=('SKIP')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

pkgver() {
  cd $_pkgbase
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  arch-meson $_pkgbase $pkgbase-build
  meson compile -C $pkgbase-build
}

check() {
  meson test -C $pkgbase-build
}

package_lv2-git() {
  optdepends=(
    'lv2-docs: for developer documentation'
    'lv2-example-plugins: for example plugins'
    'python-lxml: for lv2specgen.py'
    'python-markdown: for lv2specgen.py'
    'python-pygments: for lv2specgen.py'
    'python-rdflib: for lv2specgen.py'
    'sord: for lv2_validate'
  )
  provides=(lv2 "lv2=${pkgver//.r*/}")
  conflicts=(lv2)

  meson install -C $pkgbase-build --destdir "$pkgdir"

  rm -rf lv2-docs-git lv2-example-plugins-git
  (
    cd "$pkgdir"
    _pick lv2-docs-git usr/share/doc/lv2/
    _pick lv2-example-plugins-git usr/lib/lv2/eg-*
  )

  install -vDm 644 $_pkgbase/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 $_pkgbase/{NEWS,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
}

package_lv2-docs-git() {
  pkgdesc+=" - documentation"
  provides=(lv2-docs)
  conflicts=(lv2-docs)

  install -vdm 755 "$pkgdir"/usr/share/doc/$pkgname
  mv -v $pkgname/usr/share/doc/lv2/* "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 $_pkgbase/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_lv2-example-plugins-git() {
  pkgdesc+=" - example plugins"
  provides=(lv2-example-plugins)
  conflicts=(lv2-example-plugins)
  depends=(libsamplerate libsndfile)
  optdepends=(
    'gtk2: for eg-sampler.lv2 and eg-scope.lv2'
    'lv2-host: for loading the LV2 plugins'
  )
  groups=(lv2-plugins pro-audio)

  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $_pkgbase/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
