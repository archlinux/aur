# Maintainer: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>

_pkgname=teddit
pkgname=teddit-git
pkgver=r574.9e515c4
pkgrel=1
pkgdesc="Alternative Reddit front-end focused on privacy"
arch=('any')
url="https://codeberg.org/teddit/teddit"
license=('AGPL')
depends=('nodejs')
makedepends=('git' 'npm' 'jq')
optdepends=('redis: works as a cache for Reddit API calls'
            'ffmpeg: video support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git#branch=main"
  "teddit.service"
  "teddit.sh")
sha256sums=('SKIP'
    'c66000c97266726382008e6e7a1b99719931ae87dfd0d239d15bb7c99beec7d1'
    '4ba3bd09a3967176f24e6f6fd44af1251d5531d344c81a23ddfeb6e355a37ae6')

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
  install -D -m644 teddit.service -t "$pkgdir/usr/lib/systemd/system"

  # Use a wrapper script as an entry point
  install -D -m755 teddit.sh "$pkgdir/usr/bin/teddit"
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a * "${pkgdir}/opt/${_pkgname}"
  cp "${pkgdir}/opt/${_pkgname}/config.js.template" "${pkgdir}/opt/${_pkgname}/config.js"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

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
