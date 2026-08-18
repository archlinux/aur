# Maintainer: aur.chaotic.cx
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Mufeed Ali <fushinari@protonmail.com>
# Contributor: lastweakness <lastweakness@tuta.io>

_module="cloudscraper"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=3.0.0
pkgrel=2
pkgdesc="Python module to bypass Cloudflare's anti-bot page"
url="https://github.com/VeNoMouS/cloudscraper"
license=(MIT)
arch=(any)

depends=(
  nodejs # interpreter/solver
  python
  python-brotli
  python-pyparsing
  python-requests
  python-requests-toolbelt
  python-urllib3
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-responses
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext"
  '0001-PR295-fix_infinite_loop.patch'
  '0002-fix_test_403_handling.patch'
  '0003-drop_chakracore.patch'
  '0004-drop_js2py.patch'
  '0005-drop_v8.patch'
)
sha256sums=(
  '7a540064fd0ff108f572dd45f72897773d0028642b8211238e1c81cc779e99cb'
  'd324182a08aa7438757c87117ad7a269b252bb0f111151a481d61866038f92b3'
  '14447248d44020c60d66ca57c7113d02bcf1bb9649618971093aa1f7325eb27d'
  '9d2bfe24a437586448cf259fc66a8dd8d951e3de28d99cec5a31ae189d3ff42e'
  '543920f7f2a3b64841afe5e855f280c834cc4ba8da5997bd9713b79a26c76678'
  '0853067fc05d9f648af3887ad42690c2830480a68cde97cd016569d193ff182d'
)

prepare() {
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -d "$_pkgsrc" -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done

  cd "$_pkgsrc"
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

check() {
  local _test_opts=(
    #--deselect tests/test_modern.py::TestCloudScraper::test_403_handling
  )

  cd "$_pkgsrc"
  pytest "${_test_opts[@]}"
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
