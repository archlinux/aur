# $Id$
# Maintainer: Julio Campagnolo <juliocampagnolo@gmail.com>

pkgname=('armorpaint-git')
_pkgname='armorpaint'
pkgver=0.9.r2900.gef390132
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="ArmorPaint is a software for 3D PBR texture painting"
url="https://armorpaint.org/"
license=('ZLIB')
depends=('mesa' 'alsa-lib' 'libxinerama' 'gcc-libs' 'nodejs')
makedepends=('git' 'nodejs' 'clang' 'make' 'gcc' 'gtk3' 'vulkan-headers')
provides=('armorpaint')
conflicts=('armorpaint')
source=("git+https://github.com/armory3d/armorpaint"
        "armorpaint.sh"
        "armorpaint.desktop"
        "armorpaint.png")
md5sums=(SKIP
         "74001d6c572fc79c96d0bee24427f7ba"
         "dd5d97aadd39966ff7d9dda68b5ae29a"
         "67cf4a0cb08c66c4a68c677885e8ac99")

pkgver() {
  cd ${srcdir}/${_pkgname}
  ver=$(grep -Po '(^|\s)+(public static var version =)(\s)+\"\K(([0-9|\.])+)' 'Sources/Main.hx')
  printf "%s.r%s.g%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${_pkgname}
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/${_pkgname}"
    armorcore/Kinc/make --from armorcore -g opengl --compiler clang --compile
    strip armorcore/Deployment/ArmorPaint
}

package() {
	cd "$srcdir"/"$_pkgname"
	mkdir -p ${pkgdir}/usr/{bin,share,lib}
	mkdir -p ${pkgdir}/usr/lib/armorpaint
	install -Dm755 ${srcdir}/armorpaint.sh ${pkgdir}/usr/bin/armorpaint
	install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm755 armorcore/Deployment/ArmorPaint ${pkgdir}/usr/lib/armorpaint/
	install -Dm644 ${srcdir}/armorpaint.desktop ${pkgdir}/usr/share/applications/armorpaint.desktop
	mkdir -p ${pkgdir}/usr/share/armorpaint
	cp -r build/krom ${pkgdir}/usr/share/armorpaint/krom
	install -Dm644 ${srcdir}/armorpaint.png ${pkgdir}/usr/share/icons/armorpaint.png
}
