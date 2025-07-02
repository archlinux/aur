# Maintainer: a821 mail de
# Contributor: Máté Eckl <ecklm94@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Steven Allen <steven@stebalien.com>

pkgname=nftables-git
epoch=1
pkgver=1.1.3.r76.g01acf253
pkgrel=1
pkgdesc='Netfilter tables userspace tools'
arch=('x86_64')
url='https://netfilter.org/projects/nftables/'
license=('GPL-2.0-only')
depends=('libmnl' 'libnftnl-git' 'gmp' 'readline' 'ncurses' 'jansson')
optdepends=('python: Python bindings')
makedepends=('asciidoc' 'git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
backup=('etc/nftables.conf')
provides=(nftables)
conflicts=(nftables)
source=(git://git.netfilter.org/nftables
        nftables.conf
        nftables.service)
install=nftables.install
sha256sums=('SKIP'
            'f83d6f2f99f306866850c60ff0e343bbd9bc0c989d333ebe288563f7be4afe20'
            'deffeef36fe658867dd9203ec13dec85047a6d224ea63334dcf60db97e1809ea')

pkgver() {
  cd nftables
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd nftables
  sh autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/usr/share \
    --with-json \
    --with-cli=readline \
    --disable-python \
    --disable-debug
  make

  # Building the Python module separately due to the automatic build resulting
  # in an incorrect directory structure and unimportable module (see FS#79229)
  cd py
  python -m build --wheel --no-isolation
}

package() {
  cd nftables
  make DESTDIR="$pkgdir" install
  python -m installer --destdir="$pkgdir" py/dist/*.whl

  # basic safe firewall config
  install -Dm644 "$srcdir/nftables.conf" "$pkgdir/etc/nftables.conf"
  # systemd
  install -Dm644 "$srcdir/nftables.service" "$pkgdir/usr/lib/systemd/system/nftables.service"
}

# vim: set ts=2 sw=2 et:
