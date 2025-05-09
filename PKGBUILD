# Maintainer: nesk_aur
pkgname=organicmaps
pkgver=2025.04.21_4
pkgrel=1
pkgdesc="Organic Maps: Offline Hike, Bike, Trails and Navigation"
arch=(x86_64)
makedepends=("cmake<=3.31.6" git jq gcc ninja)
depends=(mesa libglvnd freetype2 sqlite icu qt6-svg qt6-base
  qt6-positioning gcc-libs harfbuzz zlib glibc libpng)
optdepends=("ccache: faster re-compilation" "qt6-wayland: for Wayland users")
license=("Apache")
url="https://organicmaps.app"
source_url="https://git.omaps.dev/organicmaps/organicmaps"
source=(organicmaps.desktop)
sha256sums=('8205a6abb2c053380940d5c2e83cf10b5b889544e2d36c1c777778bf35772729')
conflicts=("${pkgname}-bin" "${pkgname}-git")
prepare() {
  avail=$(df -P -B 1048576 $srcdir|awk 'NR>1 {print $4}')
  if [ $avail -le 6144 ]; then
    printf "need at least 6 GiB of free space\n"
    exit 1
  fi
  if [ -n $SOURCE_URL_REWRITER ]; then
    src_url=$($SOURCE_URL_REWRITER $source_url)
  else
    src_url=$source_url
  fi
  if [ ! -d $pkgname ]; then
    git clone --depth=1 --filter=blob:limit=128k --single-branch \
      -b ${pkgver%%_*}-${pkgver##*_}-android \
      --recurse-submodules --shallow-submodules $src_url
  fi
  cd $pkgname
  rm -f 3party/boost/b2
  bash ./configure.sh
}
build() {
  cd $pkgname
  env CC=gcc CXX=g++ tools/unix/build_omim.sh -n $(nproc) -c -r desktop
}
package() {
 install -dm755 "$pkgdir/usr/share/${pkgname}"
 cp -Lr "${pkgname}/data" "$pkgdir/usr/share/${pkgname}/"
 install -dm777 "$pkgdir/usr/share/${pkgname}/data/$(jq '.v' $pkgname/data/countries.txt)"
 install -Dm644 "${pkgname}/android/.idea/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
 install -Dm755 "omim-build-release/OMaps" "$pkgdir/usr/bin/OMaps"
 install -Dm644 "organicmaps.desktop" -t "$pkgdir/usr/share/applications"
}
