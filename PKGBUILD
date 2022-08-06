# Maintainer: Jef Roosens
# Contributor: Logan Magee <mageelog@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: whoami <whoami@systemli.org>
# Contributor: Jefferson González <jgmdev@gmail.com>
# Contributor: Chloe Kudryavtsev <toast@toastin.space>

pkgname=vlang-git
pkgver=0.3.r275.gd6b594c4e8
pkgrel=1
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software (development version)'
arch=('x86_64' 'aarch64')
url='https://vlang.io'
license=('MIT')
depends=('glibc')
makedepends=('git')
optdepends=('glfw: Needed for graphics support'
            'freetype2: Needed for graphics support'
            'openssl: Needed for http support')
conflicts=('v' 'vlang' 'vlang-bin')
provides=('vlang')
source=('v::git+https://github.com/vlang/v')
sha256sums=('SKIP')

pkgver() {
  # Weekly tags are considered older than semantic tags that are older than
  # them, so to prevent version resolution problems we exclude weekly tags.
  git -C v describe --long --tags --exclude "weekly*" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd v

    CFLAGS= LDFLAGS= make prod=1 

    # Compile all tools
    LDFLAGS= ./v build-tools
}

package() {
    cd v

    install -d "${pkgdir}/usr/lib/vlang" "${pkgdir}/usr/share/vlang" "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 v "${pkgdir}/usr/lib/vlang"
    cp -a cmd "${pkgdir}/usr/lib/vlang/"
    cp -a examples "${pkgdir}/usr/share/vlang/"
    cp -a thirdparty "${pkgdir}/usr/lib/vlang/"
    cp -a vlib "${pkgdir}/usr/lib/vlang/"
    cp v.mod "${pkgdir}/usr/lib/vlang/"
    ln -s /usr/lib/vlang/v "${pkgdir}/usr/bin/v"

    touch "${pkgdir}/usr/lib/vlang/cmd/tools/.disable_autorecompilation"
}

# vim: ft=bash
