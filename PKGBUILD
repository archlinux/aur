# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: godane <slaxemulator@gmail.com.com>
# Contributor: Andres Perera <aepd87@gmail.com>

pkgname=pacman-fancy-progress-git
pkgver=6.0.1.r123.g2c45e854
pkgrel=3
pkgdesc="pacman-git but patched to have a unicode progressbar"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.archlinux.org/pacman/"
license=('GPL')
depends=('archlinux-keyring' 'bash' 'curl' 'gpgme' 'libarchive'
         'pacman-mirrorlist')
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
        "makepkg.conf"
        "progress.patch")
sha256sums=('SKIP'
            '0e09eb240512da85f7eaa314a5a98fe7d4c4e7ed5eebde7e3e937c0ae4ee7054'
            '7ff75a61a07eabbc1718a7171b897b6504a6370f2f59a14caf42bbf0dce26ea6'
            '3fa640a4a2138b8d07b6e6366ff0743206ecb32fc3b7f53490a614388c492cf3'
            '0c1ecbb8c57e8ef2c600b41d4458269095fc4ddb6778d0000d4a9a067f68fe2d'
            'cd2b5e3ce691b84e18e90c5cc70a00874098e1281ae74f401539ad74b7c25a09')

pkgver() {
  cd pacman

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd pacman
  git apply ../progress.patch
  cd ..

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
