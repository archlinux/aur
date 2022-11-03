# Maintainer: tytan652 <tytan652@tytanium.xyz>

_depsname=Crosscables
_pluginname=OBSInfoWriter
pkgname=obs-infowriter
pkgver=2.3
_deps_commit=cf621ae938e69cc63e37d4d32a7cbdc32486787b
pkgrel=1
pkgdesc="This plugin writes a timestamp to a textfile that you can use to mark specific events for later editing of your videos or streams"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/infowriter.345/"
license=("MPL2")
depends=("obs-studio>=28")
source=(
  "$_pluginname-$pkgver.tar.gz::https://github.com/partouf/$_pluginname/archive/v$pkgver.tar.gz"
  "$_depsname-$_deps_commit.tar.gz::https://github.com/partouf/$_depsname/archive/$_deps_commit.tar.gz"
)
sha256sums=(
  "6ea23282b2a3a1e77a642b4f73b51449b84c3ad1067e53a4afead365bbdeb917"
  "4ba2db4a35aaf5bb1f1d10f07d72218ac81e88ae5c4a5f81c93ee14b3192ec00"
)

prepare() {
  mv "$_depsname-$_deps_commit" $_depsname

  cd "$_pluginname-$pkgver"

  sed -i 's|-I"../include" -I"../obs-studio/libobs" -I"../obs-studio/UI"|-I"/usr/include/obs"|g' Makefile.linux
}

build() {
  cd $_depsname/libGroundfloor

  sh build.sh

  cd "$srcdir/$_pluginname-$pkgver"

  make LDFLAGS="$LDFLAGS" -f Makefile.linux
}

package() {
  mkdir -p $pkgdir/usr/lib/obs-plugins

  cp -a "$_pluginname-$pkgver"/lib$_pluginname.so $pkgdir/usr/lib/obs-plugins
}
