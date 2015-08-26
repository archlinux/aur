# Maintainer: David Manouchehri <david@davidmanouchehri.com>
# Contributor: Paul Burton <paulburton89@gmail.com>

pkgname=ejtagproxy-git
_gitname=$(printf ${pkgname%%-git})
_gitbranch=master
_gitauthor=sergev
pkgver=r33.bfc15e1
pkgrel=1
pkgdesc="GDB interface utility for MIPS processors, including PIC32"
url="https://github.com/$_gitauthor/$_gitname"
license=('GPL2')
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")
validpgpkeys=('F0FE029614EA35BC9E4F9768A6ECFD0C40839755') # David Manouchehri
sha512sums=('SKIP')
arch=('i686' 'x86_64')
makedepends=('git')
optdepends=('pic32prog-git: Flash programming utility for PIC32' 
            'microchip-mplabxc32-bin: C/C++ compiler for PIC32')
conflicts=("$_gitname")
provides=("$_gitname")
replaces=("$_gitname-svn")

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  sed -i 's|/lib/i386-linux-gnu|/|' make-unix
  make -f make-unix
}

package() {
  cd "$srcdir/$_gitname"
  # The makefile installs to a hardcoded path...
  install -Dm755 ejtagproxy "${pkgdir}/usr/bin/ejtagproxy"
 
  # Extract the license
  offsets=(`pcregrep -M --file-offsets 'Copyright \(C\)(\n|.)*?\*/' \
        target-ejtag.c | head -n 1 | tr ',' ' '`)
  start=${offsets[0]}
  len=${offsets[1]}
  dd if=target-ejtag.c bs=1 skip=${start} count=${len} 2>/dev/null | \
      sed 's|/\*||' | sed 's|\*/||' | sed 's|^ \* ||g' | sed 's|^ \*$||g' \
        >LICENSE
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"}}}}}}}}}
}
