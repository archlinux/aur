# Maintainer:
# Contributor: Ivan Gabaldon <aur[at]inetol.net>
# Contributor: archlinuxbits <archlinuxbits at proton.me>

: ${_electron_version=38}

_pkgname="tradingview"
pkgname="$_pkgname"
pkgver=3.0.0
pkgrel=2
pkgdesc='Charting platform for traders and investors'
arch=('x86_64')
url="https://www.tradingview.com/desktop/"
license=('LicenseRef-TradingView')

depends=(
  "electron${_electron_version}"
  'libsecret'
)
makedepends=(
  'html-xml-utils'
  'sha3sum'
  'squashfs-tools'
  'w3m'
)

options=('!debug' '!strip')

_terms_of_use="$_pkgname-eula"
_pkgsrc="$_pkgname-$pkgver"
source=(
  "$_pkgsrc.snap"::"https://api.snapcraft.io/api/v1/snaps/download/nJdITJ6ZJxdvfu8Ch7n5kH5P99ClzBYV_69.snap"
  "$_terms_of_use.html"::"https://www.tradingview.com/policies/"
)
sha256sums=(
  '27f706e1ae40e80d7750b77a4893fc20bec2e4e9059e5985a29f78ae75563ce0'
  'SKIP'
)

prepare() {
  hxextract .tv-policies "$_terms_of_use.html" \
    1> "$_terms_of_use-2.html" \
    2> /dev/null

  w3m -O UTF-8 -cols 80 -dump "$_terms_of_use-2.html" > "$_terms_of_use.txt"

  # unpack
  mkdir -p "$_pkgsrc"
  unsquashfs -q -n -f -d "$_pkgsrc/" "$_pkgsrc.snap"
}

package() {
  # asar
  mkdir -pm755 "$pkgdir/usr/lib/$_pkgname"
  cp -r "$_pkgsrc/resources/"* "$pkgdir/usr/lib/$_pkgname/"

  # launcher
  sed -E -e '/^Comment=/d' \
    -e 's&^(Icon)=.*$&\1='"$_pkgname&" \
    -e 's&^(Categories)=(Finance;)$&\1=Office;\2&' \
    -i "$_pkgsrc/meta/gui/$_pkgname.desktop"

  install -Dm644 "$_pkgsrc/meta/gui/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  # icon
  install -Dm644 "$_pkgsrc/meta/gui/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  # license
  install -Dm644 "$_terms_of_use.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env bash

name=$_pkgname
flags_file="\${XDG_CONFIG_HOME:-\$HOME/.config}/\${name}-flags.conf"

lines=()
if [[ -f "\${flags_file}" ]]; then
  mapfile -t lines < "\${flags_file}"
fi

flags=()
for line in "\${lines[@]}"; do
  if [[ ! "\${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "\${line}" ]]; then
    flags+=("\${line}")
  fi
done

: \${ELECTRON_IS_DEV:=0}
export ELECTRON_IS_DEV
: \${ELECTRON_FORCE_IS_PACKAGED:=true}
export ELECTRON_FORCE_IS_PACKAGED

exec electron${_electron_version} "\${flags[@]}" "/usr/lib/$_pkgname/app.asar" "\$@"
END
}
