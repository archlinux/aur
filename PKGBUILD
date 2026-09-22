# Maintainer: OldJobobo
# Generated from verified release ZIPs; see docs/aur.md before submitting.
pkgname=ttf-ransom-mono-bin
pkgver=0.300
pkgrel=1
pkgdesc='Ransom-note monospace font: five families with conventional and Unruly Nerd Fonts icons'
arch=('any')
url='https://github.com/ministry-of-taste/ransom-mono'
license=('OFL-1.1' 'MIT' 'Apache-2.0' 'CC-BY-4.0' 'Unlicense')
provides=('ttf-ransom-mono' 'ttf-font')
conflicts=('ttf-ransom-mono')
options=('!strip' '!debug')

_families=(RansomMono RansomMonoNF RansomMonoNFPropo RansomMonoUnrulyNF RansomMonoUnrulyNFPropo)
source=()
noextract=()
for _family in "${_families[@]}"; do
  source+=("$url/releases/download/v$pkgver/$_family-$pkgver.zip")
  noextract+=("$_family-$pkgver.zip")
done
sha256sums=(
  'a15b016f4d7827ff77121e5b162f1ae215d2f77cfb64e95ae4417486ff842cdf'
  '863607eb5176b20731329b795a068e42ce954cecf696881ef1393c64f493b4fd'
  'af7cd2cf41da95c0df5941d4a0fa33eddc256ce263d1254687b90139fff8d9a8'
  'd8667e2dd54205a62351e241075c4f933e772511f4f31020b9986656b28d1bec'
  '14aeee8cd853e14cb2dbba8164a70a9271203a16037eb7882d5415f25dcc28b0'
)

prepare() {
  local family
  for family in "${_families[@]}"; do
    mkdir -p "$srcdir/$family"
    bsdtar -xf "$srcdir/$family-$pkgver.zip" -C "$srcdir/$family"
  done
}

package() {
  local family license_dir doc_dir
  local -a fonts
  for family in "${_families[@]}"; do
    fonts=("$srcdir/$family/ttf/"*.ttf)
    if (( ${#fonts[@]} != 4 )); then
      printf 'Expected four TTF styles for %s\n' "$family" >&2
      return 1
    fi
    install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" "${fonts[@]}"
    license_dir="$pkgdir/usr/share/licenses/$pkgname/$family"
    install -Dm644 "$srcdir/$family/LICENSE" "$license_dir/LICENSE"
    cp -r "$srcdir/$family/donor-licenses" "$license_dir/"
    if [[ $family == *NF* ]]; then
      cp -r "$srcdir/$family/upstream-notices" "$license_dir/"
    fi
    doc_dir="$pkgdir/usr/share/doc/$pkgname/$family"
    install -Dm644 "$srcdir/$family/README.txt" "$doc_dir/README.txt"
    install -Dm644 "$srcdir/$family/CHANGELOG.md" "$doc_dir/CHANGELOG.md"
    if [[ -f $srcdir/$family/THIRD_PARTY.md ]]; then
      install -Dm644 "$srcdir/$family/THIRD_PARTY.md" "$doc_dir/THIRD_PARTY.md"
    fi
  done
}
