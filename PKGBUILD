# Maintainer: Stephanie Wilde-Hobbs <git@stephanie.is>
# Upstream-Maintainer: Sébastien Luttringer

pkgname=bird-babel-rtt
pkgver=2.13.1
pkgrel=2
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=('x86_64')
url='https://bird.network.cz/'
license=('GPL2')
backup=('etc/bird.conf')
depends=('glibc' 'readline' 'ncurses' 'libssh')
makedepends=('git')
replaces=('bird6')
conflicts=('bird')
options=(!emptydirs)
source=("git+https://gitlab.nic.cz/labs/bird.git"
        'bird.service')
sha256sums=('SKIP'
            '4aa1e8d41229badd276aa3747f613e7df34761892add2258c63bdb5097dfeb2b')

prepare() {
  cd bird

  git remote add -f tohojo https://github.com/tohojo/bird.git
  git checkout babel-rtt-01
  git -c user.name="pkgbuild" -c user.email="pkgbuild" rebase "v$pkgver"

  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      echo "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd bird
  autoreconf
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --runstatedir=/run/bird \
    --docdir=/usr/share/doc/bird
  make
}

package () {

  cd bird
  make DESTDIR="$pkgdir" install

  # systemd
  install -D -m 644 "$srcdir/bird.service" "$pkgdir/usr/lib/systemd/system/bird.service"
}

# vim:set ts=2 sw=2 et:
