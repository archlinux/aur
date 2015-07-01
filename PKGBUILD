# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_pkgbase=chromium-ext-chromiumos-tts
pkgname=$_pkgbase-git
pkgver=r479.4e1622e
pkgrel=1
pkgdesc="Chromium OS text-to-speech as a Chromium extension"
arch=('arm' 'i686' 'x86_64')
url="http://www.chromium.org/chromium-os"
license=('BSD') # *.js files mention BSD license in file LICENSE, which is missing
depends=('chromium')
makedepends=('unzip')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=('!strip')
install=$_pkgbase.install
_gitname=chromiumos-platform-assets
source=($_gitname::git+https://chromium.googlesource.com/chromiumos/platform/assets
	0001-Add-missing-Dutch-voice.patch)
md5sums=('SKIP'
         'b43d30ad8f0c863841925b34920f0d28')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  rm -rf build
  mkdir -p build/$_pkgbase
  cd build/$_pkgbase

  cp -a "$srcdir/$_gitname/speech_synthesis/patts/"* .

  # Unpack archives
  for f in *.zip; do
    unzip $f
    rm $f
  done

  # Add missing Dutch voice (note: very low quality, uncomment if you want it)
  #patch < "$srcdir/0001-Add-missing-Dutch-voice.patch"
  #sed -i -e '/ko-KR/{p;s//nl-NL/}' manifest.json

  # Rename extension
  sed -i -e '/"name": /s/US English Female/Chromium OS/' manifest.json

  # Adjust files
  for f in voice_data_*.js; do
    d=$(basename "$f" .js)

    # Make paths relative
    sed -i -e "s|'/|'|g" "$f"
    sed -i -e 's|"/|"|g' "$d/project"

    # Update md5sum and size
    md5=$(md5sum $d/project | cut -d" " -f1)
    size=$(wc -c $d/project | cut -d" " -f1)
    sed -i \
	-e "/'path': 'voice_data.*\/project'/{n;n;s/'md5sum': '.*'/'md5sum': '"$md5"'/;n;s/'size': .*,/'size': $size,/}" \
	"$f"
  done

  # The following no longer applies after Chromium security update
  return

  cd ..

  # Build crx file
  /usr/bin/chromium --pack-extension=$_pkgbase

  # Get extension version
  _ext_ver=$(sed -ne 's/^.*"version": "\(.*\)",$/\1/p' < $_pkgbase/manifest.json)

  # Calculate extension ID
  # http://stackoverflow.com/a/10089780/588561
  _ext_id=$(
    cat $_pkgbase.pem |
	openssl rsa -pubout -outform DER |
	openssl dgst -sha256 |
	awk '{print $2}' | cut -c 1-32 | tr '0-9a-f' 'a-p')
  cat > $_ext_id.conf <<EOF
{
    "external_crx": "/usr/share/chromium/extensions/$_pkgbase.crx",
    "external_version": "$_ext_ver"
}
EOF
}

package() {
  cd build

  install -d -m755 "$pkgdir/usr/share/chromium/extensions"
  cp -a $_pkgbase "$pkgdir/usr/share/chromium/extensions/"
  #cp *.crx *.conf "$pkgdir/usr/share/chromium/extensions/"
}
