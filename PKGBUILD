# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Antoien Viallon <antoine+aur@lesviallon.fr>
# Contributor: Jan Baudisch <dev@baudisch.xyz>
pkgname=z88dk-git
pkgver=2.3.r1703.g442f4e9
pkgrel=1
pkgdesc="The development kit for over fifty z80 machines - c compiler, assembler, linker, libraries."
arch=("x86_64")
url="https://www.z88dk.org"
license=("custom: The Clarified Artistic License")
depends=("perl")
provides=("z88dk")
conflicts=("z88dk")
source=("$pkgname::git+https://github.com/z88dk/z88dk.git"
        "z88dk.sh"
        "UNIXem::git+https://github.com/synesissoftware/UNIXem.git"
		"Unity::git+https://github.com/ThrowTheSwitch/Unity.git"
		"cpm::git+https://github.com/z88dk/cpm.git"
        "optparse::git+https://github.com/skeeto/optparse.git"
		"regex::git+https://github.com/geoffmcl/regex.git"
        "uthash::git+https://github.com/z88dk/uthash.git"
		)

sha256sums=('SKIP'
            '0474d26668224231cffeaef33776020ee65fe83c825833c9907e4766d9104869'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  git submodule init
    _submodules=(UnixEM Unity cpm optparse regex uthash)
  for submodule in ${_submodules[@]}; do
  	git config submodule.${submodule}.url "$srcdir/${submodule}"
  done
  git submodule update --recursive

  #for patch in $(cd "$srcdir" && ls *.patch); do
  #	echo "Applying patch '$patch'..."
  #	patch -d "$srcdir/$pkgname" -i "$srcdir/"${patch}
  #done
}

build() {
  cd "$pkgname"
  chmod +x build.sh
  export CFLAGS="$CFLAGS -Wno-unused-value -Wno-unused-result"
  ./build.sh
}

package() {
  # would not create paths otherwise
  export INSTALL="install -D"

  cd "$pkgname"

  make prefix="/usr" DESTDIR="$pkgdir" install

  install -Ddm755 "$pkgdir/etc/profile.d"
  install -m644 "$srcdir/z88dk.sh" "$pkgdir/etc/profile.d/z88dk.sh"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/z88dk/LICENSE"
}
