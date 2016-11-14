# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Maintainer: Dave Reisner <d@falconindy.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: godane <slaxemulator@gmail.com.com>
# Contributor: Andres Perera <aepd87@gmail.com>

pkgname=pacman-buildenv_ext-git
pkgver=5.0.1.95.gfa06951
pkgrel=1
pkgdesc="A library-based package manager with dependency support with support for build environment extensions. git version."
arch=('i686' 'x86_64')
url="http://www.archlinux.org/pacman/"
license=('GPL')
depends=('bash' 'curl' 'gpgme' 'libarchive' 'pacman-mirrorlist')
makedepends=('git' 'asciidoc')
optdepends=('fakeroot: for makepkg usage as normal user'
            'makepkg-optimize2: supplemental build and packaging optimizations')
checkdepends=('python2' 'fakechroot')
provides=(pacman{,-git}=$pkgver 'libalpm.so')
conflicts=('pacman')
options=('!libtool' '!strip')
backup=(etc/pacman.conf
        etc/makepkg.conf)
source=(git://git.archlinux.org/pacman.git
        buildenv_ext.patch)
sha1sums=('SKIP'
          '0f3b272bd2afb83eca7af6595ab763ede2cccfdd')

pkgver() {
  cd pacman
  git describe | sed 's/^v//;s/-/./g'
}

prepare() {
  cd pacman
  patch -Np1 < ../buildenv_ext.patch
}

build() {
  cd "pacman"

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
  make -C "pacman" check
}

package() {
  cd "pacman"

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

  # Do not cruelly overwrite people's config files with useless garbage.
  [[ -f /etc/makepkg.conf ]] && \
      mv $pkgdir/etc/makepkg.conf{,-git} && \
      cp {,$pkgdir}/etc/makepkg.conf
  [[ -f /etc/pacman.conf ]] && \
      mv $pkgdir/etc/pacman.conf{,-git} && \
      cp {,$pkgdir}/etc/pacman.conf
}

# vim: set ts=2 sw=2 et:
