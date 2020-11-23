# Maintainer: Geert Hendrickx <geert@hendrickx.be>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>

pkgname=opendkim-git
_branch=develop
pkgver=2.11beta4093.835834ea
pkgrel=1
pkgdesc="An open source implementation of the DKIM sender authentication system (with ed25519 support)"
arch=(x86_64)
url="https://github.com/trusteddomainproject/OpenDKIM/blob/${_branch}/README"
license=('BSD' 'custom:Sendmail')
depends=("db" "openssl" "libbsd" "opendbx" "libldap")
optdepends=("perl: for opendkim-genkey")
makedepends=("libmilter")
provides=(opendkim)
conflicts=(opendkim)
options=(!emptydirs)
backup=(etc/conf.d/opendkim)
validpgpkeys=('5CDD574C22FF4D2480ACABDF5254B96BC608B511')
source=("git://github.com/trusteddomainproject/OpenDKIM.git#branch=${_branch}"
        opendkim.conf
        opendkim.sysusers
        opendkim.tmpfiles
        opendkim.service)
sha256sums=('SKIP'
            'a3b5ecf4f4fe4a79392a75f7c4b6cc93a51ef8503215bb0f64d795f8754d4b68'
            '525ac5df345e753461efa8f6528f5532a00ecf2562f985a3c6c7169235170499'
            'ab66c9fdcb8913f2a550289dd44d56d17b960cf5275839ffd03cba70a27ab6ed'
            '3e1cb3a3ddb794253d5a1c59673c40687bbc2b1bf878e70ccd03356f6d1e6735')

pkgver() {
  cd "$srcdir/OpenDKIM"
  printf "2.11beta%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/OpenDKIM"
  autoreconf -i
}

build() {
  cd "$srcdir/OpenDKIM"
  ./configure --prefix=/usr --sbindir=/usr/bin --with-db \
    --with-odbx --with-sql-backend --with-openldap
  make
}

check() {
  cd "$srcdir/OpenDKIM"
  make check
}

package() {
  cd "$srcdir/OpenDKIM"

  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/opendkim.sysusers" "$pkgdir/usr/lib/sysusers.d/opendkim.conf"
  install -Dm644 "$srcdir/opendkim.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/opendkim.conf"

  # configure default configuration
  install -Dm644 "$srcdir/opendkim.conf" "$pkgdir/etc/conf.d/opendkim"

  # License
  mkdir -p "$pkgdir/usr/share/licenses/opendkim"
  for f in LICENSE LICENSE.Sendmail; do
    ln -s ../../doc/opendkim/$f "$pkgdir/usr/share/licenses/opendkim/$f"
  done

  install -Dm0644 "$srcdir"/opendkim.service "$pkgdir"/usr/lib/systemd/system/opendkim.service
}
