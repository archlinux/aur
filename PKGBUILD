# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: godane <slaxemulator@gmail.com.com>
# Contributor: Andres Perera <aepd87@gmail.com>

pkgname=pacman-reproducible
pkgver=5.0.1.166.g877b58d4
pkgrel=2
pkgdesc="A library-based package manager with dependency support. reproducible builds version."
arch=('i686' 'x86_64')
url="https://www.archlinux.org/pacman/"
license=('GPL')
depends=('bash' 'curl' 'gpgme' 'libarchive' 'pacman-mirrorlist')
makedepends=('git' 'asciidoc')
optdepends=('fakeroot: for makepkg usage as normal user')
checkdepends=('python2' 'fakechroot')
provides=("pacman=$pkgver" 'pacman-contrib' 'libalpm.so')
conflicts=('pacman' 'pacman-contrib')
options=('!libtool' '!strip')
backup=(etc/pacman.conf
        etc/makepkg.conf)
source=(${pkgname}::"git+https://github.com/anthraxx/pacman#branch=wip/reproducible")
sha1sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --always | sed 's/^v//;s/-/./g'
}

build() {
  cd ${pkgname}

  ./autogen.sh
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
  make -C ${pkgname} check
}

package() {
  cd ${pkgname}

  make DESTDIR="$pkgdir" install

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
  esac

  # install completion files
  rm -r "$pkgdir/etc/bash_completion.d"
  install -Dm644 scripts/completion/bash_completion "$pkgdir/usr/share/bash-completion/completions/pacman"
  for f in makepkg pacman-key; do
    ln -s pacman "$pkgdir/usr/share/bash-completion/completions/$f"
  done

  install -Dm644 scripts/completion/zsh_completion $pkgdir/usr/share/zsh/site-functions/_pacman
}

# vim: set ts=2 sw=2 et:
