# Maintainer: Markus Hartung <mail@hartmark.se>

pkgname=openapoc-git
_pkgname=openapoc
pkgver=r4005.9d020e77
pkgrel=2
pkgdesc='OpenApoc is an open-source re-implementation of the original X-COM: Apocalypse'
arch=('x86_64')
url='https://github.com/OpenApoc/OpenApoc'
license=('GPL-3.0-only')
depends=(libvorbis sdl2 libunwind libglvnd boost-libs glibc gcc-libs bash)
makedepends=(git cmake base-devel boost)
source=("${pkgname}::git+https://github.com/OpenApoc/OpenApoc.git")
sha256sums=('SKIP')
conflicts=()
provides=(openapoc)

prepare() {
  if [ ! -f ../cd.iso ]; then
    echo "cd.iso from X-Com: Apocalypse needs to be in this folder:"
    echo `realpath "$PWD/.."`
    exit 42
  fi

  cd "${pkgname}"
  git submodule update --init --recursive

  mkdir data > /dev/null 2>&1 || echo -n
  cp ../../cd.iso data
}

pkgver() {
  cd "${pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build > /dev/null 2>&1 || echo -n
  cd build
  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
  make
}

package() {
 cd "${srcdir}/${pkgname}"

 mkdir -p "$pkgdir/usr/share/$_pkgname"
 cp -dpr --no-preserve=ownership data "$pkgdir/usr/share/$_pkgname/data"
 install -Dm755 build/bin/OpenApoc "$pkgdir/usr/share/$_pkgname/$_pkgname"

 mkdir -p "$pkgdir/usr/bin"
 cat <<EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
/usr/share/openapoc/openapoc --Game.Save.Directory "${HOME}/.local/share/openapoc" --Framework.Data /usr/share/openapoc/data --Framework.CD /usr/share/openapoc/data/cd.iso --Game.ModPath /usr/share/openapoc/data/mods
EOF
 chmod +x "$pkgdir/usr/bin/$_pkgname"
}
