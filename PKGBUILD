# Contributor: David Birks <david@tellus.space>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>
# Contributor: dpeukert
# Contributor: Gabriel Saillard (GitSquared) <gabriel@saillard.dev>

pkgname=marktext
pkgver=0.16.0
pkgrel=1
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability'
arch=('x86_64')
url='https://github.com/marktext/marktext'
license=('MIT')
provides=('marktext')
conflicts=('marktext-bin' 'marktext-git')
depends=('libxkbfile')
makedepends=('nodejs' 'npm' 'python2' 'tar')
# source=("https://github.com/marktext/marktext/archive/v${pkgver}.tar.gz")
# They pushed a commit right after the release to fix a build error:
source=("https://github.com/marktext/marktext/archive/fe641a67f0ab335fbfe37dd7a4bbf7a098eb1249.tar.gz")
sha512sums=('ceed84e64c95561998712dc978489b636752b76efb68584f5df44fd4badeb630bf7154f649cf024200417c57c4f4aaabe65d1967b044e7ac9437a92151dbccbd')
install='marktext.install'

prepare() {
    mv marktext-fe641a67f0ab335fbfe37dd7a4bbf7a098eb1249 marktext-0.16.0
    cd "${pkgname}-${pkgver}"
    npx yarn --frozen-lockfile
}

build() {
    cd "${pkgname}-${pkgver}"
    node .electron-vue/build.js && npx electron-builder build --dir --linux pacman
}

package() {
    tar xf ${pkgname}-${pkgver}/build/marktext-*.pacman -C "${pkgdir}"

    rm -f "${pkgdir}/.INSTALL" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"

    chmod 755 "${pkgdir}/opt/Mark Text/marktext"
}
