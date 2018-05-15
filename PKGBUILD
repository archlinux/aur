# Maintainer: Jan Max Meyer <codepilot@phorward.info>

gitname="control"
pkgname="viur-control"
pkgname="${pkgname}"
pkgver=0.31.0
pkgrel=1
pkgdesc="A multi-platform GUI for managing Google App Engine projects"
arch=('x86_64')
url="https://github.com/viur-framework/control"
license=('GPLv3')
depends=('git' 'curl' 'python2' 'python2-pillow' 'python2-pip' 'python2-setuptools')
optdepends=('google-cloud-sdk: Google Cloud SDK.')
makedepends=('npm' 'nodejs-lts-carbon')

source=(
  https://github.com/viur-framework/control/archive/${pkgver}.tar.gz
  ${pkgname}.desktop
)

md5sums=(
  'c6e19918e5713b88de1812d9d5589ec2'
  'aa71f12fbcdcf4d3c3376f42b07af942'
)

build() {
	cd "$gitname-$pkgver"
	npm install
	npm run "package:linux"
}

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	cp -r --preserve=mode $gitname-$pkgver/out/viur-control-linux-x64/* "${pkgdir}/opt/${pkgname}"

	printf '#!/bin/sh\n\n/opt/viur-control/viur-control "$@"\n' | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/viur-control"
	
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	#for i in 16 32 48 64 128 256
	#do
	#	install -Dm644 "$gitname-$pkgver/build_tools/appIcons/icon-vc-$i.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
	#done

	#install -Dm644 "$gitname-$pkgver/build_tools/appIcons/icon-viur-control.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
	install -Dm644 "$gitname-$pkgver/build_tools/appIcons/icon-vc-256.png" "${pkgdir}/opt/${pkgname}/${pkgname}.png"
}
