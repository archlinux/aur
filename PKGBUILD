# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=organicmaps
pkgver=2026.09.29_32
_tag="${pkgver%%_*}-${pkgver##*_}-android"
pkgrel=1
pkgdesc="Offline Maps"
arch=(x86_64)
makedepends=(cmake jq gcc ninja mold)
depends=(mesa libglvnd freetype2 sqlite icu qt6-svg qt6-base zlib libpng glibc
  qt6-positioning gcc-libs harfbuzz libxrandr libxi libxcursor
  hicolor-icon-theme libxinerama python)
optdepends=("ccache: faster re-compilation" "qt6-wayland: for Wayland users")
license=("Apache-2.0")
url="https://organicmaps.app"
_source_url="https://github.com/organicmaps/organicmaps.git"
source=(organicmaps.desktop)
sha256sums=('a97b2d286c6f2d007552f6b28ed43b45db9d8f086e9f38d8b44b3a3ca7ba4030')
conflicts=("${pkgname}-bin" "${pkgname}-git")
prepare() {
  avail=$(df -P -B 1048576 $srcdir|awk 'NR>1 {print $4}')
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
  if [ -n "$SOURCE_URL_REWRITER" ]; then
    for submodule_path in $(git -C $pkgname submodule status|cut -d' ' -f2);
    do
      pin_commit=$(git -C $pkgname submodule status --cached $submodule_path|
        awk '{sub("^-",""); print $1}')
      remote=$(git -C $pkgname config --file=.gitmodules submodule.${submodule_path}.url)
      local_remote=$($SOURCE_URL_REWRITER $remote)
      case "$local_remote" in
        file://*)
          git -C ${local_remote#file://} fetch --depth=1 origin "$pin_commit"
          git -C $pkgname submodule set-url $submodule_path "$local_remote"
          ;;
      esac
    done
  fi
  cd $pkgname
  git -c protocol.file.allow=always submodule update --init --recursive --depth=1
}
build() {
  cd $pkgname
  unset LDFLAGS
  export CFLAGS="-fuse-ld=mold" CXXFLAGS="-fuse-ld=mold" CC=gcc CXX=g++
  cmake --preset release
  cmake --build --preset release --target desktop
}
package() {
 install -dm755 "$pkgdir/usr/share/${pkgname}"
 cp -Lr "${pkgname}/data" "$pkgdir/usr/share/${pkgname}/"
 install -dm777 "$pkgdir/usr/share/${pkgname}/data/$(jq '.v' $pkgname/data/countries.json)"
 install -Dm644 "${pkgname}/android/.idea/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
 install -Dm755 "${pkgname}/build/release/OrganicMaps" "$pkgdir/usr/bin/OrganicMaps"
 install -Dm644 "organicmaps.desktop" -t "$pkgdir/usr/share/applications"
}
