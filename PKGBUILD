# Maintainer: éclairevoyant
# Contributor: Eli Schwartz <eschwartz at archlinux dot org>
# Contributor: Dave Reisner <d at falconindy dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: godane <slaxemulator at gmail dot com dot com>
# Contributor: Andres Perera <aepd87 at gmail dot com>

pkgname=pacman-git
pkgver=6.1.0.r15.g01e64e8b
pkgrel=1
pkgdesc="A library-based package manager with dependency support"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.archlinux.org/pacman/"
license=('GPL-2.0-or-later')
depends=('bash' 'glibc' 'libarchive' 'curl' 'gpgme' 'pacman-mirrorlist'
         'gettext' 'gawk' 'coreutils' 'gnupg' 'grep')
optdepends=('pacman-contrib: various helper utilities'
            'perl-locale-gettext: translation support in makepkg-template')
makedepends=('git' 'asciidoc' 'doxygen' 'meson')
checkdepends=('python' 'fakechroot')
provides=("pacman=${pkgver%.*.*}")
conflicts=('pacman')
backup=("etc/pacman.conf"
        "etc/makepkg.conf")
options=('emptydirs' 'strip' 'debug')
source=("git+https://gitlab.archlinux.org/pacman/pacman.git"
        "pacman.conf.i686"
        "pacman.conf.x86_64"
        "pacman.conf.arm"
        "makepkg.conf")
b2sums=('SKIP'
        '86bf80c73295988b1d9ae2f17ac35e4e758c3326f7a3e71152182714d889af0a8c6cb14cc58012386cd352fad1786f87755a330180d738b67766dce9ea448625'
        '3643ddf0b75ec2f3ef762e45b7a57b3985226a29f7834ddf68e29bf3adba58f741d29211dff38dc787c629ee37b318ab69fca82a41a984a9ddf8cef79483aeed'
        '8bd23f50f157bf01a5b8eb880ce949f555f27ef6f0d71173dd4494119c863f7cb10eaabe03b68d423a5250e8ad9a365274485ed73cceae85316c3ddcc0c66fc5'
        '11156dd4a7e16f22d5f8d31bc313a2b6d0021298fdb06ea32255fbac06ee7f2f0ddd2455f491183e1dbbc5756add9f85d188f7fc7f74ae92293a95b5a1a45666')

pkgver() {
  cd pacman

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p pacman/build
  cd pacman/build

  meson --prefix=/usr \
        --buildtype=plain \
        -Ddoc=enabled \
        -Ddoxygen=enabled \
        -Duse-git-version=true \
        -Dscriptlet-shell=/usr/bin/bash \
        -Dldconfig=/usr/bin/ldconfig \
        ..
  ninja
}

check() {
  cd pacman/build

  ninja test
}

package() {
  cd pacman/build

  DESTDIR="$pkgdir" ninja install

  # install Arch specific stuff
  install -dm755 "$pkgdir/etc"
  if [[ $CARCH =~ arm* || $CARCH = aarch64 ]]; then
    # $CARCH != uname -m
    sed -e "s|@CARCH[@]|$CARCH|g" "$srcdir/pacman.conf.arm" \
      | install -m644 /dev/stdin "$pkgdir/etc/pacman.conf"
  else
    install -m644 "$srcdir/pacman.conf.$CARCH" "$pkgdir/etc/pacman.conf"
  fi

  # set things correctly in the default conf file
  local mychost myflags moresed=()
  case $CARCH in
    i686)
      mychost="i686-pc-linux-gnu"
      myflags="-march=i686"
      ;;
    x86_64)
      mychost="x86_64-pc-linux-gnu"
      myflags="-march=x86-64"
      ;;
    arm*|aarch64)
      moresed+=('-e' 's/-fcf-protection//')
      ;;&
    arm)
      mychost="armv5tel-unknown-linux-gnueabi"
      myflags="-march=armv5te"
      ;;
    armv6h)
      mychost="armv6l-unknown-linux-gnueabihf"
      myflags="-march=armv6 -mfloat-abi=hard -mfpu=vfp"
      ;;
    armv7h)
      mychost="armv7l-unknown-linux-gnueabihf"
      myflags="-march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16"
      ;;
    aarch64)
      mychost="aarch64-unknown-linux-gnu"
      myflags="-march=armv8-a"
      ;;
  esac

  # set things correctly in the default conf file
  install -m644 "$srcdir/makepkg.conf" "$pkgdir/etc"
  sed -i "$pkgdir/etc/makepkg.conf" \
    -e "s|@CARCH[@]|$CARCH|g" \
    -e "s|@CHOST[@]|$mychost|g" \
    -e "s|@CARCHFLAGS[@]|$myflags|g" \
    "${moresed[@]}"
}

# vim: set ts=2 sw=2 et:
