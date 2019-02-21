# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=lastpass-cli-git
pkgver=1.3.1.r8.gb2095ad
pkgrel=1
pkgdesc="LastPass command line interface tool (git version)"
arch=('i686' 'x86_64')
url="https://lastpass.com/"
license=('GPL2')
depends=('openssl' 'curl' 'libxml2')
makedepends=('git' 'asciidoc' 'cmake' 'bash-completion')
optdepends=('xclip: clipboard support'
            'pinentry: securely read passwords')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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

check() {
    cd "${srcdir}/${pkgname%-git}/build"
    make lpass-test test
}

package() {
    cd "${srcdir}/${pkgname%-git}/build"
    make DESTDIR="${pkgdir}/" install install-doc

    install -Dm0644 ../contrib/lpass_zsh_completion "${pkgdir}"/usr/share/zsh/site-functions/_lpass
    install -Dm0644 ../contrib/completions-lpass.fish "${pkgdir}"/usr/share/fish/completions/lpass.fish
}
