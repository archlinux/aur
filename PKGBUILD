# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>

pkgname=rsync-git
pkgver=3.4.3.r55.g68df17ae
pkgrel=1
pkgdesc='A fast and versatile file copying tool for remote and local files - git checkout'
arch=('i686' 'x86_64')
url='https://rsync.samba.org/'
license=('GPL-3.0-or-later')
depends=('acl' 'libacl.so' 'lz4' 'openssl' 'popt' 'xxhash' 'libxxhash.so'
         'zlib' 'zstd')
optdepends=('python: for rrsync')
makedepends=('git' 'python-commonmark')
provides=('rsync')
conflicts=('rsync')
backup=('etc/rsyncd.conf')
validpgpkeys=('0048C8B026D4C96F0E589C2F6C859FB14B96A8C5'  # Wayne Davison <wayned@users.sourceforge.net>
              '9FEF112DCE19A0DC7E882CB81BB24997A8535F6F') # Andrew Tridgell <andrew@tridgell.net
source=("git+https://github.com/RsyncProject/rsync.git"
        'rsyncd.conf')
sha256sums=('SKIP'
            '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b')

pkgver() {
	cd "$srcdir/rsync"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
  cd "rsync"

  ./configure \
    --prefix=/usr \
    --enable-ipv6 \
    --disable-debug \
    --with-rrsync \
    --with-included-popt=no \
    --with-included-zlib=no
  make
}

check() {
  cd "rsync"

  # check for IPv6 support
  # https://gitlab.archlinux.org/archlinux/packaging/packages/rsync/-/commit/8936e33b245da170e7b5488b4ca35727ac9c4b68
  if rsync -V | grep -q 'no IPv6'; then
    echo 'Built without IPv6 support!' >&2
    exit 1
  fi

  make test
}

package() {
  cd "rsync"

  make DESTDIR="$pkgdir" install
  # install support scripts to doc
  for i in support/*; do
    install -Dm0644 "$i" "$pkgdir/usr/share/doc/rsync/$i"
  done
  install -Dm0644 "tech_report.tex" "$pkgdir/usr/share/doc/rsync/tech_report.tex"
  install -Dm0644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
  install -Dm0644 packaging/systemd/rsync.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
  install -Dm0644 packaging/systemd/rsync.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
  install -Dm0644 packaging/systemd/rsync@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
}
