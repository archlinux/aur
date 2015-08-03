# Maintainer: monotonee <monotonee at tuta dot io>
# Note that the decision to use "latest" as pkgver was made based on the
# PKGBUILD of aurvote-git and negates the necessity of manual updates.
pkgname='php-box-git'
_vcsRepoDir='box2'
pkgver='latest'
pkgrel=1
pkgdesc='An application for building and managing phars.'
arch=('any')
url='http://box-project.org/'
license=('MIT')
depends=('php>=5.3.3')
makedepends=('git' 'php-composer')
conflicts=('php-box')
provides=('box')
source=($_vcsRepoDir'::git+https://github.com/box-project/box2.git')
md5sums=('SKIP')

pkgver() {
  cd $_vcsRepoDir
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_vcsRepoDir
  composer install --no-interaction
}

build() {
  cd $_vcsRepoDir
  bin/box build --no-interaction
}

check() {
  cd $_vcsRepoDir
  _pharName='box-'$(git describe --tags)'.phar'
  echo 'Verifying built PHAR: '$(bin/box verify $_pharName)
  echo 'Checking built PHAR version: '$(./$_pharName --version)
}

package() {
  cd $_vcsRepoDir
  _pharName='box-'$(git describe --tags)'.phar'
  install -D -m755 $_pharName $pkgdir/usr/bin/${provides[0]}
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
