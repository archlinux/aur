# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: hoverth
# Adapted from AUR package `organicmaps` by nesk_aur
pkgname=comaps
pkgver=v2026.01.08_11
_tag="${pkgver%%_*}-${pkgver##*_}"
pkgrel=1
pkgdesc="CoMaps: Offline Hike, Bike, Trails and Navigation"
arch=(x86_64)
makedepends=(cmake git jq gcc ninja python-protobuf libxinerama wget)
depends=(libglvnd freetype2 icu qt6-base zlib glibc
  qt6-positioning gcc-libs harfbuzz hicolor-icon-theme)
optdepends=("ccache: faster re-compilation" "qt6-wayland: for Wayland users")
license=('Apache-2.0')
url="https://comaps.app"
_source_url="https://codeberg.org/comaps/comaps.git"
source=(comaps.desktop
  icon.svg
  relax-protobuf-version.patch)
sha256sums=('21f70d6c3282fcec0165c9b9f8082e081ecb50b423ae286ffd4ccde4cc794563'
  '85210e30cd1b6e8b30407cf97a57cbf3eb98f16526fc6ffaae63f1441691e6e1'
  '60144c52729711de741679290f41b7000d8de4d4aed86b10c6aa59a1cdb1545e')
conflicts=("${pkgname}-bin" "${pkgname}-git")
prepare() {
  avail=$(df -P -B 1048576 $srcdir | awk 'NR>1 {print $4}')
  if [ $avail -le 5120 ]; then
    printf "need at least 5 GiB of free space\n"
    exit 1
  fi

  src_url=$_source_url
  if [ -n "$SOURCE_URL_REWRITER" ]; then
    src_url=$($SOURCE_URL_REWRITER $_source_url)
    case $src_url in
    file://*)
      git -C ${src_url#file://} fetch --depth=1 origin "$_tag"
      ;;
    esac
  fi
  if [ ! -d $pkgname ]; then
    git clone --depth=1 --single-branch -b "$_tag" --filter=blob:limit=128k \
      $src_url $pkgname
  fi

  cd $pkgname
  git -c protocol.file.allow=always submodule update --init --recursive --depth=1
  rm -f 3party/boost/b2

  # Apply patch to relax protobuf version check
  patch -p1 < "$srcdir/relax-protobuf-version.patch"

  # Use pure-Python protobuf implementation for compatibility with protobuf >= 4.x
  export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
  bash ./configure.sh
}
build() {
  cd $pkgname
  env CC=gcc CXX=g++ tools/unix/build_omim.sh -c -r desktop
}
package() {
  install -dm755 "$pkgdir/usr/share/${pkgname}"
  cp -Lr "${pkgname}/data" "$pkgdir/usr/share/${pkgname}/"

  # Remove test data and python scripts (not needed at runtime)
  rm -rf "$pkgdir/usr/share/${pkgname}/data/test_data"
  rm -rf "$pkgdir/usr/share/${pkgname}/data/conf"

  # Create map data directory with correct permissions (755, not 777)
  install -dm755 "$pkgdir/usr/share/${pkgname}/data/$(jq '.v' $pkgname/data/countries.txt)"

  install -Dm644 "icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm755 "omim-build-release/CoMaps" "$pkgdir/usr/bin/comaps"
  install -Dm644 "comaps.desktop" -t "$pkgdir/usr/share/applications"
}
