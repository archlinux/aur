# Maintainer: monotonee <monotonee at tuta dot io>
# Note that the decision to use "latest" as pkgver was made based on the
# PKGBUILD of aurvote-git and negates the necessity of manual updates.
pkgname='php-symfony-installer-git'
_vcsRepoDir='symfony-installer'
pkgver=v1.1.7.r5.g8674f70
pkgrel=1
pkgdesc='Official installer to start new projects based on the Symfony full-stack framework.'
arch=('any')
url='https://symfony.com/'
license=('MIT')
depends=('php>=5.4.0')
makedepends=('git' 'php-composer' 'php-box-git')
conflicts=('symfony2')
provides=('symfony')
source=($_vcsRepoDir'::git+https://github.com/symfony/symfony-installer.git')
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
  box build --no-interaction
}

check() {
  cd $_vcsRepoDir
  _pharName=${provides[0]}'.phar'
  echo 'Verifying built PHAR: '$(box verify $_pharName --no-interaction)
  echo 'Checking built PHAR version: '$(./$_pharName --version)
}

package() {
  cd $_vcsRepoDir
  _pharName=${provides[0]}'.phar'
  install -D -m755 $_pharName $pkgdir/usr/bin/${provides[0]}
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
