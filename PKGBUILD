# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Scarlett Veldt <scarlett AT enby DOT site>
pkgname=arrpc
pkgver=3.3.1
_commit='b4796fffe3bf1b1361cc4781024349f7a4f9400e'
pkgrel=1
pkgdesc="Open Discord RPC server for atypical setups"
arch=('x86_64' 'x86_64_v3')
url="https://arrpc.openasar.dev/"
license=('MIT')
depends=("glibc" "gcc-libs")
makedepends=("npm" "git")
conflicts=('arrpc-git')
# for some reason stripping the binary breaks it
options=(!strip)
install=arrpc.install
source=("git+https://github.com/OpenAsar/arrpc.git#commit=${_commit}"
        "async.patch"
        "arrpc.service")
sha256sums=('SKIP'
            '38db355a3b5b7afc79b4722068733176cdee751e4e93653219288a6faebb0922'
            'dccc409ef768766d8d4141f8d89366e0bbecd30d9b08d4d31856b01f180c4005')

build() {
  cd "${pkgname}"
  patch ./src/index.js ../async.patch
  npm i esbuild pkg
  # use node 18 as pkg apparently doesn't support 19 yet
  npx esbuild --bundle --platform=node --target=node18 --outdir=dist ./src/index.js
  npx pkg -t node18-linux-x64 -o arrpc  ./dist/index.js
}

package() {
  cd "${pkgname}"
  install -D -m755 arrpc "${pkgdir}/usr/bin/arrpc"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 ../arrpc.service "${pkgdir}/usr/lib/systemd/user/arrpc.service"
}
