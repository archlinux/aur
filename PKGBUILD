# Maintainer: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
# If you want TOR functionality, remove '--no-optional' from the 35th line

_pkgname=bibliogram
pkgname=bibliogram-git
pkgver=r388.a807acc
pkgrel=1
pkgdesc="An alternative front-end for Instagram"
arch=('any')
url="https://sr.ht/~cadence/bibliogram/"
license=('AGPL')
depends=('nodejs')
makedepends=('git' 'npm' 'jq')
optdepends=('graphicsmagick: Required for resizing images for thumbnailing')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://git.sr.ht/~cadence/$_pkgname#branch=master"
  "bibliogram.service"
  "bibliogram.sh")
sha256sums=('SKIP'
  '29edbea6200df766d01e49a56a1aee710a5a58a8108e11b78b8ea4bb961d9123'
  '6f3841030ba3e2be042ba54f7c8e65fb1282eac392b4501e461a0e3d10a6248f')

pkgver() {
  cd "$pkgname"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  npm install --no-optional
}

package() {
  install -D -m644 bibliogram.service -t "$pkgdir/usr/lib/systemd/system"

  # Use a wrapper script as an entry point
  install -D -m755 bibliogram.sh "$pkgdir/usr/bin/bibliogram"
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a * "${pkgdir}/opt/${_pkgname}"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Remove references to $pkgdir/$srcdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/opt/$_pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  find "$pkgdir" -type f -name package.json | while read pkgjson; do
    local tmppackage="$(mktemp)"
    jq 'del(.man)' "$pkgjson" >"$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
  done
}
