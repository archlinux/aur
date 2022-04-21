# Maintainer: Caleb Maclennan <caleb@alerque.com>

_appname=user_saml
pkgname=nextcloud-app-${_appname/_/-}
pkgver=5.0.0
pkgrel=1
pkgdesc="App for authenticating Nextcloud users using SAML"
arch=(x86_64)
url="https://github.com/nextcloud/$_appname"
license=(AGPL3)
depends=(nextcloud)
makedepends=(composer
             rsync)
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c3401177c1aa3ae68d4471ad0aa4dff73fd2e1dda314fad1f52f350f84ae5e23')

prepare() {
	cd "$_appname-$pkgver"
	composer install --no-dev -d ./3rdparty/
}

package() {
    cd "$_appname-$pkgver"
	_appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	rsync -a --mkpath \
		--exclude=.drone.yml \
		--exclude=.git \
		--exclude=.gitattributes \
		--exclude=.github \
		--exclude=.gitignore \
		--exclude=.scrutinizer.yml \
		--exclude=.travis.yml \
		--exclude=.tx \
		--exclude=/build \
		--exclude=/CONTRIBUTING.md \
		--exclude=/docs \
		--exclude=/issue_template.md \
		--exclude=/l10n/l10n.pl \
		--exclude=/Makefile \
		--exclude=/README.md \
		--exclude=/screenshots \
		--exclude=/tests \
		--exclude=/translationfiles \
	./ $_appdir/
}
