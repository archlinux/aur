# Maintainer: envolution
# Contributor: Felix Uhl <aur@mail.felix-uhl.de>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: cantabile <cantabile dot desu at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=uswsusp-git
_pkgname=uswsusp
pkgver=1.0.libgcrypt.1.6.3+r522+g84d75e60b
pkgrel=1
pkgdesc='Userspace software suspend - git checkout'
arch=('i686' 'x86_64')
url='http://suspend.sourceforge.net/'
license=('GPL-3.0-or-later')
depends=('libx86' 'lzo' 'pciutils' 'perl-switch')
makedepends=('git')
provides=('uswsusp')
conflicts=('uswsusp')
backup=('etc/suspend.conf')
install=uswsusp.install
source=(
  'git+https://github.com/bircoph/suspend.git'
  'uresume-hook'
  'uresume-install'
)
sha256sums=('SKIP'
            '2662d879ca7a2339233c8bdce123f0d686397093759ca54f162a3577603587b0'
            '9fe3e38301014b4c8597aec2041ad3c6d85e6935004cbd3ac93659d391db3157')

pkgver() {
  cd suspend

  _version=$(git tag --sort=-v:refname --list | grep '^[0-9.]' | tr - . | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

build() {
  cd suspend

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-compress \
    --enable-threads \
    --disable-resume-static \
    --disable-static \
    --sysconfdir=/etc \
    --enable-encrypt
  make
}

package() {
  install -Dm644 uresume-hook "${pkgdir}/usr/lib/initcpio/hooks/uresume"
  install -Dm644 uresume-install "${pkgdir}/usr/lib/initcpio/install/uresume"
  install -dm755 "${pkgdir}/etc"

  cd suspend
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 COPYING.GPL "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.GPL"
}
# vim:set ts=2 sw=2 et:
