# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Xan Manning <git@xan-manning.co.uk>

_gitname='alarm-fake-hwclock'
pkgname='fake-hwclock-git'
_gitbranch=master
_gitauthor=xanmanning
pkgver=v0.1b.r5.ge45479e
pkgrel=1
pkgdesc="Save/restore system clock on machines without working RTC hardware."
url="https://github.com/${_gitauthor}/${_gitname}"
license=('custom:Coffeeware')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
arch=('any')
depends=('')
makedepends=('git')
optdepends=('ntp: network time support')
conflicts=("${_gitname}" 'fake-hwclock')
provides=("${_gitname}" 'fake-hwclock')

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp "${srcdir}/${_gitname}/systemd/fake-hwclock.service" "${pkgdir}/usr/lib/systemd/system/"
}

post_install() {
  echo "**********************************************************************"
  echo "To keep fake-hwclock up to date in case of a power failure, add the"
  echo "following job to root crontab: "
  echo "*/15 * * * * /usr/bin/fake-hwclock"
  echo "**********************************************************************"
}

post_upgrade() {
  post_install
}

# vim:set et sw=2 sts=2 tw=80: