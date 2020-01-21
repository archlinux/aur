# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

pkgname=buck-git
pkgver=2019.10.17.01.r1034.g89a0c4c70c
pkgrel=1
pkgdesc='A fast build system that encourages the creation of small, \
	   reusable modules over a variety of platforms and languages.'
arch=('any')
depends=('python2')
makedepends=('java-environment=11' 'ant' 'git')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
conflicts=('buck')
provides=('buck')
url='https://buckbuild.com'
license=('Apache')
source=("git+https://github.com/facebook/${pkgname%-git}.git")
sha256sums=('SKIP')

prepare() {
  sed -i 's+executable="python"+executable="python2"+g' ${pkgname%-git}/build.xml
}

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed 's+-+.r+' | tr - . | cut -c2-
}

build() {
  cd "${pkgname%-git}"
  ant
  ./bin/buck build buck
}

package() {
  cd "${pkgname%-git}"
  BINPATH=$(./bin/buck targets --show_output buck | cut -d' ' -f2)
  install -Dm 755 "${BINPATH}" "${pkgdir}"/usr/bin/buck
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ./bin/buck kill

  # Remove package srcdir from watchman watch list.
  if command -v watchman > /dev/null
  then
    watchman --no-spawn --no-local watch-del "${srcdir}/${pkgname%-git}" > /dev/null 2>&1 || true
  fi
}
