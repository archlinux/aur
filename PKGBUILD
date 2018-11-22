# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=alchemy-git
pkgver=r597.1a4ac99
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Nonorthodox painting software exploring and experimenting with alternative ways of drawing"
url="http://al.chemy.org/"
license=('GPL')
conflicts=('alchemy')
depends=('sh' 'java-environment=8' 'hicolor-icon-theme' 'libxrender' 'libxcomposite' 'libxtst' 'libxml2')
makedepends=('git' 'apache-ant' 'imagemagick')
source=("${pkgname}::git+https://github.com/karldd/Alchemy.git"
	"alchemy.desktop"
	)
md5sums=('SKIP'
         'c7cffede4dda0acd94aa94deec037720')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
	cd ${pkgname}
	ant -Dnb.internal.action.name=build jar
}

package() {
	cd ${pkgname}
	chmod -R o+r dist/*
	install -dm755 ${pkgdir}/opt/alchemy
        cp -r -t ${pkgdir}/opt/alchemy dist/Alchemy/*
	install -dm755 ${pkgdir}/usr/bin
	echo -e "#!/bin/sh\nexec /opt/alchemy/Alchemy" > ${pkgdir}/usr/bin/alchemy
	echo -e "#!/bin/sh\nexec /opt/alchemy/AlchemyOpenGL" > ${pkgdir}/usr/bin/alchemy-opengl
	chmod +x ${pkgdir}/usr/bin/*
	install -dm755 ${pkgdir}/usr/share/doc/alchemy
	convert res/Alchemy.ico alchemy.png
	install -Dm644 "alchemy-0.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/alchemy.png"
	install -Dm644 "alchemy-0.png" "${pkgdir}/usr/share/pixmaps/alchemy.png"
	install -Dm644 "alchemy-1.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/alchemy.png"
	install -Dm644 "alchemy-2.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/alchemy.png"
	install -Dm644 "alchemy-3.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/alchemy.png"
	install -Dm644 "alchemy-4.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/alchemy.png"
	install -Dm644 "alchemy-5.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/alchemy.png"
	install -Dm644 "../alchemy.desktop" "${pkgdir}/usr/share/applications/alchemy.desktop"
}
