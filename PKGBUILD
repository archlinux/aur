# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-twofactor-gateway
_pkgname=twofactor_gateway
pkgver=0.9.0
pkgrel=3
pkgdesc="Second factor provider using an external messaging gateway (SMS, Telegram, Signal)"
arch=('any')
url="https://github.com/nextcloud/twofactor_gateway"
license=('AGPL3')
depends=('nextcloud')
makedepends=('composer' 'npm' 'rsync')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/twofactor_gateway/archive/v${pkgver}.tar.gz")
sha512sums=("a1d08aabea29403ccc1525c3d38b86609c5fe58976c1f189b61f2710c120dbe628f02fa54cfe6f9e9b72510e73d1a34dc2ae5c40a43c222d0cfbb1fa5b3d7c18")

build() {
  cd "${srcdir}/twofactor_gateway-${pkgver}"
  composer install --no-dev -o
  npm install
  npm run build --production
}

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  rsync -a \
  --exclude=.git \
  --exclude=build \
  --exclude=.gitignore \
  --exclude=.travis.yml \
  --exclude=.tx \
  --exclude=.scrutinizer.yml \
  --exclude=CONTRIBUTING.md \
  --exclude=composer.json \
  --exclude=composer.lock \
  --exclude=composer.phar \
  --exclude=krankerl.toml \
  --exclude=l10n/no-php \
  --exclude=Makefile \
  --exclude=nbproject \
  --exclude=node_modules \
  --exclude=package.json \
  --exclude=package-lock.json \
  --exclude=screenshots \
  --exclude=tests \
  --exclude=vendor/bin \
  "${srcdir}/${_pkgname}-${pkgver}/" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_pkgname}"

}
