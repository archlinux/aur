# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Maintainer: Dave Reisner <d@falconindy.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: godane <slaxemulator@gmail.com.com>
# Contributor: Andres Perera <aepd87@gmail.com>

pkgname=pacman-buildenv_ext-git
pkgver=5.1.1.57.gde915c4f
pkgrel=1
pkgdesc="A library-based package manager with dependency support with support for build environment extensions. git version."
arch=('i686' 'x86_64')
url="https://bbs.archlinux.org/viewtopic.php?pid=1613555"
license=('GPL')
depends=('archlinux-keyring' 'bash' 'curl' 'gpgme' 'libarchive' 'pacman-mirrorlist')
optdepends=('pacman-contrib: various helper utilities'
            'makepkg-optimize: supplemental build and packaging optimizations')
makedepends=('git' 'asciidoc')
checkdepends=('python' 'fakechroot')
provides=(pacman{,-git}=${pkgver%.*.*})
conflicts=('pacman')
options=('!libtool' '!strip')
backup=(etc/pacman.conf
        etc/makepkg.conf)
source=(git://git.archlinux.org/pacman.git
        pacman.conf.{i686,x86_64,arm}
        buildenv-libmakepkg.patch
        makepkg.conf)
sha1sums=('SKIP'
          'f3b8b360bf4c8775f439ab189e445f455334cccf'
          '0b3ad0e7e28b6b28a611ea6cc4a12515532e1b78'
          '1ac32ed5b20d62d3709fc21c67371a9ec1ce199e'
          '27d104ac92ecd7d157bba077a792195c515633e9'
          '31025906f087af36e7af5d50220c4a63acadc754')

pkgver() {
  cd pacman
  git describe | sed 's/^v//;s/-/./g'
}

prepare() {
  cd pacman
  patch -Np1 < ../buildenv-libmakepkg.patch
  ./autogen.sh
}

build() {
  cd "pacman"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-doc \
    --enable-git-version \
    --enable-debug \
    --with-scriptlet-shell=/usr/bin/bash \
    --with-ldconfig=/usr/bin/ldconfig

  make
}

check() {
  make -C "pacman" check
}

package() {
  cd "pacman"

  make DESTDIR="$pkgdir" install

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
  case $CARCH in
    i686)
      mychost="i686-pc-linux-gnu"
      myflags="-march=i686 "
      ;;
    x86_64)
      mychost="x86_64-unknown-linux-gnu"
      myflags="-march=x86-64 "
      ;;
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
    -e "s|@CARCHFLAGS[@]|$myflags|g"

  install -Dm644 scripts/completion/bash_completion "$pkgdir/usr/share/bash-completion/completions/pacman"

  install -Dm644 scripts/completion/zsh_completion $pkgdir/usr/share/zsh/site-functions/_pacman

}

# vim: set ts=2 sw=2 et:
