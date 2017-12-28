# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: godane <slaxemulator@gmail.com.com>
# Contributor: Andres Perera <aepd87@gmail.com>

pkgname=pacman-git
pkgver=5.0.1.192.ge4f13e62
pkgrel=1
pkgdesc="A library-based package manager with dependency support. git version."
arch=('i686' 'x86_64')
url="http://www.archlinux.org/pacman/"
license=('GPL')
depends=('archlinux-keyring' 'bash' 'curl' 'gpgme' 'libarchive'
         'pacman-mirrorlist')
optdepends=('pacman-contrib: various helper utilities')
makedepends=('git' 'asciidoc')
checkdepends=('python2' 'fakechroot')
provides=("pacman=${pkgver%.r*}")
conflicts=('pacman')
backup=(etc/pacman.conf
        etc/makepkg.conf)
options=('strip' 'debug')
source=(git+https://git.archlinux.org/pacman.git
        pacman.conf.i686
        pacman.conf.x86_64
        makepkg.conf)
sha256sums=('SKIP'
            '0c087d26e80333267391a6e9e34b95a2ffb103cb9391cb53cc5d97ad954af774'
            'c5a3ec55f9d1bc52e5e5b127f76b7b16b79738268691a3e1d842359033e460da'
            '6066d67d818ee36760bf121c76d5019130f7875b3e5ed179b319b810a3a9685b')

pkgver() {
  cd pacman
  git describe | sed 's/^v//;s/-/./g'
}

prepare() {
  cd pacman

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
  install -m644 "$srcdir/pacman.conf.$CARCH" "$pkgdir/etc/pacman.conf"

  # set things correctly in the default conf file
  case $CARCH in
    i686)
      mychost="i686-pc-linux-gnu"
      myflags="-march=i686"
      ;;
    x86_64)
      mychost="x86_64-pc-linux-gnu"
      myflags="-march=x86-64"
      ;;
  esac

  # set things correctly in the default conf file
  install -m644 "$srcdir/makepkg.conf" "$pkgdir/etc"
  sed -i "$pkgdir/etc/makepkg.conf" \
    -e "s|@CARCH[@]|$CARCH|g" \
    -e "s|@CHOST[@]|$mychost|g" \
    -e "s|@CARCHFLAGS[@]|$myflags|g"


  # install completion files
  rm -r "$pkgdir/etc/bash_completion.d"
  install -Dm644 scripts/completion/bash_completion "$pkgdir/usr/share/bash-completion/completions/pacman"
  for f in makepkg pacman-key; do
    ln -s pacman "$pkgdir/usr/share/bash-completion/completions/$f"
  done

  install -Dm644 scripts/completion/zsh_completion $pkgdir/usr/share/zsh/site-functions/_pacman
}

# vim: set ts=2 sw=2 et:
