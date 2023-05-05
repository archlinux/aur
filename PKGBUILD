# Maintainer: soh @ AUR

pkgname=tuic
pkgver=0.8.5
pkgrel=1
pkgdesc='Delicately-TUICed 0-RTT proxy server and client'
arch=('x86_64')
url=https://github.com/EAimTY/tuic
license=('GPL3')
depends=()
makedepends=('rust' 'git')
source=("${pkgname}::git+$url"
 client.json
 server.json
 tuic.sysusers
 tuicc@.service
 tuics@.service
)
b2sums=('SKIP'
        'd471a743a0b9dd3f58ace81ebea40cf42812b0d980f72fdb358452de256d65b064e9b427d9ad528abd6b23ceadfca758ec0e7426e69c6299ae4202d4daf6d57d'
        '2da39cc99b576ac0c3052489d91a01623aee24dbf835a8ef96e2095a19c9505bc78b63eadc9e5f79937737e02be0292894397e14a8e4da73fbab30d47004a50e'
        '6f65065fff93d97ff528aafbf4d5b891587263162003681c8ec59f932673d4484237cbea4a32680d1c7d3d78d97ccfd9ea8d816bf740dd638929df3a5ad88034'
        'ee32f841a33e3c71bc957ef622fdc93fc4779b0cb593ddae0c85e4d573e2339f0a0b2630874a504bb180cafcd3b4229bdcefff349ad4f46466d49539693036a4'
        '955d2447f08f6762ba23f67796b34bba466dc8860d389fd7899ac0b68ac9153770757205d965056a5161b7515042a722a7dd683149b3dee3a777453ec2b2b34d')


prepare() {
  cd $pkgname
  git submodule sync --recursive; git submodule foreach -q git config remote.origin.url; git submodule update --init --recursive --remote
  git checkout $pkgver
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
