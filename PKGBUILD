# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=betty-git
_gitname=betty
pkgver=0.1.7.r64.gf95c4e3
pkgrel=1
pkgdesc="Friendly English-like interface for your command line"
arch=('any')
url="https://github.com/pickhardt/betty"
license=('Apache')
depends=('ruby')
makedepends=('git')
conflicts=('betty')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'  
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Set absolute paths for static files
  sed -i "s^File.dirname(__FILE__) + '/lib^'/usr/lib/${_gitname}^g" main.rb
  sed -i "s^ENV\['HOME'\] + '/.^'/etc/${_gitname}/^g" lib/config.rb
  sed -i "s^ENV\['HOME'\] + '/.^'/var/log/${_gitname}/^g" main.rb
}

package() {
  cd "${srcdir}/${_gitname}"

  install -d "${pkgdir}/etc/${_gitname}"

  install -Dm666 /dev/null "${pkgdir}/var/log/${_gitname}/betty_history"
  install -D main.rb "${pkgdir}/usr/bin/${_gitname}"
  install -Dm644 lib/* -t "${pkgdir}/usr/lib/${_gitname}"
}

# vim:set ts=2 sw=2 et:
