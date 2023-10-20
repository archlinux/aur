# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>
# Maintainer: Asuka Minato

pkgname=notion-app-electron
pkgver="2.0.18"
pkgrel=1
pkgdesc="The all-in-one workspace for your notes and tasks, use system electron11"
arch=('x86_64' 'aarch64')
url="https://github.com/notion-enhancer/notion-repackaged"
license=('MIT')

depends=(bash
	electron11
	hicolor-icon-theme
)
provides=('notion-app')
conflicts=('notion-app')

notion_repackaged_ver="2.0.18-1"

source_x86_64=("${url}/releases/download/v${notion_repackaged_ver}/notion-app-${notion_repackaged_ver}.pacman")
source_aarch64=("${url}/releases/download/v${notion_repackaged_ver}/notion-app-${notion_repackaged_ver}-aarch64.pacman")
sha256sums_x86_64=('f9266604ae38fb75ee49489ab9eb8c261c72b809f5023d2e1939e2bf0fff7c75')
sha256sums_aarch64=('c63d54090a5a6f49cb7f809ec0bc516b46beb7b2b5d81caf8862d5967692fd03')

package() {
	rm *.pacman
	cp -av * $pkgdir

	find $pkgdir/opt -not -path "*/resources/*" -type f -print -delete

	printf '#!/bin/sh
exec electron11 /opt/Notion/resources/app.asar "$@"
' | install -Dm755 /dev/stdin $pkgdir/usr/bin/notion-app
	find $pkgdir -name "*.desktop" -type f -print -exec sed -i 's/^Exec=.*/Exec=notion-app/' {} \;
}
