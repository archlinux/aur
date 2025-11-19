# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Raphaël Doursenaud <rdoursenaud@free.fr>
# Contributor: crasm <crasm@firebase-tools.aur.yooz4sio.vczf.io>

pkgname=firebase-tools
pkgver=14.25.1
pkgrel=1
pkgdesc='The Firebase Command Line Tools'
arch=('x86_64')
url='https://github.com/firebase/firebase-tools'
license=('MIT')
depends=('nodejs')
makedepends=('jq' 'npm' 'node-gyp' 'python')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('3c1ee2d358ade9f9c7ee9e283c3c28331d97d71eba5602a44a2d04a6140ef4a6')

prepare() {
  # devendor node-gyp
  cd package
  jq '.overrides."node-gyp"="/usr/lib/node_modules/node-gyp"' package.json > package.json.tmp
  mv package.json{.tmp,}
}

package() {
  local _module_path="/usr/lib/node_modules/$pkgname"

  # build re2 from source
  export DEVELOPMENT_SKIP_GETTING_ASSET=1 PYTHONDONTWRITEBYTECODE=1

  # can't use `npm install -g` with overrides
  cd package
  npm install --no-save
  ln -sf /usr/lib/node_modules/node-gyp node_modules/ # fix relative symlink
  npm_config_prefix="$pkgdir/usr" npm link
  cd ..
  rm "$pkgdir/$_module_path"
  cp -a package "$pkgdir/$_module_path"

  # based on https://wiki.archlinux.org/index.php?title=Node.js_package_guidelines&oldid=782877
  # fix package containing reference to $srcdir/$pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  find "$pkgdir" -type f -name package.json | while read pkgjson; do
    local tmppackage="$(mktemp)"
    jq 'del(.man)' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
  done

  # package specific
  # delete leftover re2 build files
  local _re2="$pkgdir/$_module_path/node_modules/re2"
  local _re2_addon="$_re2/build/Release/re2.node"
  [ -f "$_re2_addon" ] || { echo "re2 addon not found"; exit 1; }
  find "$_re2/build" \( ! -type d ! -path "$_re2_addon" -o -type d -empty \) -delete
  rm -r "$_re2/vendor"

  # Install a symlink for the LICENSE file
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  local _license_path="/usr/lib/node_modules/$pkgname/LICENSE"
  [ -f "$pkgdir/$_license_path" ] || { echo "License file not found"; exit 1; }
  ln -s "$_license_path" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
