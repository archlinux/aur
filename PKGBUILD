# Maintainer: envolution
# Contributor: jmcb <joelsgp@protonmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=osm2world-git
_pkgname=OSM2World
pkgver=2024.12.18
pkgrel=1
pkgdesc="Converter that creates three-dimensional models of the world from OpenStreetMap data. -git latest"
arch=('any')
url="http://osm2world.org/"
license=('LGPL3')
depends=('java-runtime>=17')
source=("https://osm2world.org/download/files/latest/OSM2World-latest-bin.zip" _osm2world.desktop _osm2world.sh)
sha256sums=('e9d256e06a9ecfd730a9296f666daf10488df9955fd45aaa39b0c6d27cf6b3fb'
            '5656a70927e40a08038fa49f8f54ea5eb2be5e69b117c8e06d1360f67677f1a6'
            'fa2b2fb8a595b83ff12c1c57c6a23dcd44d7339e23c9f9fd209cec9c4de8e510')
pkgver() {
  date=$(curl -s "https://osm2world.org/download/files/latest/" | grep -oP 'OSM2World-latest-bin.zip.*\K[0-9]{4}-[0-9]{2}-[0-9]{2}' | tr - .)
  if [[ "$date" =~ ^[0-9]{4}.[0-9]{2}.[0-9]{2}$ ]]; then
    echo $date
  fi
}
prepare() {
  rm -rf osm2world
  # No top level directory in zip, so create target directory
  target_dir="osm2world"
  mkdir -p "$target_dir"

  # Move all files except the target directory itself into the new directory
  for file in *; do
    if [[ "$file" != "$target_dir" ]]; then
      mv "$file" "$target_dir/"
    fi
  done
}

package() {
  cd osm2world

  install -Dm644 _osm2world.desktop "$pkgdir/usr/share/applications/osm2world.desktop"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/osm2world/osm2world.sh" "$pkgdir/usr/bin/osm2world"

  install -dm755 "$pkgdir/opt/osm2world"
  install -Dm644 "LICENSE.txt" "$pkgdir/opt/osm2world/LICENSE.txt"
  cp -f _osm2world.sh osm2world.sh
  cp -r "./"* "$pkgdir/opt/osm2world/"
}
# vim:set ts=2 sw=2 et:
