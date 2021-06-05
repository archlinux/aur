# Maintainer: taotieren <admin@taotieren.com>

pkgname=xboot-git
pkgver=v2.0.1.r1919
pkgrel=1
pkgdesc="The extensible bootloader for embedded system with application engine, write once, run everywhere. (Linux Sandbox for x86_64)"
arch=('x86_64')
url="https://github.com/xboot/xboot"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
#replaces=(${pkgname})
depends=('sdl2')
makedepends=('git')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/g' | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    make CROSS_COMPILE="" PLATFORM=x64-sandbox
}

package() {
    install -Dm0755 "${srcdir}/${pkgname%-git}/output/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm0644 "${srcdir}/${pkgname%-git}/developments/logo/xboot-logo.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.svg"
    install -Dm0644 "${srcdir}/${pkgname%-git}/developments/logo/xboot-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/application-x-${pkgname%-git}.svg"

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-git}
Name[zh_CN]=${pkgname%-git}
Comment=The runtime environment
MimeType=application/x-${pkgname%-git};
Exec=${pkgname%-git} %f
Type=Application
Categories=Development;Game;
Terminal=false
Icon=${pkgname%-git}
Version=${pkgver}
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/mime/packages/${pkgname%-git}.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
	<mime-type type="application/x-xboot">
		<comment>xboot</comment>
	<glob pattern="*.x"/>
	</mime-type>
</mime-info>
EOF
}
