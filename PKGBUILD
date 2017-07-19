# $Id$
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Mihails Strasuns <public@dicebot.lv>

pkgname=dcd
pkgver=0.8.0
pkgrel=4
pkgdesc="D Completion Daemon: auto-complete for the D programming language"
groups=('dlang')
arch=('i686' 'x86_64')
url="https://github.com/Hackerpilot/DCD"
license=('GPL3')

### temporary disable LDC build, https://github.com/Hackerpilot/DCD/issues/331
#depends=('liblphobos>=0.17.0')
#makedepends=('ldc' 'git')

makedepends=('dmd' 'git')
source=($pkgname-$pkgver::git+https://github.com/Hackerpilot/DCD#tag=v$pkgver
        dcd.service
        dcd.conf
        objpath.diff)
sha256sums=('SKIP'
            '7d3483ee92e42101d07395775aac5f0b277780f847c3823879fb35d1f2a9fbb3'
            'fb765020c49a918b157f5be2cabd71c16bbb050ddd762f1e08c84d1eddd4c97b'
            '69525733f6da1a21ae48c6298fbca85de43e6e2b92372497d2d4c22788f4b885')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  git submodule update --init --recursive
  git cherry-pick -n 247331fcde81 # Remove references to experimental_allocator
  git apply ${srcdir}/objpath.diff
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  make dmd
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

# binaries
  install -Dm755 bin/dcd-server "${pkgdir}"/usr/bin/dcd-server
  install -Dm755 bin/dcd-client "${pkgdir}"/usr/bin/dcd-client

# documentation
  install -d "${pkgdir}"/usr/share/man/man1
  install -Dm644 man1/* "${pkgdir}"/usr/share/man/man1/

# systemd service
  install -Dm644 "${srcdir}"/dcd.service "${pkgdir}"/usr/lib/systemd/system/dcd.service

# global config
  install -Dm644 "${srcdir}"/dcd.conf "${pkgdir}"/etc/dcd.conf
}
