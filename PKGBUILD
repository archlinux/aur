# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=jamomacore-git
pkgver=0.6a47
pkgrel=1
pkgdesc="The Jamoma Frameworks"
arch=('x86_64')
url="http://www.jamoma.org"
license=('BSD')
groups=()
depends=('portaudio' 'libxml2')
makedepends=('git')
provides=('jamomacore')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()


_gitroot=https://github.com/Jamoma/Jamoma
_gitname=Jamoma

build() {
  cd "$srcdir"

  if [[ -d "$_gitname" ]]; then
	(
		cd "$_gitname"
		git pull
		cd Core
		git pull
	)
  else
    git clone "$_gitroot" "$_gitname" --depth=1
    (
		cd "$_gitname"
		git checkout dev
		git submodule update --init --depth=1 -- Core
		cd Core
		git checkout dev
    )
  fi

  mkdir -p "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  cmake "$srcdir/$_gitname"
  make -j$(nproc)
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$srcdir/$_gitname/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
