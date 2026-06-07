# Maintainer: Gaou Piou <i.am.piou@gmail.com>

pkgname=drops-cursor-theme
pkgver=2026.06.05.200310
pkgrel=1
_pkgid=2330173
pkgdesc="HDPI cursor theme drawn from scratch, available in 32/48/64/96px sizes"
arch=('any')
url="https://www.gnome-look.org/p/${_pkgid}"
license=('GPL-3.0-or-later')
depends=()
makedepends=('curl' 'jq' 'perl' 'unzip')
options=('!strip' '!docs' '!debug')
install=drops-cursor-theme.install
source=()
sha256sums=()

pkgver() {
  local json timestamp
  json=$(curl -sL "https://www.gnome-look.org/p/${_pkgid}/loadFiles")
  timestamp=$(echo "$json" | jq -r '[.files[]] | sort_by(.updated_timestamp) | last | .updated_timestamp')
  date -d"$timestamp" +%Y.%m.%d.%H%M%S
}

prepare() {
  local active_files sorted_files download_url filename
  active_files=$(curl -Lsf "https://www.gnome-look.org/p/${_pkgid}/loadFiles" | \
    jq -r '.files[] | select(.active == "1")')
  sorted_files=$(echo "$active_files" | jq -s 'sort_by(.updated_timestamp)')

  while IFS= read -r file; do
    download_url=$(echo "$file" | perl -pe 's/\%(\w\w)/chr hex $1/ge')
    filename=$(basename "$download_url")
    if [[ -f "$filename" ]]; then
      echo "$filename already downloaded"
      continue
    fi
    echo "downloading $filename"
    if ! curl -Lsf "$download_url" -o "$filename"; then
      echo "failed to download $filename, retrying in 7 minutes..."
      sleep 420
      curl -Lf "$download_url" -o "$filename"
    fi
    sleep 10
  done < <(echo "$sorted_files" | jq -r '.[].url')
}

build() {
  for f in *.zip; do
    [[ -f "$f" ]] || continue
    unzip -o "$f"
  done
  rm -f ./*.zip
}

package() {
  install -dm755 "$pkgdir/usr/share/icons"
  find "$srcdir" -mindepth 2 -maxdepth 2 -type d \
    -exec cp -dr --no-preserve=ownership {} "$pkgdir/usr/share/icons/" \;
}
