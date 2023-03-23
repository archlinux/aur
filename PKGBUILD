# Maintainer: ArcanusNEO <admin@transcliff.top>
# Maintainer: zhullyb < zhullyb [at] outook dot com >
# Maintainer: sukanka < su975853527 [at] gmail dot com >
pkgname=aliyunpan-odomu-git
url="https://github.com/odomu/aliyunpan"
pkgrel=3
pkgver=r32.cc78aea
pkgdesc="阿里云盘小白羊版，odomu's fork"
arch=("any")
license=("None")
_electron=electron20
depends=("$_electron" 'aria2' 'bubblewrap')
optdepends=('mpv: media preview support')
provides=("aliyunpan-odomu")
conflicts=("aliyunpan-odomu")
source=("git+${url}.git" 'app.png')
sha256sums=('SKIP' '2847ab9e9c9cea5fbee331dd34abc8a8cebef232dcfb4f739da7a36d9bed4c79')

pkgver() {
  cd $srcdir/aliyunpan
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare(){
	cat >aliyunpan-odomu.desktop <<EOF
[Desktop Entry]
Type=Application
Name=阿里云盘小白羊版
Comment=阿里云盘小白羊版基于阿里云盘网页版开发的PC客户端，已经实现了阿里云盘官方客户端的基本功能，你可以在这里存储、管理和探索内容，尽情打造丰富的数字世界。
Icon=aliyunpan-odomu
Exec=aliyunpan-odomu %u
Categories=Network;
Terminal=false
StartupNotify=true
StartupWMClass=阿里云盘小白羊版
EOF

	cat >aliyunpan-odomu.sh <<EOF
#!/bin/sh
set -eu

if [[ \$EUID -ne 0 ]] || [[ \$ELECTRON_RUN_AS_NODE ]]; then
  exec bwrap \
		--dev-bind / / \
		--tmpfs /usr/lib/$_electron/resources \
		--bind /usr/lib/$_electron/resources/default_app.asar /usr/lib/$_electron/resources/default_app.asar \
		--setenv ELECTRON_FORCE_IS_PACKAGED true \
		$_electron /usr/lib/aliyunpan-odomu/app.asar "\$@"
else
	export ELECTRON_FORCE_IS_PACKAGED=true
  exec $_electron --no-sandbox /usr/lib/aliyunpan-odomu/app.asar "\$@"
fi
EOF

}

build(){
	cd ${srcdir}/aliyunpan
	yarn
	yarn run build --linux dir
}

package(){
	install -Dm644 ${srcdir}/aliyunpan/release/linux-unpacked/resources/app.asar -t ${pkgdir}/usr/lib/aliyunpan-odomu/
	cp -a ${srcdir}/aliyunpan/release/linux-unpacked/resources/crx/ ${pkgdir}/usr/lib/aliyunpan-odomu/

	mkdir -p ${pkgdir}/usr/lib/aliyunpan-odomu/engine
	install -Dm644 ${srcdir}/aliyunpan/release/linux-unpacked/resources/engine/aria2.conf -t ${pkgdir}/usr/lib/aliyunpan-odomu/engine/
	ln -s /usr/bin/aria2c ${pkgdir}/usr/lib/aliyunpan-odomu/engine/

	install -Dm644 ${srcdir}/app.png -t ${pkgdir}/usr/lib/aliyunpan-odomu/
	mkdir -p ${pkgdir}/usr/share/icons
	ln -s /usr/lib/aliyunpan-odomu/app.png ${pkgdir}/usr/share/icons/aliyunpan-odomu.png
	
	install -Dm644 ${srcdir}/aliyunpan-odomu.desktop -t ${pkgdir}/usr/share/applications/
	install -Dm755 ${srcdir}/aliyunpan-odomu.sh ${pkgdir}/usr/bin/aliyunpan-odomu
}
