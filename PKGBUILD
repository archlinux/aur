# Maintainer: yhfudev <yhfudev ta gmail dot com>

pkgname=giskismet
_gitname=giskismet
pkgver=r5.15324cd
pkgrel=1
pkgdesc="A wireless recon visualization tool to represent data gathered using Kismet"
arch=('any')
url="http://www.giskismet.org"
license=('GPL2')
depends=('perl-xml-libxml' 'perl-dbi' 'perl-dbd-sqlite')
options=('!emptydirs')
makedepends=('git')
provides=('giskismet')

source=(
    "${_gitname}::git://git.kali.org/packages/giskismet.git"
    )
md5sums=(
    'SKIP'
    )
sha1sums=(
    'SKIP'
    )

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    #local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

pkgver_git_bak() {
    cd "${srcdir}/${pkgname}"
    git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver() {
    pkgver_git
}

build() {
  cd "$srcdir/${_gitname}"

  perl Makefile.PL
  make
}

package() {
  cd "$srcdir/${_gitname}"

  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man install
  #ln -sf site_perl/${_svnname} ${pkgdir}/usr/bin/${_svnname}
}
