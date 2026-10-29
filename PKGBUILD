# Contributor: envolution
# Contributor: Felix Uhl <aur@mail.felix-uhl.de>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: cantabile <cantabile dot desu at gmail dot com>
# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
pkgname=uswsusp-git
_pkgname=uswsusp
pkgver=1.0.libgcrypt.1.6.3+r522+g84d75e60b
pkgrel=2
pkgdesc='Userspace software suspend - git checkout'
arch=('i686' 'x86_64')
url='http://suspend.sourceforge.net/'
license=('GPL-3.0-or-later')
depends=('libx86' 'lzo' 'pciutils' 'perl-switch' 'libgcrypt')
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
b2sums=('SKIP'
        'e90fe3f8f9b37696ed8640ff3a3c7862082d5a2e681ff9b350bc1619092ae9397bdf6f805c39f646c400f2a5353793a2ecbffff7e0215fa6f7ec31a36c85cd7f'
        '02a68df72407fe2d48b90b14339564bdf635aae329aafd072edc640990b34bce13bdfd4c4b2f0a481d70e75e1cc5646be7d7ceee8f13bacabda79fcf34ffec01')

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
  install -Dm644 COPYING.GPL "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.GPL"
}
# vim:set ts=2 sw=2 et:
