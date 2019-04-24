# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=buck-git
pkgver=2019.01.10.01.r1058.ga02f4c9fc4
pkgrel=1
pkgdesc='A fast build system that encourages the creation of small, \
	   reusable modules over a variety of platforms and languages.'
arch=('any')
depends=('python2')
makedepends=('java-environment=8' 'ant' 'git')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
conflicts=('buck')
provides=('buck')
url='https://buckbuild.com'
license=('Apache')
source=("git+https://github.com/facebook/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags|sed 's+-+.r+'|tr - .|cut -c2-
}

build() {
  cd ${pkgname%-git}
  ant
  ./bin/buck build buck
}

prepare() {
  _java_version=$(archlinux-java get|cut -d- -f2)
  if [[ ${_java_version} != 8 ]]; then
    msg "activate java 8 before building"
    exit 1
  fi
  sed -i 's+executable="python"+executable="python2"+g' ${pkgname%-git}/build.xml
}

package() {
  cd ${pkgname%-git}
  BINPATH=$(./bin/buck targets --show_output buck | cut -d' ' -f2)
  install -Dm 755 "${BINPATH}" "${pkgdir}"/usr/bin/buck
}
