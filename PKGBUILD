# AUR maintainer: Lucas Magalhães <whoisroot AT national.shitposting.agency>
# Upstream maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Upstream maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Evy Garden <evysgarden@protonmail.com>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: godane <slaxemulator@gmail.com.com>
# Contributor: Andres Perera <aepd87@gmail.com>

pkgname=pacman-fancy-git
pkgver=7.0.0.r7.g1f38429b
pkgver_repo="$(pacman -Sp pacman | grep -Eo "pacman-.*-[0-9]+"| cut -d- -f2-)"
pkgrel=1
pkgdesc="pacman, but patched to selectively have FiraCode's progressbar on supported terminals"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.archlinux.org/pacman/"
license=('GPL-2.0-or-later')
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
options=('emptydirs' 'strip')
source=("git+https://gitlab.archlinux.org/pacman/pacman.git#branch=release/${pkgver_repo%.*.*.*}.x"
        "pacman.conf.i686"
        "pacman.conf.x86_64"
        "pacman.conf.arm"
        "makepkg.conf"
        "progress.patch")
sha256sums=('SKIP'
            '52d7a593fdee6ec30fbba2a0c70601f66996a490ff3a4f009665ecd132fee40e'
            'd54141a88b71b26f3ef9f1069da528eb761ebc3b286cefba35e91c40f7aa35f8'
            'fd476a031fd5dffebede1122a0f28fd3e613d2c55c962105f7d84ee76ed7eefd'
            '0c1ecbb8c57e8ef2c600b41d4458269095fc4ddb6778d0000d4a9a067f68fe2d'
            '3f91a3a53abe8ad58506fe25e48515074e36122c5f709aa96c7c92f3f9b66be0')

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
