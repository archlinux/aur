# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=lastpass-cli-git
pkgver=1.1.2.r0.gc9fa3a5
pkgrel=1
pkgdesc="LastPass command line interface tool (git version)"
arch=('i686' 'x86_64')
url="https://lastpass.com/"
license=('GPL2')
depends=('openssl' 'curl' 'libxml2')
makedepends=('asciidoc' 'git' 'cmake')
optdepends=('xclip: clipboard support'
            'pinentry: securely read passwords')
source=("git+https://github.com/lastpass/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}/${pkgname%-git}/build"
    cd "${srcdir}/${pkgname%-git}/build"
    cmake -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_BUILD_TYPE=None ..
    make all doc-man
}

package() {
    cd "${srcdir}/${pkgname%-git}/build"
    make DESTDIR="${pkgdir}/" install install-doc
}
