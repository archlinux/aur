# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: André Klitzing <aklitzing@online.de>
# Contributor: JD Horelick <jdhore1@gmail.com>

pkgname=devscripts
pkgver=2.17.5
pkgrel=3
pkgdesc="Scripts to make the life of a Debian Package maintainer easier"
arch=('i686' 'x86_64')
url="http://packages.qa.debian.org/d/devscripts.html"
license=('GPL2')
depends=('dpkg' 'wget' 'sed' 'perl' 'debianutils' 'debhelper' 'perl-timedate')
optdepends=('sensible-utils: for sensible alternative selection')
makedepends=(
    'docbook-xsl'
    'bash-completion'
    'git'
    'perl-file-desktopentry'
    'perl-file-basedir'
    'perl-git-wrapper'
    'perl-libwww'
    'perl-list-compare'
    'perl-parse-debcontrol'
    'perl-timedate'
    'po4a'
    'python-setuptools'
)
options=('!makeflags')
source=(
	#http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz
	"${pkgname}::git+https://anonscm.debian.org/git/collab-maint/devscripts.git#tag=v${pkgver}"
	fixes.patch
)
sha256sums=('SKIP'
            '9d038e5425848734874a03e2bdc0c8b86b1f42e9626f37dd916c1b7d73ad9141')

build() {
  cd "$pkgname"
  patch -p1 -i "$srcdir/fixes.patch"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  # Create dch symlink to debchange
  ln -s /usr/bin/debchange "$pkgdir/usr/bin/dch"

  # bts completion is present already in the official package
  rm "$pkgdir/usr/share/bash-completion/completions/bts"
}
