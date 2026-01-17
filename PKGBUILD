# Maintainer:
# Contributor: VitalyR <vr@vitalyr.com>
# Contributor: tas <tasgon_@out/look.com>
# Contributor: QuantMint <qua/ntmint@/protonm/ail.com>
# Contributor: Cristian Porras <porrascristian@gmail.com>

: ${_templates=release:debug}

_pkgname="godot"
pkgname="$_pkgname-git"
pkgver=4.6.r3816.g741fb8a
pkgrel=1
pkgdesc="Advanced cross-platform 2D and 3D game engine"
url="https://github.com/godotengine/godot"
license=('MIT')
arch=('x86_64')

depends=(
  embree
  freetype2
  graphite
  harfbuzz
  harfbuzz-icu
  libglvnd
  libspeechd
  libsquish
  libtheora
  libvorbis
  libwebp
  libwslay
  libxcursor
  libxi
  libxinerama
  libxrandr
  mbedtls2
  miniupnpc
  pcre2
)
makedepends=(
  alsa-lib
  git
  scons
  wayland
  yasm
)
optdepends=(
  'pipewire-alsa: for audio support'
  'pipewire-pulse: for audio support'
)

provides=("$_pkgname")
conflicts=(
  "$_pkgname"
  "godot-export-templates-git"
)

_pkgsrc="godot"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _major _minor _version _tag _revision _hash
  _major=$(cat version.py | grep "major" | sed 's/major = //')
  _minor=$(cat version.py | grep "minor" | sed 's/minor = //')
  _version="${_major:?}.${_minor:?}"
  _tag=$(git tag | sort -rV | head -1)
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  cd "$_pkgsrc"

  echo "Building godot editor..."
  scons platform=linuxbsd target=editor production=yes werror=no

  for i in ${_templates[@]//:/ }; do
    echo "Building godo export template ($i)..."
    scons platform=linux tools=no target="template_$i" arch=x86_64
  done
}

package() {
  cd "$_pkgsrc"
  install -Dm755 bin/godot.linuxbsd.editor.x86_64 "$pkgdir/usr/bin/godot"

  # export templates
  local _templates_path="usr/share/godot/templates"
  mkdir -pm755 "$pkgdir/$_templates_path"

  for i in ${_templates[@]//:/ }; do
    install -Dm644 "bin/godot.linuxbsd.template_$i.x86_64" -t "$pkgdir/$_templates_path"
  done

  # resources
  install -Dm644 icon_outlined.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  install -Dm644 misc/dist/linux/org.godotengine.Godot.desktop -t "$pkgdir/usr/share/applications/"

  install -Dm644 misc/dist/linux/org.godotengine.Godot.xml -t "$pkgdir/usr/share/mime/packages/"

  # license
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/godot-git/LICENSE"
}
