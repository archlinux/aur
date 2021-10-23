# Maintainer: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>
_pkgname=freyr
pkgname=freyr-git
pkgver=r820.3092133
pkgrel=3
pkgdesc="A tool for downloading songs from music streaming services like Spotify and Apple Music."
arch=('any')
url="https://github.com/miraclx/freyr-js"
license=('Apache')
depends=('nodejs' 'atomicparsley' 'ffmpeg')
makedepends=('git' 'npm' 'jq')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git#branch=master"
        "freyr.sh")
sha256sums=('SKIP'
            '0c9aac798de3fda9bb24a252356161ebc3980bf4b904600c254781cf465ed07b')

prepare() {
	cd "$pkgname"
	sed -i "s/'AtomicParsley'/'atomicparsley'/g" "cli.js"
}

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
  npm install
}

package() {
  # Use a wrapper script as an entry point
  install -D -m755 freyr.sh "$pkgdir/usr/bin/$_pkgname"
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
