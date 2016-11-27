# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=apacman
pkgver=3.1
pkgrel=1
pkgdesc="AUR package manager helper and pacman wrapper, forked from packer adding many new features"
url="http://github.com/oshazard/apacman"
license=('GPL')
arch=('any')
depends=('bash' 'binutils' 'ca-certificates' 'curl' 'fakeroot' 'file' 'grep' 'jshon' 'sed' 'tar' 'wget')
optdepends=('apacman-deps: Required AUR build depends' 
            'apacman-utils: Useful AUR tools'
            'bash-bats: Run unit tests'
            'customizepkg: Tool to auto-patch AUR PKGBUILDs'
            'git: Fetch old version of AUR PKGBUILDs'
            'pkgfile: Search local package metadata'
            'proot: Allows running unit tests as user'
            'man: Debug network errors'
            'rsync: Built-in ABS support')
provides=('packer')
source=("https://github.com/oshazard/apacman/releases/download/v${pkgver}/apacman-${pkgver}.tar.gz")
md5sums=('66950d9890b3f5a7eb07cd60b096b846')
backup=('etc/apacman.conf')
install=$pkgname.install
options=('!strip')

package() {
  cd "${srcdir}/apacman-${pkgver}"

  # Install script
  mkdir -p "$pkgdir/usr/bin"
  install -m755 apacman "$pkgdir/usr/bin/apacman"

  # Install default config
  mkdir -p "$pkgdir/etc"
  install -m644 apacman.conf "$pkgdir/etc/apacman.conf"

  # Install manpages
  mkdir -p ${pkgdir}/usr/share/man/man{5,8}
  install -m644 apacman.8 "$pkgdir/usr/share/man/man8/apacman.8"
  install -m644 apacman.conf.5 "$pkgdir/usr/share/man/man5/apacman.conf.5"

  # Install GPLv3
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install tab completion
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  install -m644 zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_apacman"

  # Install unit test
  mkdir -p "${pkgdir}/usr/share/bats"
  sed -i 's/APACMAN=.*/APACMAN="apacman"/' test.bats
  install -m755 test.bats "$pkgdir/usr/share/bats/apacman.bats"
}
