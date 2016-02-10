# Maintainer: zfo <zfoofz1@gmail.com>
# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=seqan-git
_pkgname=seqan
pkgver=r.fcad60a
pkgrel=1
pkgdesc='C++ library of efficient algorithms and data structures for the analysis of sequences with the focus on biological data'
arch=('i686' 'x86_64')
url="http://www.seqan.de/"
license=('custom')
depends=('bash' 'bzip2' 'zlib')
makedepends=('cmake')
conflicts=('seqan' 'seqan2')
source=()
md5sums=()

_gitroot=https://github.com/seqan/seqan
_gitname=seqan

update_git(){
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin >&2
    msg "The local files are updated."
  else
    git clone --depth 1 "$_gitroot" "$_gitname" >&2
  fi

  msg "GIT checkout done or server timeout"
}

pkgver() {
  update_git
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  msg "Starting build..."

  #zfo: this seems to me unnecessary
  #rm -rf "$srcdir/$_gitname-build"
  if [[ -d "$_gitname" ]]; then
  	cd "$srcdir/$_gitname-build" && git pull origin
  else
  	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  fi
  cd "$srcdir/$_gitname-build"

  # common patching (aka prepare)
  mkdir -p build

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -i $(grep -rl '/usr/bin/env python')
  ###

  cd "$srcdir/$_gitname-build"/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DSEQAN_BUILD_SYSTEM=SEQAN_RELEASE \
    ..

  make
}

package() {
  cd "$srcdir/$_gitname-build"/build

  make prefix=/usr DESTDIR=$pkgdir install

  install -Dm644 $pkgdir/usr/share/doc/sak/man/sak.1 $pkgdir/usr/share/man/man1/sak.1
  rm $pkgdir/usr/share/doc/sak/man/sak.1
  rmdir $pkgdir/usr/share/doc/sak/man

  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # install popular apps
  files=("mason_frag_sequencing" "mason_genome" "mason_materializer" "mason_methylation"
	"mason_simulator" "mason_splicing" "mason_tests" "mason_variator")
  for file in "${files[@]}" ; do
  	install -m755 bin/$file $pkgdir/usr/bin/$file
  done
}
