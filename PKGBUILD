# Maintainer: soh @ AUR

pkgname=tuic
pkgver=1.0.0
pkgrel=1
pkgdesc='Delicately-TUICed 0-RTT proxy server and client'
arch=('x86_64')
url=https://github.com/fokx/tuic
license=('GPL3')
depends=()
makedepends=('rust' 'git')
source=("${pkgname}::git+$url"
 client.json
 server.json
 tuic.sysusers
 tuicc@.service
 tuics@.service
 tuic.patch
)
b2sums=('SKIP'
        '061a71643cd521d5224616805aba83c5887c9384156c5ab0c074fe7f5f873b33b8c8fdef379f67ef41e8c88437564aeb285e912d58549cb914acebd17726898e'
        'c07bc16b05e0a4ebca255b7680d48d6281d37d6dbe40fcf79ece13fa2aa0ef17907c064f2a18fbdfb2bb39e565b43e5bfccdf0c69d04bbd27b5fddef94885287'
        '6f65065fff93d97ff528aafbf4d5b891587263162003681c8ec59f932673d4484237cbea4a32680d1c7d3d78d97ccfd9ea8d816bf740dd638929df3a5ad88034'
        '40a4ff7d141ce0b9fffbc3bccae4bb24f12b0991f75e71e914d289d9ac52e921b9b40b745b6bdf7b0a9676892eef537e707f2625dd3b20cea26695855ef7c0d2'
        '955d2447f08f6762ba23f67796b34bba466dc8860d389fd7899ac0b68ac9153770757205d965056a5161b7515042a722a7dd683149b3dee3a777453ec2b2b34d'
        '81ca29b186201e11656e306e39bdf15397aaf9cf291bed17c0986853a25161f99e91efcd9a629ca5b79fe954d5097ff975bd84c4c73be43480c4934fa77b226f')


prepare() {
  cd $pkgname
  git submodule sync --recursive; git submodule foreach -q git config remote.origin.url; git submodule update --init --recursive --remote
  patch --forward --strip=1 --input="${srcdir}/tuic.patch"
  # git checkout $pkgver
}

build() {
  cd $pkgname
  cargo build --release 
}

package() {
  cd $pkgname
  install -Dm644 "${srcdir}/tuic.sysusers" "${pkgdir}/usr/lib/sysusers.d/tuic.conf"
  install -Dm755 "target/release/$pkgname-client" -t "${pkgdir}/usr/bin/"
  install -Dm755 "target/release/$pkgname-server" -t "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/etc/tuic"
  install -Dm644 "${srcdir}/client.json" "${srcdir}/server.json" -t "${pkgdir}/etc/tuic/"
  install -Dm644 "${srcdir}/tuicc@.service" "${srcdir}/tuics@.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
