# Maintainer: Dwi Mulia Mokoginta <dwi-mulia-mokoginta@protonmail.com>
# Contributor: chendaniely <chendaniely@gmail.com>
# Contributor: Conor Anderson <conor@conr.ca>

pkgname=nteract
pkgver=0.28.0
pkgrel=1
pkgdesc='Interactive literate coding notebook'
url='https://nteract.io/'
arch=('x86_64')
license=('BSD 3-Clause')
depends=('gtk3' 'nss' 'libxcrypt' 'libxcrypt-compat' 'ruby' 'python')
makedepends=('nodejs' 'npm' 'yarn')
optdepends=('ihaskell-git: support for Haskell'
            'julia: support for Julia (requires the "IJulia" package)'
            'python-ipykernel: support for Python 3'
            'python2-ipykernel: support for Python 2'
            'r: support for R (requires the "IRkernel" package)'
            'sagemath-jupyter: support for SageMath')
source=(v${pkgver}.tar.gz::https://github.com/nteract/nteract/archive/refs/tags/v${pkgver}.tar.gz
				'LICENSE::https://raw.githubusercontent.com/nteract/nteract/main/LICENSE')
sha256sums=('5132a05ca269aa3b1b0a96cbe4a7b9956454069029173f6f1cb3d73a59a83073'
						'866e6fa48cb8810d36d8d85a3085d7aa1c4317d3731f0ef84919428fee87bf71')

prepare() {
	cd nteract-${pkgver}

	yarn install
}

build() {
	cd nteract-${pkgver}

	NODE_OPTIONS="--max-old-space-size=8192" yarn run pack
}

package() {
  mkdir "$pkgdir"/opt
  mkdir "$pkgdir"/usr

  mkdir "$pkgdir"/usr/bin

  mkdir "$pkgdir"/usr/share
  mkdir "$pkgdir"/usr/share/applications
  mkdir "$pkgdir"/usr/share/licenses
  mkdir "$pkgdir"/usr/share/licenses/$pkgname

	cp -a nteract-${pkgver}/applications/desktop/dist/linux-unpacked "$pkgdir"/opt/$pkgname
	cp -a nteract-${pkgver}/applications/desktop/static "$pkgdir"/opt/$pkgname/resources/

  chmod u+s "$pkgdir"/opt/$pkgname/chrome-sandbox

	ln -s /opt/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname

  desktop-file-install -m 644 --dir $pkgname.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop

	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
